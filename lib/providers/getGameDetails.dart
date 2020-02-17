import 'package:Kide/models/Games.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class GetGameDetails with ChangeNotifier {
  bool _isConnected = true;
  //Create Firebase Instance
  Firestore db = Firestore.instance;

  //Initialize the marker set
  Set<GameDetails> _gameDetails = {};

  Set<GameDetails> get gameDetails {
    return _gameDetails;
  }

  void setGameDetails() {
    if (_isConnected) {
      getGameDetails();
    }
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // Connected to the internet
      _isConnected = true;
    }
  }

  void getGameDetails() {
    db.collection('games').snapshots().listen(
      (snapshot) {
        snapshot.documents.forEach((doc) {
          GameDetails game = GameDetails(
            name: doc.data['name'],
            food: doc.data['food'],
            transportation: doc.data['transportation'],
            venues: doc.data['venues'].cast<String>(),
            accomodation: doc.data['accomodation'].cast<String>(),
          );
          _gameDetails.add(game);
          notifyListeners();
        });
      },
    );
  }

}
