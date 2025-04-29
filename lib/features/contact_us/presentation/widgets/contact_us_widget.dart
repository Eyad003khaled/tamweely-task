// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamweely_task/core/utils/app_assets.dart';
import 'package:tamweely_task/core/utils/app_strings.dart';
import 'package:tamweely_task/core/utils/app_text_styles.dart';
import 'package:tamweely_task/core/widgets/custom_button.dart';
import 'package:tamweely_task/features/contact_us/presentation/widgets/custom_message_input_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/services/responsive_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dimensions.dart';
import '../../../../core/widgets/custom_user_input_field.dart';
import 'contact_info.dart';

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppDimensions.paddingSizeExtraLarge,
              right: AppDimensions.paddingSizeExtraLarge,
              top: AppDimensions.paddingSizeTop),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                AppStrings.contactUs,
                style: AppTextStyles.manropeBoldstyle14.copyWith(
                  fontSize: 28,
                  color: AppColors.defaultColor,
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.04),
              ),
              const ContactInfo(
                  iconPath: AppImages.iconsPhone, text: AppStrings.phoneNumber,isPhone: true,),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.02),
              ),
              const ContactInfo(
                  iconPath: AppImages.iconsEmail, text: AppStrings.email,isPhone: false,),
              const SizedBox(height: 20),
              CustomUserInputField(
                hinttext: AppStrings.name,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              CustomUserInputField(
                hinttext: AppStrings.phone,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              CustomMessageInputField(
                hinttext: AppStrings.message,
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: AppStrings.send,
                width: 170,
                height: 50,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Uri whatsappUrl =
              Uri.parse("https://wa.me/201234567890"); //Replace with Actual Phone Number

          if (await canLaunchUrl(whatsappUrl)) {
            await launchUrl(
              whatsappUrl,
              mode: LaunchMode
                  .externalApplication, // Open directly in WhatsApp app
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Could not open WhatsApp")),
            );
          }
        },
        backgroundColor: AppColors.defaultColor,
        child: SvgPicture.asset(
          AppImages.iconsWhatsapp, 
          width: 24,
          height: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}

