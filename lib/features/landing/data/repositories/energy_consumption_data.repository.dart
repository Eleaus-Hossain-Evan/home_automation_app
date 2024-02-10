import 'dart:math';

import 'package:home_automation_app/features/landing/data/models/energy_consumption_value.dart';
import 'package:intl/intl.dart';

import '../models/energy_consumption.dart';

class EnergyConsumptionDataRepository {
  EnergyConsumption getEnergyConsumption() {
    List<EnergyConsumptionValue> consumptionValues = [];

    var date = DateTime.now();
    var random = Random();
    var thresholdValue = 70;
    var maxValue = 20;

    for (var i = 0; i < maxValue; i++) {
      double currentValue = random.nextInt(50) + 30;

      consumptionValues.add(EnergyConsumptionValue(
        day: DateFormat.E().format(date).substring(0, 2).toUpperCase(),
        value: currentValue,
        aboveThreshold: currentValue > thresholdValue,
      ));

      date = date.add(const Duration(days: 1));
    }

    return EnergyConsumption(values: consumptionValues);
  }
}
