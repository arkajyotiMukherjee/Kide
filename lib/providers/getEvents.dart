import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:Kide/models/EventCategory.dart';
import 'package:Kide/models/SubEvent.dart';
// import 'package:Kide/models/EventDetail.dart';

class GetEvents with ChangeNotifier {
  bool _isConnected = false;
  bool _fetchFlagCategories = false;
  bool _fetchFlagUniversities = false;
  //Create Firebase Instance
  Firestore db = Firestore.instance;

  //Initialize the marker set
  List<String> _eventList = [];
  // List <EventDetail> eventDetails = [];
  // Iterable<SubEvent> subEvents = [];
  List<EventCategory> _eventCategories = [];

  String _university = "Select Your University";
  List<String> _universities = [];

  String get university {
    return _university;
  }

  void setUniversity(String univ) {
    _university = univ;
    notifyListeners();
  }

  void unsetUniversity() {
    _university = "Select Your University";
    notifyListeners();
  }

  List<String> get universities {
    return _universities;
  }

  List<EventCategory> get eventCategories {
    return _eventCategories;
  }

  List<String> get eventList {
    return _eventList;
  }

  void setEvents() {
    //Check internet connectivity
    checkConnectivity();
    if (_isConnected ) {
      print("Set Events");
      if (_eventList.length == 0 && _fetchFlagCategories == false){
        getEventList();
        _fetchFlagCategories = true;
      }
      if (_universities.length == 0 && _fetchFlagUniversities == false){
        getUniversities();
        _fetchFlagUniversities = true;
      }
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

  void resetEventList() {
    _eventList = [];
  }

  
  void resetEventCategories() {
    _eventCategories = [];
  }

  void resetEventData() {
    resetEventData();
    resetEventCategories();
  }

  void getEventList() {
    db.collection('event_list').snapshots().listen(
      (snapshot) {
        // resetEventList();
        snapshot.documents.forEach((doc) {
          // populate _eventList
          _eventList = doc.data['names'].cast<String>();
          _eventList = _eventList.toSet().toList();
          print(_eventList);
        });
        if (_eventList.length != 0)
          _eventList.forEach((e) => getEventCategory(e));
        notifyListeners();
      },
    );
  }

  void getUniversities() {
    db.collection('university_list').snapshots().listen(
      (snapshot) {
        snapshot.documents.forEach((doc) {
          // populate universityList
          _universities = doc.data['names'].cast<String>();
          _universities = _universities.toSet().toList();
          print(_universities);
          notifyListeners();
        });
      },
    );
  }

  void getEventCategory(String collectionName) {
    print("get cet");
    db.collection(collectionName).snapshots().listen(
      (snapshot) {
        // resetEventData();
        List<SubEvent> subEvents = [];
        snapshot.documents.forEach((doc) {
          //populate all other Lists
          // List<String> headers = doc.data['d_headers'].cast<String>();
          // List<String> descriptions = doc.data['d_descs'].cast<String>();
          // List<EventDetail> eventDetails = [];
          // for (int i = 0; i < headers.length; i++)
          //   eventDetails.add(new EventDetail(
          //       id: i.toString(), header: headers[i], desc: descriptions[i]));

          subEvents.add(SubEvent(
            id: Key(doc.documentID),
            name: doc.data['name'],
            date: doc.data['date'],
            time: doc.data['time'],
            // description: doc.data['description'],
            location: doc.data['location'],
            // details: eventDetails,
            universities: [
              _universities[doc.data['universities'][0]],
              _universities[doc.data['universities'][1]]
            ],
          ));

          print("events ${subEvents.length}");
          print(collectionName);
        });

        _eventCategories.add(EventCategory(
            id: collectionName,
            name: collectionName,
            subEvents: [...subEvents]));
        _eventCategories = _eventCategories.toSet().toList();
        notifyListeners();
      },
    );
  }
}
