import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/app_dimensions.dart';

class ProductDescriptionSheet extends StatelessWidget {
  final String productName;
  final String productDescription;

  const ProductDescriptionSheet({
    super.key,
    required this.productName,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Text(
            productName,
            style: AppTextStyles.manropeBoldstyle14.copyWith(
              fontSize: AppDimensions.fontSizeLarge16,
              color: AppColors.defaultColor,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            productDescription,
            style: AppTextStyles.manropeMediumstyle14.copyWith(
              color: AppColors.textColor,
              fontSize: AppDimensions.fontSizeDefault14,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
