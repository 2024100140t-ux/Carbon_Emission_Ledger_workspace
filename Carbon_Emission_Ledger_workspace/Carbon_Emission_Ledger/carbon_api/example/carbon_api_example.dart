import 'package:carbon_api/carbon_api.dart';

void main() {
  final example = CarbonRecord(
    id: 'DEMO-001',
    name: 'Carbon Emission Example',
    primaryValue: 180.0,
    unit: 'gCO2/kWh',
    index: 'moderate',
    from: '2026-08-24T15:00Z',
    to: '2026-08-24T15:30Z',
  );

  print(example.name);
  print('${example.primaryValue} ${example.unit}');
}
