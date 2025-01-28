import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_app/features/presentation/cubit/url_cubit.dart';

import 'app/app.dart';
import 'core/database/cache_helper/cache_helper.dart';
import 'core/database/sqf_helper/sqf_helper.dart';
import 'core/services/service_locator.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await CacheHelper.init();
  sl<SqfliteHelper>().intiDB();


  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => sl<UrlCubit>(),
        ),
      ],
      child: const MyApp()));
}

