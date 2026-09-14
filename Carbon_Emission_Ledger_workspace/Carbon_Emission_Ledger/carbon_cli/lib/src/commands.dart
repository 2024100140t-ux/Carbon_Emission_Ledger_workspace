import 'package:carbon_api/carbon_api.dart';
import 'package:terminal_colors/terminal_colors.dart';

import 'command_base.dart';

class QueryCommand extends CliCommand {
  QueryCommand() : super('query', 'Fetch the latest carbon intensity.');

  @override
  Future<void> execute(CarbonApiClient client, List<String> arguments) async {
    try {
      final target = arguments.isEmpty ? 'latest' : arguments.first;

      final result = await client.fetchMetadata(target);

      final buffer = StringBuffer()
        ..writeln('--- CARBON EMISSION LEDGER ---'.styleHeader)
        ..writeln('Record ID:  ${result.id}')
        ..writeln('Source:     ${result.name}')
        ..writeln('Intensity: ${result.primaryValue} ${result.unit}')
        ..writeln('Index:      ${result.index}')
        ..writeln('From:       ${result.from}')
        ..writeln('To:         ${result.to}')
        ..writeln('-------------------------------'.styleHeader);

      print(buffer.toString());
    } on CarbonLedgerException catch (e) {
      print('Operation Failed: ${e.message}'.styleError);
    }
  }
}

class HelpCommand extends CliCommand {
  HelpCommand() : super('help', 'Display available Carbon Ledger commands.');

  @override
  Future<void> execute(CarbonApiClient client, List<String> arguments) async {
    final buffer = StringBuffer()
      ..writeln('--- CARBON LEDGER HELP ---'.styleHeader)
      ..writeln('query - Fetch latest carbon intensity')
      ..writeln('help  - Display available commands')
      ..writeln('exit  - Close the Carbon Ledger')
      ..writeln('--------------------------'.styleHeader);

    print(buffer.toString());
  }
}
