import 'package:flutter/material.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:rive/rive.dart' as rive;

class FlickyAnimatedIcons extends StatefulWidget {
  const FlickyAnimatedIcons({
    super.key,
    required this.icons,
    this.size = FlickyAnimatedIconSizes.small,
    this.isSelected = false,
  });

  final FlickyAnimatedIconOptions icons;
  final FlickyAnimatedIconSizes size;
  final bool isSelected;

  @override
  State<FlickyAnimatedIcons> createState() => _FlickyAnimatedIconsState();
}

class _FlickyAnimatedIconsState extends State<FlickyAnimatedIcons> {
  late rive.StateMachineController smController;
  late rive.RiveAnimation animation;
  Map<Brightness, rive.SMIBool> state = {};
  bool isInitialize = false;

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      'assets/anims/flicky.riv',
      artboard: widget.icons.name,
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(rive.Artboard artboard) {
    smController = rive.StateMachineController.fromArtboard(
      artboard,
      widget.icons.name,
    )!;

    artboard.addController(smController);

    for (var theme in Brightness.values) {
      state[theme] = smController.findInput<bool>(theme.name) as rive.SMIBool;
      state[theme]!.value = false;
    }

    setState(() {
      isInitialize = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.platformBrightnessOf(context);

    if (isInitialize) {
      for (var valueThemes in Brightness.values) {
        state[valueThemes]!.value = widget.isSelected && theme == valueThemes;
      }
    }
    return SizedBox(
      height: widget.size.value,
      width: widget.size.value,
      child: animation,
    );
  }

  @override
  void dispose() {
    smController.dispose();
    super.dispose();
  }
}
