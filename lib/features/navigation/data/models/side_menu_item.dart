import 'package:flutter/material.dart';

class SideMenuItem {
  final IconData icon;
  final String label;
  final String route;
  const SideMenuItem({
    required this.icon,
    required this.label,
    required this.route,
  });

  SideMenuItem copyWith({
    IconData? icon,
    String? label,
    String? route,
  }) {
    return SideMenuItem(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      route: route ?? this.route,
    );
  }
}
