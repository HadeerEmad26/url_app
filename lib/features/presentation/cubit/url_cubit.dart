import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_app/core/database/sqf_helper/sqf_helper.dart';
import 'package:url_app/core/routes/app_routes.dart';
import 'package:url_app/core/utils/app_strings.dart';
import 'package:url_app/core/utils/commens.dart';
import 'package:url_app/features/presentation/cubit/url_state.dart';

class UrlCubit extends Cubit<UrlState> {
  UrlCubit() : super(UrlInitial());


  GlobalKey<FormState> urlKey = GlobalKey<FormState>();


  TextEditingController baseUrlController = TextEditingController();




  void baseUrl(context){
    if (baseUrlController.text.isEmpty) {



    }
           //  SqfliteHelper.saveNewHost(baseUrlController.text);
           //  AppStrings.baseUrl = baseUrlController.text;
           //
           // emit(EnterBaseUrlSuccessState());

           navigateReplacement(context: context, route: Routes.loginScreen, arguments: {},);
  }


}
