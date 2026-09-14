import 'package:carbon_api/carbon_api.dart';
import 'package:test/test.dart';

void main() {
  group('CarbonRecord Deserialisation Suite', () {
    test('Successfully parses carbon intensity payload', () {
      final mockJson = {
        'from': '2026-08-24T15:00Z',
        'to': '2026-08-24T15:30Z',
        'intensity': {'forecast': 180, 'actual': 175, 'index': 'moderate'},
      };

      final record = CarbonRecord.fromJson(mockJson);

      expect(record.id, equals('2026-08-24T15:00Z-2026-08-24T15:30Z'));
      expect(record.primaryValue, equals(175.0));
      expect(record.unit, equals('gCO2/kWh'));
      expect(record.index, equals('moderate'));
    });

    test('Uses forecast when actual is null', () {
      final mockJson = {
        'from': '2026-08-24T15:00Z',
        'to': '2026-08-24T15:30Z',
        'intensity': {'forecast': 200, 'actual': null, 'index': 'high'},
      };

      final record = CarbonRecord.fromJson(mockJson);

      expect(record.primaryValue, equals(200.0));
    });

    test('Throws CarbonLedgerException for malformed payload', () {
      final malformedJson = {'from': 'invalid', 'missing': 'fields'};

      expect(
        () => CarbonRecord.fromJson(malformedJson),
        throwsA(isA<CarbonLedgerException>()),
      );
    });
  });
}
