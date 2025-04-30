// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, unnecessary_cast

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomSubjectDropdown extends StatefulWidget {
  final double width;
  final double height;
  final String Title;
  final String hintText;
  final TextEditingController? controller;

  const CustomSubjectDropdown({
    super.key,
    this.width = double.infinity,
    this.height = 60.0,
    required this.Title,
    required this.hintText,
    this.controller,
  });

  @override
  _CustomSubjectDropdownState createState() => _CustomSubjectDropdownState();
}

class _CustomSubjectDropdownState extends State<CustomSubjectDropdown>
    with SingleTickerProviderStateMixin {
  String? selectedSubject;
  bool _visible = false;

  // Subject list tailored for financial services
  final List<Map<String, String>> subjects = [
    {'Subject': "Loan Application Issue"},
    {'Subject': "Interest Rate or Fees Concern"},
    {'Subject': "Account Login or Access Issue"},
    {'Subject': "Branch or Field Agent Complaint"},
    {'Subject': "Fraud or Suspicious Activity"},
    {'Subject': "Mobile App Bug or Technical Issue"},
  ];

  @override
  void initState() {
    super.initState();

    // Trigger fade-in animation shortly after widget is built
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _visible = true;
      });
    });

    // Sync controller with selected value if needed
    if (widget.controller != null) {
      widget.controller!.text = selectedSubject ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.Title,
            style: AppTextStyles.manropeBoldstyle14.copyWith(
              color: AppColors.defaultColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
              border: Border.all(
                color: AppColors.textColor,
                width: 1.5,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                items: subjects.map((subject) {
                  return DropdownMenuItem<String>(
                    value: subject['Subject'],
                    child: DropdownItem(subject['Subject']!),
                  );
                }).toList(),
                value: selectedSubject,
                hint: Text(
                  widget.hintText,
                  style: AppTextStyles.manropeRegularstyle14.copyWith(
                    color: AppColors.defaultColor,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedSubject = value as String?;
                  });

                  if (kDebugMode) {
                    print("Selected subject: $selectedSubject");
                  }

                  if (widget.controller != null) {
                    widget.controller!.text = selectedSubject ?? '';
                  }
                },
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.defaultButton,
                  ),
                  iconSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget DropdownItem(String Subject) {
    return Row(
      children: [
        Text(
          Subject,
          style: AppTextStyles.manropeRegularstyle14.copyWith(
            color: AppColors.textColor,
          ),
        ),
        
      ],
    );
  }
}
