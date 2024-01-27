import 'package:flutter/material.dart';
import 'package:home_automation_app/features/navigation/presentation/widgets/home_automation_appbar.dart';
import 'package:home_automation_app/features/navigation/presentation/widgets/home_automation_bottom_bar.dart';
import 'package:home_automation_app/features/navigation/presentation/widgets/side_menu_drawer.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAutomationAppBar(),
      drawer: const Drawer(
        child: SideMenuDrawer(),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: SafeArea(child: child),
          ),
          const HomeAutomationBottomBar()
        ],
      ),
    );
  }
}
