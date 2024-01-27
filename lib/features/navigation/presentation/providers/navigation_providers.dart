import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/navigation/data/models/side_menu_item.dart';
import 'package:home_automation_app/features/navigation/data/repositories/bottom_nav_bar.repository.dart';
import 'package:home_automation_app/features/navigation/presentation/viewmodels/bottom_bar.viewmodel.dart';

import '../../data/models/bottom_bar_nav_item.dart';
import '../../data/repositories/side_menu.repository.dart';

final bottomBarRepositoryProvider = Provider((ref) {
  return BottomNavBarRepository();
});

final bottomBarVMProvider =
    StateNotifierProvider<BottomBarViewModel, List<BottomBarNavItemModel>>(
        (ref) {
  final navItems = ref.read(bottomBarRepositoryProvider).getBottomBarNavItems();

  return BottomBarViewModel(navItems, ref);
});

final sideMenuRepositoryProvider = Provider((ref) {
  return SideMenuRepository();
});

final sideMenuProvider = Provider<List<SideMenuItem>>((ref) {
  return ref.read(sideMenuRepositoryProvider).getSideMenuItem();
});
