// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tamweely_task/core/utils/app_text_styles.dart';
import 'package:tamweely_task/core/widgets/custom_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_strings.dart';
import '../product_description_sheet.dart';

class CustomProductsListViewItem extends StatelessWidget {
  final String productName;
  final String imagePath;
  final String productDescrption;

  const CustomProductsListViewItem({
    super.key,
    required this.productName,
    required this.productDescrption,
    required this.imagePath,
  });

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
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  imagePath,
                  width: 90,
                  height: 110,
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
                    Text(productName,
                        style: AppTextStyles.manropeBoldstyle14.copyWith(
                            color: AppColors.defaultColor,
                            fontSize: AppDimensions.fontSizeLarge16)),
                    const SizedBox(height: 4),
                    Text(
                      productDescrption,
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
                          text: AppStrings.more,
                          width: 100,
                          height: 30,
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              isScrollControlled: true,
                              builder: (context) => ProductDescriptionSheet(
                                productName: productName,
                                productDescription: productDescrption,
                              ),
                            );
                          },
                        )),
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
