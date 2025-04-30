import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../core/routes/app_router.dart';

class Tamweely extends StatelessWidget {
  const Tamweely({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.splashScreen,
        onGenerateRoute: AppRouter.generateRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
