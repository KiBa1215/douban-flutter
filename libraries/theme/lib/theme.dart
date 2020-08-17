library theme;

import 'package:flutter/material.dart';

var defaultTheme = ThemeData(
  accentColor: Color.fromARGB(255, 29, 189, 92),
  backgroundColor: Colors.grey.shade100,
  primaryColor: Colors.white,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    ),
  ),
);
