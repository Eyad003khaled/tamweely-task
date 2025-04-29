// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamweely_task/core/utils/app_assets.dart';
import 'package:tamweely_task/core/utils/app_strings.dart';
import 'package:tamweely_task/core/widgets/custom_app_bar.dart';
import 'package:tamweely_task/core/widgets/custom_button.dart';
import 'package:tamweely_task/core/widgets/custom_message_input_field.dart';
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
      appBar: const CustomAppBar(
        title: AppStrings.contactUs,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppDimensions.paddingSizeExtraLarge,
              right: AppDimensions.paddingSizeExtraLarge,
              top: AppDimensions.paddingSizeExtraLarge),
          child: Column(
            children: [
              FadeInLeft(
                child: const ContactInfo(
                  iconPath: AppImages.iconsPhone,
                  text: AppStrings.phoneNumber,
                  isPhone: true,
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.03),
              ),
              FadeInRight(
                child: const ContactInfo(
                  iconPath: AppImages.iconsEmail,
                  text: AppStrings.email,
                  isPhone: false,
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.03),
              ),
              FadeInLeft(
                child: CustomUserInputField(
                  title: AppStrings.name,
                  hintText: AppStrings.enterName,
                  keyboardType: TextInputType.name,
                  controller: TextEditingController(),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.03),
              ),
              FadeInRight(
                child: CustomUserInputField(
                  title: AppStrings.phone,
                  hintText: AppStrings.enterPhone,
                  keyboardType: TextInputType.phone,
                  controller: TextEditingController(),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.03),
              ),
              FadeInLeft(
                child: CustomMessageInputField(
                  title: AppStrings.message,
                  hinttext: AppStrings.enterMessage,
                  controller: TextEditingController(),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.03),
              ),
              FadeInUp(
                child: CustomButton(
                  text: AppStrings.send,
                  width: 170,
                  height: 50,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Uri whatsappUrl = Uri.parse(
              "https://wa.me/201234567890"); //Replace with Actual Phone Number

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
        backgroundColor: AppColors.defaultButton,
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
