// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';



class AppRouter {



  // Generate routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {



      // case homeScreen:
      //   return fadeRoute(  const HomeScreen());

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
