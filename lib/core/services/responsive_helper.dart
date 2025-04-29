// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ResponsiveHelper {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double dynamicWidth(BuildContext context, double value) =>
      screenWidth(context) * value;

  static double dynamicHeight(BuildContext context, double value) =>
      screenHeight(context) * value;

  static double dynamicFont(BuildContext context, double value) =>
      value * MediaQuery.of(context).textScaleFactor;
}
