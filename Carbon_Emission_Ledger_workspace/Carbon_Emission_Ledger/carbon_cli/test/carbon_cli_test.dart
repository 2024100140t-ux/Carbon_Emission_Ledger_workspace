import 'package:carbon_api/carbon_api.dart';
import 'package:carbon_cli/carbon_cli.dart';
import 'package:test/test.dart';

void main() {
  group('Carbon CLI Command Suite', () {
    test('Query command has correct metadata', () {
      final command = QueryCommand();

      expect(command.name, equals('query'));
      expect(command.description, equals('Fetch the latest carbon intensity.'));
    });

    test('Help command has correct metadata', () {
      final command = HelpCommand();

      expect(command.name, equals('help'));
      expect(
        command.description,
        equals('Display available Carbon Ledger commands.'),
      );
    });

    test('CliCommand supports polymorphism', () {
      final commands = <CliCommand>[QueryCommand(), HelpCommand()];

      expect(commands.length, equals(2));
      expect(commands[0].name, equals('query'));
      expect(commands[1].name, equals('help'));
    });

    test('Carbon API exception is available', () {
      final exception = CarbonLedgerException('Test carbon ledger exception');

      expect(exception.toString(), contains('CarbonLedgerException'));
    });
  });
}
