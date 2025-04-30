// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tamweely_task/core/utils/app_text_styles.dart';
import 'package:tamweely_task/core/widgets/custom_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_dimensions.dart';




class CustomProductsListViewItem extends StatelessWidget {
  const CustomProductsListViewItem({
    super.key,
    required this.product,
  });

  final Map<String, String> product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 150,
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
              // Image placeholder
              ClipRect(
                child: Image.asset(
                  product['image']!,
                  width: 90,
                  height: 92,
                  fit: BoxFit.fill,
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
                    Text(product['title']!,
                        style: AppTextStyles.manropeBoldstyle14.copyWith(
                          color: AppColors.defaultColor,
                          fontSize: AppDimensions.fontSizeLarge16)),
                    const SizedBox(height: 4),
                    Text(
                      product['description']!,
                      style: AppTextStyles.manropeMediumstyle14.copyWith(
                        color: AppColors.textColor,
                        ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                   const Spacer(),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: CustomButton(
                            text: "More",
                            width: 100,
                            height: 30,
                            onPressed: () {})),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
