import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kide/pages/HomePage/Home.dart';
import 'package:kide/pages/OnBoarding/OnBoarding.dart';
import 'package:kide/providers/getEvents.dart';
import 'package:kide/providers/getMarkers.dart';
import 'package:kide/util/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyApp.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;
  bool runTime = false;
  startTime() async {
    if (runTime == true) 
      navigationMyApp();
    else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool firstTime = prefs.getBool('first_time');

      var _duration = new Duration(seconds: 2);

      if (firstTime != null && !firstTime) // Not first time
        return new Timer(_duration, navigationMyApp);
      else {                               // First time
        prefs.setBool('first_time', false);
        return new Timer(_duration, navigationOnBoarding);
      }
    }
  }

  void navigationMyApp() {
    setState(() {
      runTime = true;
    });
    Navigator.of(context).pushNamed(HomePage.routeName);
  }

  void navigationOnBoarding() {
    setState(() {
      runTime = true;
    });
    Navigator.of(context).pushNamed(OnboardingMainPage.routeName);
  }

  double _opacityAnimator(double op) {
    setState(() => _opacity = op == 0.5 ? 1.0 : 0.5);
    return _opacity;
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    // Markers Listner
    final _getMarkers = Provider.of<GetMarkers>(context);
    //for markers
    _getMarkers.markers.length == 0 ? _getMarkers.setMarkers() : _getMarkers.setMarkerMap();
    //for suggested markers
    if(_getMarkers.suggestedMarkers.length == 0) _getMarkers.setSuggestedMarkers();

    // Events Listener
    final _getEvents = Provider.of<GetEvents>(context);
    //for Events
    if(_getEvents.eventList.length == 0) _getEvents.setEvents();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(
                child: AnimatedOpacity(
                  opacity: _opacityAnimator(_opacity),
                  duration: Duration(milliseconds: 1700),
                  curve: Curves.easeInOut,
                  child: Opacity(
                    opacity: 1.0,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 1350),
                      curve: Curves.easeInOut,
                      width: size.width / (4 * _opacityAnimator(_opacity)),
                      height: size.height / (4.0 * _opacityAnimator(_opacity)),
                      child: Image.asset(MAIN_KIDE_LOGO,
                        gaplessPlayback: true,
                        fit: BoxFit.contain),
                    )
                  ),
                ),
              ),
            ],
          ),
          Container(height: 20,),
          AnimatedOpacity(
            opacity: 0.8,
            duration: Duration(milliseconds: 4500),
            curve: Curves.easeInOut,
            child: Text(
              KIDE_CAPS,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                letterSpacing: 25.0,
              ),
            ),
          ),
          Container(height: 20),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}