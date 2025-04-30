// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamweely_task/core/functions/toast/custom_toast.dart';
import 'package:tamweely_task/core/utils/app_assets.dart';
import 'package:tamweely_task/core/utils/app_strings.dart';
import 'package:tamweely_task/core/widgets/custom_app_bar.dart';
import 'package:tamweely_task/core/widgets/custom_button.dart';
import 'package:tamweely_task/core/widgets/custom_message_input_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../connection/network_info.dart';
import '../../../../core/services/injection.dart';
import '../../../../core/services/responsive_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dimensions.dart';
import '../../../../core/widgets/custom_user_input_field.dart';
import 'contact_info.dart';

class ContactUsWidget extends StatefulWidget {
  const ContactUsWidget({super.key});

  @override
  State<ContactUsWidget> createState() => _ContactUsWidgetState();
}

class _ContactUsWidgetState extends State<ContactUsWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool isLoading = false;

  Future<void> _handleSubmit() async {
    setState(() {
      isLoading = true;
    });
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final message = messageController.text.trim();

    final isConnected = await getIt<NetworkInfo>().isConnected;

    if (!isConnected!) {
      setState(() {
        isLoading = false;
      });
      showToast(
          false, AppStrings.noInternetTitle, AppStrings.noInternetSubtitle);
      return;
    }


    if (name.isEmpty || phone.isEmpty || message.isEmpty) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        isLoading = false;
        showToast(false, AppStrings.contactUsErrorTitle,
            AppStrings.contactUsErrorSubtitle);
      });
    } else {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        isLoading = false;
        showToast(true, AppStrings.contactUsSuccessTitle,
            AppStrings.contactUsSuccessSubtitle);
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

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
              SizedBox(height: ResponsiveHelper.dynamicHeight(context, 0.03)),
              FadeInRight(
                child: const ContactInfo(
                  iconPath: AppImages.iconsEmail,
                  text: AppStrings.email,
                  isPhone: false,
                ),
              ),
              SizedBox(height: ResponsiveHelper.dynamicHeight(context, 0.03)),
              FadeInLeft(
                child: CustomUserInputField(
                  title: AppStrings.name,
                  hintText: AppStrings.enterName,
                  keyboardType: TextInputType.name,
                  controller: nameController,
                ),
              ),
              SizedBox(height: ResponsiveHelper.dynamicHeight(context, 0.03)),
              FadeInRight(
                child: CustomUserInputField(
                  title: AppStrings.phone,
                  hintText: AppStrings.enterPhone,
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                ),
              ),
              SizedBox(height: ResponsiveHelper.dynamicHeight(context, 0.03)),
              FadeInLeft(
                child: CustomMessageInputField(
                  title: AppStrings.message,
                  hinttext: AppStrings.enterMessage,
                  controller: messageController,
                ),
              ),
              SizedBox(height: ResponsiveHelper.dynamicHeight(context, 0.02)),
              FadeInUp(
                child: CustomButton(
                  text: AppStrings.send,
                  width: 170,
                  height: 50,
                  onPressed: isLoading ? null : _handleSubmit,
                  isLoading: isLoading,
                ),
              ),
              SizedBox(height: ResponsiveHelper.dynamicHeight(context, 0.03)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () async {
          final Uri whatsappUrl = Uri.parse("https://wa.me/201234567890");
          if (await canLaunchUrl(whatsappUrl)) {
            await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
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
