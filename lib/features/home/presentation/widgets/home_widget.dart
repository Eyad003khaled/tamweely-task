// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tamweely_task/core/utils/app_assets.dart';
import 'package:tamweely_task/core/utils/app_strings.dart';
import 'package:tamweely_task/core/widgets/custom_button.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/services/responsive_helper.dart';
import '../../../../core/utils/app_dimensions.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppDimensions.paddingSizeExtraLarge,
              right: AppDimensions.paddingSizeExtraLarge,
              top: AppDimensions.paddingSizeTop),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BounceInDown(
                child: Image.asset(
                  AppImages.imagesAppLogo,
                  // width: 200,
                  // height: 200,
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.08),
              ),
              FadeInRight(
                child: CustomButton(
                    text: AppStrings.contactUs,
                    icon: AppImages.iconsContactUs,
                    onPressed: () {
      
                 Navigator.pushNamed(context,AppRouter.contactUsScreen);
      
                    }),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.05),
              ),
              FadeInLeft(
                child: CustomButton(
                    text: AppStrings.products,
                    icon: AppImages.iconsProduct,
                    onPressed: () {
      
                      Navigator.pushNamed(context,AppRouter.productsScreen);
      
                    }),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.05),
              ),
              FadeInRight(
                child: CustomButton(
                    text: AppStrings.submitComplaint,
                    icon: AppImages.iconsComplaint,
                    onPressed: () {
      
      
                      Navigator.pushNamed(context,AppRouter.submitComplaintScreen);
                    }),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.05),
              ),
              FadeInLeft(
                child: CustomButton(
                    text: AppStrings.aboutCompany,
                    icon: AppImages.iconsCompany,
                    onPressed: () {
      
                      Navigator.pushNamed(context,AppRouter.aboutCompanyScreen);
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
