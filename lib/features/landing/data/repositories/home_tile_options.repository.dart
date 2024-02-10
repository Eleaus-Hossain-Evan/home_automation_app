import 'package:flutter/material.dart';
import 'package:home_automation_app/features/landing/data/models/home_tile_option.dart';
import 'package:home_automation_app/styles/flicky_icons_icons.dart';

import '../../../../helpers/enums.dart';

class HomeTileOptionsRepository {
  List<HomeTileOption> getHomeTileOptions() {
    return [
      HomeTileOption(
        icon: Icons.lightbulb,
        label: "Add New Device",
        option: HomeTileOptions.addDevice,
      ),
      HomeTileOption(
        icon: FlickyIcons.oven,
        label: "Manage Devices",
        option: HomeTileOptions.manageDevices,
      ),
      HomeTileOption(
        icon: Icons.sensors,
        label: 'Test Connectivity',
        option: HomeTileOptions.manageDevices,
      ),
    ];
  }
}
