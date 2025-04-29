import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class Poster extends StatelessWidget {
  final String imagePath;
  const Poster({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}