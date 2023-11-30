import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/screens/home/views/home_view.dart';
import '../../features/authentication/presentation/screens/sign_in/views/sign_in_view.dart';
import '../../features/authentication/presentation/screens/splash/views/splash_view.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (context) => const SplashView(),
    Routes.signIn: (context) => const SingInView(),
    Routes.home: (context) => const HomeView(),
  };
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.splash,
      name: Routes.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: Routes.signIn,
      name: Routes.signIn,
      builder: (context, state) => const SingInView(),
    ),
    GoRoute(
      path: Routes.home,
      name: Routes.home,
      builder: (context, state) => const HomeView(),
    ),
  ],
);
