import 'package:flutter/material.dart';
import 'package:kide/pages/OnBoarding/OnBoarding.dart';
import './MyApp.dart';

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


