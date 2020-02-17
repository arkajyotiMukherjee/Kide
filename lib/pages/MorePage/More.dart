import 'package:flutter/material.dart';
import 'package:kide/util/data.dart';
import 'package:kide/pages/MorePage/Widgets/MoreCard.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(MorePage());

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1.0),
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
                      MoreCard(more[i],more[i].color)

                    ,Card(
                      margin: EdgeInsets.fromLTRB(5, 15, 5, 15),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                      color: Color(0xFFD4A437),
                      child: InkWell(
                        child: Center(
                          child: Text("Go Live",
                            style: TextStyle(
                              color: Colors.red
                            ),
                          ),
                        ),
                        onTap: () => {
                          //launch("")
                        },
                      ),
                    )
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
