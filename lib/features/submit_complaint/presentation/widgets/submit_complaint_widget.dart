import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tamweely_task/core/utils/app_strings.dart';
import 'package:tamweely_task/core/widgets/custom_app_bar.dart';

import '../../../../core/services/responsive_helper.dart';
import '../../../../core/utils/app_dimensions.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_subject_dropdown.dart';
import '../../../../core/widgets/custom_user_input_field.dart';
import '../../../../core/widgets/custom_message_input_field.dart';

class SubmitComplaintWidget extends StatelessWidget {
  const SubmitComplaintWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBar(title: AppStrings.submitComplaint),
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
                  controller: TextEditingController(),
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
                  controller: TextEditingController(),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.03),
              ),
              SlideInLeft(
                child: const CustomSubjectDropdown(
                  Title: AppStrings.complaintType,
                  hintText: AppStrings.chooseComplaintType,
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
                  controller: TextEditingController(),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.dynamicHeight(context, 0.03),
              ),
              FadeInUp(
                child: CustomButton(
                  text: AppStrings.submit,
                  onPressed: () {},
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
