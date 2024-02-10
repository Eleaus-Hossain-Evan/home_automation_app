import 'package:flutter/material.dart';
import 'package:home_automation_app/styles/styles.dart';

import '../widgets/energy_consumption_panal.dart';
import '../widgets/home_page_header.dart';
import '../widgets/home_tile_options_panel.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flex(
      direction: Axis.vertical,
      children: [
        Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomePageHeader(),
            HomeAutomationStyles.smallVGap,
            HomeTileOptionsPanel()
          ],
        ),
        EnergyConsumptionPanel(),
      ],
    );
  }
}
