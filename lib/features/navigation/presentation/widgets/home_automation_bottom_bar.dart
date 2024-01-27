import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:home_automation_app/features/shared/widgets/flicky_animated_icons.dart';
import 'package:home_automation_app/styles/styles.dart';

class HomeAutomationBottomBar extends ConsumerWidget {
  const HomeAutomationBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final barItem = ref.watch(bottomBarVMProvider);
    return Container(
      padding: HomeAutomationStyles.xsmallPadding,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: barItem
            .map((e) {
              return Container(
                margin: const EdgeInsets.only(
                    bottom: HomeAutomationStyles.smallSize),
                child: IconButton(
                  icon: FlickyAnimatedIcons(
                    icons: e.iconOption,
                    isSelected: e.isSelected,
                  ),
                  onPressed: () {
                    ref.read(bottomBarVMProvider.notifier).selectedItem(e);
                  },
                ),
              );
            })
            .toList()
            .animate(interval: 200.ms)
            .slideY(
              begin: 1,
              end: 0,
              duration: .5.seconds,
              curve: Curves.easeInOut,
            ),
      ),
    );
  }
}
