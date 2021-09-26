import 'package:cats_home/page/home/index.dart';
import 'package:cats_home/page/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  static String login = '/';
  static String home = '/';

  static Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return IndexPage();
  });

  static void configureRoutes(FluroRouter router) {
    router.define(login, handler: _loginHandler);
  }
}
