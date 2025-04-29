// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamweely_task/core/services/responsive_helper.dart';

import 'package:tamweely_task/core/utils/app_text_styles.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  final bool isLoading;
  final String? icon;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.icon, this.width, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width ?? double.infinity,
      height: height ?? 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.defaultButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            :  Row(
                  mainAxisAlignment: icon != null
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  
                  children: [
                    Text(
                      text,
                      style: AppTextStyles.manropeBoldstyle14.copyWith(
                          color: AppColors.white,
                          fontSize: ResponsiveHelper.dynamicFont(context, 17)),
                    ),
                    if (icon != null) ...[
                      SvgPicture.asset(
                        icon!,
                        width: 30,
                        height: 30,
                        color: AppColors.white,
                      ),
                    ],
                  ],
                ),
              ),
    
    );
  }
}
