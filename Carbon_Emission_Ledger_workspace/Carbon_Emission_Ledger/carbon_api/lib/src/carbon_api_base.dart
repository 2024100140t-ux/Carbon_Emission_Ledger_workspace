import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class CarbonLedgerException implements Exception {
  final String message;
  final Object? cause;

  CarbonLedgerException(this.message, [this.cause]);

  @override
  String toString() {
    if (cause != null) {
      return 'CarbonLedgerException: $message (Underlying: $cause)';
    }

    return 'CarbonLedgerException: $message';
  }
}

class CarbonRecord {
  final String id;
  final String name;
  final double primaryValue;
  final String unit;
  final String index;
  final String from;
  final String to;

  const CarbonRecord({
    required this.id,
    required this.name,
    required this.primaryValue,
    required this.unit,
    required this.index,
    required this.from,
    required this.to,
  });

  factory CarbonRecord.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'from': String from,
        'to': String to,
        'intensity': {
          'forecast': num forecast,
          'actual': num? actual,
          'index': String index,
        },
      } =>
        CarbonRecord(
          id: '$from-$to',
          name: 'Great Britain Carbon Intensity',
          primaryValue: (actual ?? forecast).toDouble(),
          unit: 'gCO2/kWh',
          index: index,
          from: from,
          to: to,
        ),
      _ => throw CarbonLedgerException(
        'Carbon API payload failed pattern validation.',
      ),
    };
  }
}

class CarbonApiClient {
  final http.Client _client;
  final Logger _logger = Logger('CarbonApiClient');

  static const String _authority = 'api.carbonintensity.org.uk';

  CarbonApiClient(this._client);

  Future<CarbonRecord> fetchMetadata(String query) async {
    _logger.info('Starting carbon intensity request: $query');

    final uri = Uri.https(_authority, '/intensity');

    try {
      final response = await _client
          .get(
            uri,
            headers: {
              'Accept': 'application/json',
              'User-Agent': 'Carbon-Emission-Ledger/1.0',
            },
          )
          .timeout(const Duration(seconds: 5));

      _logger.info('Carbon API response status: ${response.statusCode}');

      if (response.statusCode != 200) {
        throw CarbonLedgerException(
          'Remote server returned HTTP ${response.statusCode}.',
        );
      }

      final decoded = json.decode(response.body);

      if (decoded is! Map<String, dynamic>) {
        throw CarbonLedgerException('Unexpected JSON response structure.');
      }

      final data = decoded['data'];

      if (data is! List || data.isEmpty) {
        throw CarbonLedgerException(
          'Carbon API returned an empty data collection.',
        );
      }

      final firstItem = data.first;

      if (firstItem is! Map<String, dynamic>) {
        throw CarbonLedgerException(
          'Carbon API returned an invalid record structure.',
        );
      }

      return CarbonRecord.fromJson(firstItem);
    } on http.ClientException catch (e) {
      _logger.severe('Network communication failed.', e);

      throw CarbonLedgerException('Network communication failure occurred.', e);
    } on FormatException catch (e) {
      _logger.severe('JSON decoding failed.', e);

      throw CarbonLedgerException('The API returned invalid JSON.', e);
    } catch (e) {
      _logger.severe('Unexpected carbon processing failure.', e);

      rethrow;
    } finally {
      _logger.info('Carbon API request lifecycle completed.');
    }
  }
}
