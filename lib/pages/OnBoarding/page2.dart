import 'package:flutter/material.dart';
import 'package:kide/config/Viewport.dart';
import 'package:kide/util/colors.dart';
import 'package:kide/util/constants.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ViewPort().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            new Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(ONBOARDING_CONTACTS_HEADING,
                    softWrap: true,
                      style: TextStyle(
                        fontSize: 12,
                        color: MATERIAL_BLUE_ACCENT
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Image.asset(
                    CONTACT_ASSET_PNG,
                    height: ViewPort.screenHeight*0.4,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 80),
                    child: Text(ONBOARDING_CONTACTS_DESC,
                      style: TextStyle(
                        fontSize: 12,
                        color: MATERIAL_WHITE_70
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            )
          ],
          alignment: FractionalOffset.center,
        ),
      ),
    );
  }
}