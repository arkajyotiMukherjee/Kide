import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  //final String _assets = 'lib/assets/Maps_page_OnBoarding.jpg';
  final String _assets = 'lib/assets/maps_1.jpg';

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: double.infinity,
      width: double.infinity,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage(_assets), 
          fit: BoxFit.cover
        )
      ),
      child: Stack(
        children: <Widget>[
          new Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Come discover our campus !',
                    style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 170),
                  child: Text('Use our customized map to discover all the must see locations our campus has to offer',
                    style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black87),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          )
        ],
        alignment: FractionalOffset.center,
      ),
    );
  }
}
