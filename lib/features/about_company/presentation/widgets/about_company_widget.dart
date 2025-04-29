import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:tamweely_task/core/utils/app_assets.dart';
import 'package:tamweely_task/core/utils/app_strings.dart';
import 'package:tamweely_task/core/widgets/custom_app_bar.dart';
import 'package:tamweely_task/features/about_company/presentation/widgets/sections/company_info.dart';

import '../../../../core/utils/app_dimensions.dart';
import 'sections/google_maps.dart';
import 'sections/poster.dart';

class AboutCompanyWidget extends StatelessWidget {
  const AboutCompanyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: AppStrings.aboutCompany),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppDimensions.paddingSizeExtraLarge,
            right: AppDimensions.paddingSizeExtraLarge,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppDimensions.paddingSizeExtraLarge,
              ),
              ZoomIn(child: const Poster(imagePath: AppImages.imagesCompanyPoster,)),
              const SizedBox(
                height: AppDimensions.paddingSizeExtraLarge,
              ),
            FadeIn(
              child: const CompanyInfo(
                    title: AppStrings.companyOverview,
                    description: AppStrings.companyOverviewDesc,),
            ),
              const SizedBox(
                height: AppDimensions.paddingSizeExtraLarge,
              ),
              FadeIn(
                child: const CompanyInfo(
                    title: AppStrings.mission,
                    description: AppStrings.missionDesc),
              ),
              const SizedBox(
                height: AppDimensions.paddingSizeExtraLarge,
              ),
              FadeIn(
                child: const CompanyInfo(
                    title: AppStrings.vision,
                    description: AppStrings.visionDesc),
              ),
              const SizedBox(
                height: AppDimensions.paddingSizeExtraLarge,
              ),
              const SizedBox(
                height:250,
                width:double.infinity,
                child: StaticMapScreen()),
              const SizedBox(
                height: AppDimensions.paddingSizeExtraLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


