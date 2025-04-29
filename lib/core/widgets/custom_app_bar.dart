import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.defaultColor, // Adjust the color as needed
          size: 28.0, // Adjust the size as needed
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        title,
        style: AppTextStyles.manropeBoldstyle14.copyWith(
          fontSize: 28,
          color: AppColors.defaultColor,
        ),
      ),
      
      centerTitle: true,
    );
  }
  
}
