import 'package:flutter/material.dart';
import 'package:tamweely_task/app/tamweely.dart';

import 'core/services/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();

  runApp(const Tamweely());
}
