import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_automation_app/features/landing/data/models/energy_consumption_value.dart';
import 'package:home_automation_app/styles/styles.dart';

class EnergyConsumptionColumn extends StatelessWidget {
  const EnergyConsumptionColumn({
    super.key,
    required this.consumption,
  });

  final EnergyConsumptionValue consumption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(HomeAutomationStyles.smallSize),
            width: 35,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.05),
              borderRadius:
                  BorderRadius.circular(HomeAutomationStyles.mediumRadius),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: const EdgeInsets.only(
                      top: HomeAutomationStyles.smallSize),
                  width: constraints.maxWidth,
                  height: (consumption.value / 100) * (constraints.maxHeight),
                  decoration: BoxDecoration(
                    color: consumption.aboveThreshold
                        ? Theme.of(context).colorScheme.primary.withOpacity(.5)
                        : Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(
                        HomeAutomationStyles.mediumRadius),
                  ),
                  child: Text(
                    '${consumption.value.toInt()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
                    .animate()
                    .scaleY(
                      alignment: Alignment.bottomCenter,
                      begin: 0.5,
                      end: 1,
                      duration: 0.5.seconds,
                      curve: Curves.easeInOut,
                    )
                    .fadeIn(
                      duration: 0.5.seconds,
                      curve: Curves.easeInOut,
                    );
              },
            ),
          ),
        ),
        Text(
          consumption.day,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ]
          .animate(interval: 200.ms)
          .scaleXY(
            alignment: Alignment.bottomCenter,
            begin: 0.5,
            end: 1,
            duration: 0.5.seconds,
            curve: Curves.easeInOut,
          )
          .fadeIn(
            duration: 0.5.seconds,
            curve: Curves.easeInOut,
          ),
    );
  }
}
