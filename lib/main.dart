import 'package:barbearia_jl_app/app/routes/app_pages.dart';
import 'package:barbearia_jl_app/app/routes/app_routes.dart';
import 'package:barbearia_jl_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init('barbearia-jl');
  runApp(
    // ignore: prefer_const_constructors
    GetMaterialApp(
      title: "Barbearia JL APP",
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      initialRoute: Routes.INITIAL,
      getPages: AppPages.routes,
      // initialBinding: ,
    )
    );
}

