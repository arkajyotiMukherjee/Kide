import 'package:flutter/foundation.dart';

class GameDetails {
  final String name;
  final String food;
  final String transportation;
  final List<String> venues;
  final List<String> accomodation;
  GameDetails({
    @required this.name,
    @required this.food,
    @required this.transportation,
    @required this.venues,
    @required this.accomodation
  });
}