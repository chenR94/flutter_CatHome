import 'package:cats_home/Routes.dart';
import 'package:cats_home/application.dart';
import 'package:cats_home/apppages.dart';
import 'package:cats_home/page/home/index.dart';
import 'package:cats_home/page/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.HOME,
    getPages: AppPages.pages,
    home: IndexPage(),
    defaultTransition: Transition.fade,
    theme: ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(primary: Color(0xff999999)),
    ),
  ));
}
