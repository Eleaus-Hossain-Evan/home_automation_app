import 'package:flutter/material.dart';
import 'package:home_automation_app/features/landing/data/models/home_tile_option.dart';

import '../../../../styles/styles.dart';

class HomePageTile extends StatelessWidget {
  const HomePageTile({
    super.key,
    required this.tile,
    required this.onTap,
  });

  final HomeTileOption tile;
  final void Function(HomeTileOption) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: HomeAutomationStyles.smallSize),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(HomeAutomationStyles.smallRadius),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.15),
        child: InkWell(
          onTap: () => onTap(tile),
          child: Container(
            width: 150,
            padding: HomeAutomationStyles.mediumPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  tile.icon,
                  size: HomeAutomationStyles.mediumIconSize,
                  color: Theme.of(context).colorScheme.primary,
                ),
                HomeAutomationStyles.smallVGap,
                Text(tile.label,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
