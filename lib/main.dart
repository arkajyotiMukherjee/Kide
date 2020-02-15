import 'package:flutter/material.dart';
import 'dart:async';
import 'package:Kide/pages/OnBoarding/OnBoarding.dart';
import 'package:Kide/util/constants.dart';
import './MyApp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SplashScreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      OnboardingMainPage.routeName: (BuildContext context) => new OnboardingMainPage(),
      MyApp.routeName: (BuildContext context) => new MyApp()
    },
  ));
}


