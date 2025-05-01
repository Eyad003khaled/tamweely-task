import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tamweely_task/app/tamweely.dart';

import 'core/database/cache/cache_helper.dart';
import 'core/services/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(); 
  initGetIt();
  await getIt<CacheHelper>().init();


  runApp(const Tamweely());
}
