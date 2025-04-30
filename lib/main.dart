import 'package:flutter/material.dart';
import 'package:tamweely_task/app/tamweely.dart';

import 'core/database/cache/cache_helper.dart';
import 'core/services/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  await getIt<CacheHelper>().init();


  runApp(const Tamweely());
}
