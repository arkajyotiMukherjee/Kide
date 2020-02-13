import 'package:flutter/material.dart';
import 'package:kide/providers/router.dart';
import 'package:kide/util/data.dart';
//import 'package:kide/models/MoreDetails.dart';
import 'package:kide/pages/MorePage/Widgets/MoreCard.dart';
import 'package:kide/widgets/BottomNav.dart';
import 'package:provider/provider.dart';
void main() => runApp(MorePage());

class MorePage extends StatelessWidget {
  static const String routeName = '/more';  

  @override
  Widget build(BuildContext context) {
    
    // BottomNav Listener
    final indexState = Provider.of<Router>(context);
    // for Nav Icons
    indexState.setIndex(4);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: NavigationToolbar.kMiddleSpacing,
        title: Text(
          "More",
          textAlign: TextAlign.center,
          style: TextStyle(
            letterSpacing: 5,
            fontFamily: 'Roboto',
          ),
        )
      ),
      backgroundColor: Color.fromRGBO(18, 18, 18, 1.0),
      bottomNavigationBar: BottomNav(),
      body : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                delegate: SliverChildListDelegate(
                  [
                    for(int i=0;i<more.length;i++)
                      MoreCard(more[i])
                  ],
                ),
              )
              ]
            )
        )
      )
    );
  }
}
