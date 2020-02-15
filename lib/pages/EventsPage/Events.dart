import 'package:flutter/material.dart';
import 'package:Kide/config/Viewport.dart';
import 'package:Kide/providers/getEvents.dart';
import 'package:Kide/pages/EventsPage/BookmarksPage.dart';
import 'package:Kide/pages/EventsPage/SubEvents.dart';
import 'package:Kide/util/constants.dart';
import 'package:provider/provider.dart';

void main() => runApp(EventsPage());

class EventsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Events Listener
    final _getEvents = Provider.of<GetEvents>(context);
    // for Events
    if (_getEvents.eventList.length == 0) _getEvents.setEvents();

    ViewPort().init(context);
    print("sub events ${_getEvents.eventCategories}");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.collections_bookmark),
        heroTag: hashCode,
        onPressed: () {
          Navigator.of(context).pushNamed(
            BookmarksPage.routeName,
          );
          print('Card tapped.');
        },
      ),
      backgroundColor: Color.fromRGBO(18, 18, 18, 1.0),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Navigator.of(context).pushNamed(SubEvents.routeName,
                    arguments: _getEvents.eventCategories[position]);
                print('Card tapped.');
              },
              child: Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        EVENTS_PAGE_EVENT_JPG,
                      ),
                    ),
                  ),
                  height: 120.0,
                ),
                Container(
                    height: 120.0,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.64),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Center(
                      child: Text(
                        _getEvents.eventCategories[position].name.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: ViewPort.screenWidth * 0.05,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              ]),
            ),
            margin: const EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 14.0),
          );
        },
        itemCount: _getEvents.eventCategories.length,
        padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
      ),
    );
  }
}
