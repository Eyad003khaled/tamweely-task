import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class ContactInfo extends StatelessWidget {
  final String iconPath;
  final String text;
  final bool isPhone; 

  const ContactInfo({
    super.key,
    required this.iconPath,
    required this.text,
    required this.isPhone,
  });

  Future<void> _handleTap() async {
    final Uri uri = isPhone
        ? Uri(scheme: 'tel', path: text) // Dial
        : Uri(scheme: 'mailto', path: text); // Email

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleTap,
      borderRadius: BorderRadius.circular(12), 
      child: Row(
        children: [
          SvgPicture.asset(iconPath, width: 40, height: 40),
          const SizedBox(width: 30),
          Text(
            text,
            style: AppTextStyles.manropeBoldstyle14.copyWith(
              fontSize: 16,
              color: AppColors.defaultColor,
            ),
          ),
        ],
      ),
    );
  }
}
