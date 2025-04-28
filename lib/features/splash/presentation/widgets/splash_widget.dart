
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tamweely_task/features/splash/presentation/widgets/test_screen.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';


class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:AppImages.imagesAppLogo,
      nextScreen: const TestScreen(), 
      splashIconSize: double.infinity, 
      duration: 2000, 
      splashTransition: SplashTransition.scaleTransition, 
      backgroundColor: AppColors.white,
    );


  }
}
