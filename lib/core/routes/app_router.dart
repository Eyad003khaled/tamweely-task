// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tamweely_task/features/contact_us/presentation/screens/contact_us_screen.dart';

import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../functions/animations/animation.dart';

class AppRouter {
  // Route names
  static const String splashScreen = '/splash';
  static const String homeScreen = '/home';
  static const String contactUsScreen = '/contactUs';

  // Generate routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return fadeRoute(const SplashScreen());

      case homeScreen:
        return slideRoute(  const HomeScreen());
      case contactUsScreen:
        return fadeRoute(  const ContactUsScreen());

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
