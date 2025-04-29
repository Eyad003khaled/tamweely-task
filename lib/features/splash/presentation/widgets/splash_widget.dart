
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tamweely_task/features/home/presentation/screens/home_screen.dart';
import '../../../../core/services/responsive_helper.dart';
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
      nextScreen: const HomeScreen(), 
      splashIconSize: ResponsiveHelper.dynamicHeight(context, 0.3), 
      duration: 2000, 
      splashTransition: SplashTransition.scaleTransition, 
      backgroundColor: AppColors.white,
    );


  }
}
