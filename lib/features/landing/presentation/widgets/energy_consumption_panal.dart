import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/styles/styles.dart';

import '../providers/landing_providers.dart';
import 'energy_consumption_column.dart';

class EnergyConsumptionPanel extends ConsumerWidget {
  const EnergyConsumptionPanel({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final energyConsumption = ref.watch(energyConsumptionProvider);
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              HomeAutomationStyles.smallHGap,
              Icon(
                Icons.energy_savings_leaf,
                color: Theme.of(context).colorScheme.primary,
              ),
              HomeAutomationStyles.xsmallHGap,
              Text(
                'My Energy Consumption (kW)',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              )
            ]
                .animate(delay: 200.ms)
                .slideX(
                  begin: 0.25,
                  end: 0,
                  duration: 0.5.seconds,
                  curve: Curves.easeInOut,
                )
                .fadeIn(
                  duration: 0.5.seconds,
                  curve: Curves.easeInOut,
                ),
          ),
          // list of columns

          Expanded(
            child: ListView.builder(
              itemCount: energyConsumption.values.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                left: HomeAutomationStyles.mediumSize,
                bottom: HomeAutomationStyles.smallSize,
              ),
              itemBuilder: (BuildContext context, int index) {
                // value column
                return EnergyConsumptionColumn(
                  consumption: energyConsumption.values[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
