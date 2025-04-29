import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/responsive_helper.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomMessageInputField extends StatelessWidget {
  const CustomMessageInputField({
    super.key,
    required this.title,
    required this.hinttext,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.inputFormatters,
    this.maxLines = 10, // Added maxLines parameter
  });

  final String title;
  final String hinttext;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines; // To define the height of the input area

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(title, style: AppTextStyles.manropeBoldstyle14.copyWith(
            color: AppColors.defaultColor,
            fontSize: 16
          ),),
        SizedBox(height: ResponsiveHelper.dynamicHeight(context, 0.0075)),
        TextFormField(
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines, // Set the number of lines for the height
          inputFormatters: inputFormatters,
          controller: controller,
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(color: AppColors.defaultColor),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: ResponsiveHelper.dynamicHeight(context, 0.02),
              horizontal: ResponsiveHelper.dynamicHeight(context, 0.017),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.textColor,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: AppColors.defaultColor,
                width: 1.5,
              ),
            ),
          ),
          style: AppTextStyles.manropeRegularstyle14
              .copyWith(color: AppColors.textColor),
          textAlignVertical: TextAlignVertical.top,
        ),
      ],
    );
  }
}
