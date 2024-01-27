import 'package:home_automation_app/helpers/enums.dart';

class BottomBarNavItemModel {
  final FlickyAnimatedIconOptions iconOption;
  final String label;
  final String route;
  final bool isSelected;

  BottomBarNavItemModel({
    required this.iconOption,
    this.label = '',
    required this.route,
    this.isSelected = false,
  });

  BottomBarNavItemModel copyWith({
    FlickyAnimatedIconOptions? iconOption,
    String? label,
    String? route,
    bool? isSelected,
  }) {
    return BottomBarNavItemModel(
      iconOption: iconOption ?? this.iconOption,
      label: label ?? this.label,
      route: route ?? this.route,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
