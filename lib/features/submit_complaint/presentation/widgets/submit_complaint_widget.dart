import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tamweely_task/core/utils/app_strings.dart';
import 'package:tamweely_task/core/widgets/custom_app_bar.dart';

import '../../../../connection/network_info.dart';
import '../../../../core/functions/toast/custom_toast.dart';
import '../../../../core/services/injection.dart';
import '../../../../core/services/responsive_helper.dart';
import '../../../../core/utils/app_dimensions.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_subject_dropdown.dart';
import '../../../../core/widgets/custom_user_input_field.dart';
import '../../../../core/widgets/custom_message_input_field.dart';

class SubmitComplaintWidget extends StatefulWidget {
  const SubmitComplaintWidget({super.key});

  @override
  State<SubmitComplaintWidget> createState() => _SubmitComplaintWidgetState();
}

class _SubmitComplaintWidgetState extends State<SubmitComplaintWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController complaintTypeController = TextEditingController();

  bool isLoading = false;

  Future<void> _handleSubmit() async {
    setState(() {
      isLoading = true;
    });
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final complaintType = complaintTypeController.text.trim();
    final details = detailsController.text.trim();

    final isConnected = await getIt<NetworkInfo>().isConnected;

    if (!isConnected!) {
      setState(() {
        isLoading = false;
      });
      showToast(
          false, AppStrings.noInternetTitle, AppStrings.noInternetSubtitle);
      return;
    }

    if (name.isEmpty ||
        phone.isEmpty ||
        complaintType.isEmpty ||
        details.isEmpty) {
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
    complaintTypeController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.submitComplaint),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppDimensions.paddingSizeExtraLarge,
            right: AppDimensions.paddingSizeExtraLarge,
          ),
          child: Column(
            children: [
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.03),
              ),
              SlideInLeft(
                child: CustomUserInputField(
                  title: AppStrings.name,
                  hintText: AppStrings.enterName,
                  keyboardType: TextInputType.name,
                  controller: nameController,
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.03),
              ),
              SlideInRight(
                child: CustomUserInputField(
                  title: AppStrings.phone,
                  hintText: AppStrings.enterPhone,
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.03),
              ),
              SlideInLeft(
                child: CustomSubjectDropdown(
                  Title: AppStrings.complaintType,
                  hintText: AppStrings.chooseComplaintType,
                  controller: complaintTypeController,
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.03),
              ),
              SlideInRight(
                child: CustomMessageInputField(
                  title: AppStrings.details,
                  hinttext: AppStrings.complaintDescription,
                  keyboardType: TextInputType.multiline,
                  controller: detailsController,
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.03),
              ),
              FadeInUp(
                child: CustomButton(
                  text: AppStrings.submit,
                  onPressed: _handleSubmit,
                  isLoading: isLoading,
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.03),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
