import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'package:redacted/redacted.dart';
import '../../utils/app_dimensions.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_text_styles.dart';

class CustomRedactedProductItem extends StatelessWidget {
  const CustomRedactedProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
              left: AppDimensions.paddingSizeLarge,
              right: AppDimensions.paddingSizeLarge,
            ),
      child: SizedBox(
          height: 180,
          width: double.infinity,
          child: Card(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                color: AppColors.defaultColor,
                width: 2,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 92,
                      decoration: BoxDecoration(
                        color: AppColors.redactColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ).redacted(
                      context: context,
                      redact: true,
                      configuration: RedactedConfiguration(
                        redactedColor: AppColors.redactColor,
                        animationDuration: const Duration(milliseconds: 300),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Product details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Text(AppStrings.shortPlaceholder,
                                  style: AppTextStyles.manropeBoldstyle14
                                      .copyWith(
                                          color: AppColors.defaultColor,
                                          fontSize:
                                              AppDimensions.fontSizeLarge16))
                              .redacted(
                            context: context,
                            redact: true,
                            configuration: RedactedConfiguration(
                              redactedColor: AppColors.redactColor,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            AppStrings.longPlaceholder,
                            style: AppTextStyles.manropeMediumstyle14.copyWith(
                              color: AppColors.textColor,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ).redacted(
                            context: context,
                            redact: true,
                            configuration: RedactedConfiguration(
                              redactedColor: AppColors.redactColor,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                            ),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: const SizedBox(
                              width: 100,
                              height: 30,
                            ).redacted(
                              context: context,
                              redact: true,
                              configuration: RedactedConfiguration(
                                redactedColor: AppColors.redactColor,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          )),
    );
  }
}
