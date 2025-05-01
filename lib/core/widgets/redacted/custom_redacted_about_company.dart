// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';
import 'package:tamweely_task/core/utils/app_strings.dart';
import '../../../features/about_company/presentation/widgets/sections/company_info.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_dimensions.dart';

class CustomRedactedAboutCompany extends StatelessWidget {
  const CustomRedactedAboutCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppDimensions.paddingSizeExtraLarge,
              ),
               Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textColor.withOpacity(0.4),
                      spreadRadius: 4,
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                
              ).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  redactedColor: AppColors.redactColor,
                  animationDuration: const Duration(milliseconds: 300),
                ),
              ),
              const SizedBox(
                height: AppDimensions.paddingSizeExtraLarge,
              ),
              const CompanyInfo(
                title: AppStrings.companyOverview,
                description: AppStrings.companyOverviewDesc,
              ).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  redactedColor: AppColors.redactColor,
                  animationDuration: const Duration(milliseconds: 300),
                ),
              ),
              const SizedBox(
                height: AppDimensions.paddingSizeExtraLarge,
              ),
              const CompanyInfo(
                      title: AppStrings.mission,
                      description: AppStrings.missionDesc)
                  .redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  redactedColor: AppColors.redactColor,
                  animationDuration: const Duration(milliseconds: 300),
                ),
              ),
              const SizedBox(
                height: AppDimensions.paddingSizeExtraLarge,
              ),
              const CompanyInfo(
                      title: AppStrings.vision,
                      description: AppStrings.missionDesc)
                  .redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  redactedColor: AppColors.redactColor,
                  animationDuration: const Duration(milliseconds: 300),
                ),
              ),
              const SizedBox(
                height: AppDimensions.paddingSizeExtraLarge,
              ),
               Container(
                height: 250,
                width: double.infinity,
              ).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  redactedColor: AppColors.redactColor,
                  animationDuration: const Duration(milliseconds: 300),
                ),
              ),
              const SizedBox(
                height: AppDimensions.paddingSizeExtraLarge,
              ),
            ],
        
    );
  }
}
