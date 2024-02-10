import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/landing/presentation/providers/landing_providers.dart';
import 'package:home_automation_app/styles/styles.dart';

import 'home_page_tile.dart';

class HomeTileOptionsPanel extends ConsumerWidget {
  const HomeTileOptionsPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeTile = ref.watch(homeTileOptionsVMProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            HomeAutomationStyles.mediumHGap,
            Icon(
              Icons.check_circle_outline,
              color: Theme.of(context).colorScheme.primary,
            ),
            HomeAutomationStyles.xxsmallHGap,
            Text("Quick Actions",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    )),
          ],
        )
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
        HomeAutomationStyles.xsmallVGap,
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsets.only(left: HomeAutomationStyles.mediumSize),
            children: [
              for (final tile in homeTile)
                HomePageTile(
                  tile: tile,
                  onTap: (selectedTile) {
                    ref
                        .read(homeTileOptionsVMProvider.notifier)
                        .onTileSelected(selectedTile);
                  },
                )
            ]
                .animate(interval: 200.ms)
                .scaleXY(
                    begin: 0.5,
                    end: 1,
                    duration: 0.5.seconds,
                    curve: Curves.easeInOut)
                .fadeIn(duration: 0.5.seconds, curve: Curves.easeInOut),
          ),
        ),
      ],
    );
  }
}
