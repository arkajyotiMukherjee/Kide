import 'package:flutter/material.dart';
import 'dart:async';
import 'package:kide/pages/OnBoarding/OnBoarding.dart';
import 'package:kide/util/constants.dart';
import './MyApp.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      })
    ),
    routes: <String, WidgetBuilder>{
      Navigator.defaultRouteName: (BuildContext context) => new MyApp(),
      OnboardingMainPage.routeName: (BuildContext context) => new OnboardingMainPage(),
      MyApp.routeName: (BuildContext context) => new MyApp()
    },
  ));
}


