import 'package:carbon_api/carbon_api.dart';

abstract class CliCommand {
  final String name;
  final String description;

  CliCommand(this.name, this.description);

  Future<void> execute(CarbonApiClient client, List<String> arguments);
}
