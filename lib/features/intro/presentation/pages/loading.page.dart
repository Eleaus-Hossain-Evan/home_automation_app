import 'package:flutter/material.dart';
import 'package:home_automation_app/styles/styles.dart';
import 'package:rive/rive.dart ' as rive;

class LoadingPage extends StatefulWidget {
  static const String route = '/loading';
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late rive.StateMachineController smController;
  late rive.RiveAnimation animation;
  late Map<Brightness, rive.SMIBool> states = {};
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      'assets/anims/flicky.riv',
      artboard: 'flickylogo',
      fit: BoxFit.fitHeight,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(rive.Artboard artboard) {
    smController =
        rive.StateMachineController.fromArtboard(artboard, 'flickylogo')!;

    artboard.addController(smController);
    // states[Theme.of(context).brightness] =
    //     smController.findInput<bool>('loaded') as rive.SMIBool;

    for (var theme in Brightness.values) {
      states[theme] = smController.findInput<bool>(theme.name) as rive.SMIBool;
      states[theme]!.value = false;
    }

    setState(() {
      isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.platformBrightnessOf(context);
    if (isInitialized) {
      for (var valueThemes in Brightness.values) {
        states[valueThemes]!.value = theme == valueThemes;
      }
    }
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: HomeAutomationStyles.loadingIconSize,
          height: HomeAutomationStyles.loadingIconSize,
          child: animation,
        ),
      ),
    );
  }
}
