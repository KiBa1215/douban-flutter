
import 'package:flutter/widgets.dart';
import 'package:home_module/home_container.dart';
import 'package:splash_module/splash_module.dart';

class MyRouter {

  static const initialScreen = '/';

  final routers = {
    '/': (context) => MySplashScreen(),
    '/home': (context) => HomeContainer()
  };

  List<Route<dynamic>> generateRoutes(String initialRoute) {
    final routes = List<Route<dynamic>>();
    return routes;
  }
}