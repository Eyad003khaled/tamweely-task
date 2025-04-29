import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CompanyInfo extends StatelessWidget {
  final String title;
  final String description;
  

  const CompanyInfo({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.manropeBoldstyle14.copyWith(fontSize: 18),
        ),
        const Divider(
          color: AppColors.textColor,
          endIndent: 165,
          thickness: 1.5,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(description,
            style: AppTextStyles.manropeRegularstyle14
                .copyWith(fontSize: 16, color: AppColors.textColor)),
      ],
    );
  }
}
