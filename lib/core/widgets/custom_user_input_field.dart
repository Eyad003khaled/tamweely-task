import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tamweely_task/core/utils/app_text_styles.dart';

import '../../../../core/services/responsive_helper.dart';
import '../../../../core/utils/app_colors.dart';

class CustomUserInputField extends StatelessWidget {
  const CustomUserInputField(
      {super.key,
      required this.hinttext,
      required this.controller, this.keyboardType = TextInputType.text, this.maxLength, this.inputFormatters});
  final String hinttext;
  final TextEditingController? controller;
    final TextInputType? keyboardType;
  final int? maxLength;  // Add maxLength as a parameter
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        TextFormField(
          keyboardType: keyboardType,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          controller: controller,
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(color: AppColors.defaultColor),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(
                vertical: ResponsiveHelper.dynamicHeight(context, 0.015),
                horizontal:
                    ResponsiveHelper.dynamicHeight(context, 0.017)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: AppColors.textColor,
                  width: 1.5,
                )
                // Set border color here
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.defaultColor,
                width: 1.5,
              ), // Color when focused
            ),
          ),
          style: AppTextStyles.manropeRegularstyle14
              .copyWith(color: AppColors.textColor,fontSize: 16),
        ),
      ],
    );
  }
}
