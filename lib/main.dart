import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/database/cache_helper/cache_helper.dart';
import 'core/database/sqf_helper/sqf_helper.dart';
import 'core/services/service_locator.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();
  sl<SqfliteHelper>().intiDB();


  runApp(const MyApp());
}

