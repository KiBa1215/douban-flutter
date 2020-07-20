import 'package:base_module/base_module.dart';
import 'package:douban/routers.dart';
import 'package:flutter/material.dart';

void main() {
  final route = MyRouter();
  runApp(MaterialApp(
    routes: route.routers,
    initialRoute: MyRouter.initialScreen,
//    onGenerateInitialRoutes: route.generateRoutes,
    theme: defaultTheme,
  ));
}
