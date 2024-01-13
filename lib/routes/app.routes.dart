import 'package:go_router/go_router.dart';
import 'package:home_automation_app/features/intro/presentation/pages/loading.page.dart';
import 'package:home_automation_app/features/intro/presentation/pages/splash.page.dart';
import 'package:home_automation_app/features/landing/presentation/pages/home.page.dart';
import 'package:home_automation_app/helpers/utils.dart';

class AppRoutes {
  static final router = GoRouter(
    routerNeglect: true,
    initialLocation: SplashPage.route,
    navigatorKey: Utils.mainNav,
    routes: [
      GoRoute(
        parentNavigatorKey: Utils.mainNav,
        path: SplashPage.route,
        builder: (context, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        parentNavigatorKey: Utils.mainNav,
        path: LoadingPage.route,
        builder: (context, state) {
          return const LoadingPage();
        },
      ),
      GoRoute(
        parentNavigatorKey: Utils.mainNav,
        path: HomePage.route,
        builder: (context, state) {
          return const HomePage();
        },
      ),
    ],
  );
}
