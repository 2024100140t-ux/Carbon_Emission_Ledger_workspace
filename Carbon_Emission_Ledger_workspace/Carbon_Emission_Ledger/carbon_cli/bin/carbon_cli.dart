import 'dart:io';

import 'package:carbon_api/carbon_api.dart';
import 'package:carbon_cli/carbon_cli.dart';
import 'package:http/http.dart' as http;
import 'package:terminal_colors/terminal_colors.dart';

Future<void> main() async {
  configureSystemTelemetry();

  final httpClient = http.Client();
  final carbonClient = CarbonApiClient(httpClient);

  final commands = <CliCommand>[QueryCommand(), HelpCommand()];

  print('========================================'.styleHeader);
  print('   CARBON EMISSION LEDGER CLI'.styleHeader);
  print('========================================'.styleHeader);
  print('Type "help" to see available commands.');

  try {
    while (true) {
      stdout.write('\ncarbon> ');

      final input = stdin.readLineSync();

      if (input == null) {
        break;
      }

      final trimmed = input.trim();

      if (trimmed.isEmpty) {
        continue;
      }

      if (trimmed.toLowerCase() == 'exit') {
        print('Exiting Carbon Emission Ledger...'.styleWarning);
        break;
      }

      final parts = trimmed.split(RegExp(r'\s+'));
      final commandName = parts.first.toLowerCase();
      final arguments = parts.sublist(1);

      CliCommand? selectedCommand;

      for (final command in commands) {
        if (command.name == commandName) {
          selectedCommand = command;
          break;
        }
      }

      if (selectedCommand == null) {
        print('Unknown command. Type "help".'.styleError);
        continue;
      }

      await selectedCommand.execute(carbonClient, arguments);
    }
  } finally {
    httpClient.close();

    print('Network client closed successfully.'.styleSuccess);
  }
}
