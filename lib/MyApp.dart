import 'package:flutter/material.dart';
import 'package:kide/SplashScreen.dart';
import 'package:kide/pages/ContactsPage/ContactList.dart';
import 'package:kide/pages/EventsPage/BookmarksPage.dart';
import 'package:kide/pages/EventsPage/DetailsPage.dart';
import 'package:kide/pages/HomePage/MoreHome.dart';
import 'package:kide/pages/MorePage/MoreDetails.dart';
import 'package:kide/providers/getEvents.dart';
import 'package:kide/providers/bookmarks.dart';
import 'package:kide/providers/getMarkers.dart';
import 'package:kide/util/constants.dart';
import 'package:kide/widgets/utils/stack_index.dart';
import 'package:provider/provider.dart';
import 'package:kide/pages/ContactsPage/Contacts.dart';
import 'package:kide/pages/EventsPage/Events.dart';
import 'package:kide/pages/EventsPage/SubEvents.dart';
import 'package:kide/pages/HomePage/Home.dart';
import 'package:kide/pages/MapsPage/Maps.dart';
import 'package:kide/pages/MorePage/More.dart';
import 'package:kide/providers/router.dart';
import 'package:kide/widgets/BottomNav.dart';

import 'models/Destination.dart';


class MyApp extends StatelessWidget {
  static const routeName = '/root';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (context) => Router()),
        ChangeNotifierProvider( create: (context) => Bookmarks()),
        ChangeNotifierProvider( create: (context) => GetEvents()),
        ChangeNotifierProvider( create: (context) => GetMarkers()),
      ],
      child: MaterialApp(
        title: KIDE_L_CAPS,
        theme: ThemeData.dark().copyWith(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          })
        ),
        home: MyHomePage(title: KIDE_CAPS),
        routes: {
          MapsPage.routeName:       (context) => MapsPage(),
          ContactsPage.routeName:   (context) => ContactsPage(),
          // HomePage.routeName:       (context) => HomePage(),
          EventsPage.routeName:     (context) => EventsPage(),
          MorePage.routeName:       (context) => MorePage(),
          ContactList.routeName:    (context) => ContactList(),
          BookmarksPage.routeName:  (context) => BookmarksPage(),
          SubEvents.routeName:      (context) => SubEvents(),
          DetailsPage.routeName:    (context) => DetailsPage(),
          MoreHome.routeName:       (context) => MoreHome(),
          MoreDetails.routeName:    (context) => MoreDetails(),
        },
      ),
    );
  }
}




class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home, Colors.teal),
  Destination('Business', Icons.business, Colors.cyan),
  Destination('School', Icons.school, Colors.orange),
  Destination('Flight', Icons.flight, Colors.blue)
];

class _MyHomePageState extends State<MyHomePage> {

  // final List<Widget> _tabs = [
  //   MapsPage(),
  //   ContactsPage(),
  //   HomePage(),
  //   EventsPage(),
  //   MorePage(),
  // ];

  // final List<String> _tabNames = [
  //   MAPS,
  //   CONTACTS,
  //   HOME,
  //   EVENTS,
  //   MORE
  // ];

  
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    final indexState = Provider.of<Router>(context);

    return Scaffold(
      // body: SplashScreen(),
      body: IndexedStack(
        index: _currentIndex,
        children: allDestinations.map<Widget>((Destination destination) {
          return DestinationView(destination: destination);
        }
      ).toList()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            backgroundColor: destination.color,
            title: Text(destination.title)
          );
        }).toList(),
      ),
    );
  }
}

