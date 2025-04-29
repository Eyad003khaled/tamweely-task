// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../functions/animations/animation.dart';

class AppRouter {
  // Route names
  static const String splashScreen = '/splash';
  static const String homeScreen = '/home';

  // Generate routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return fadeRoute(const SplashScreen());

      case homeScreen:
        return slideRoute(  const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
