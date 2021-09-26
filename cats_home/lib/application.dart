import 'package:cats_home/page/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    return MaterialApp(
      onGenerateRoute: router.generator,
    );
  }
}
