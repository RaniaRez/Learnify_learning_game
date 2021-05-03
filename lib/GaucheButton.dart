import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'myicons.dart';
import 'package:flutter/foundation.dart';
class GaucheButton extends StatelessWidget {
  GaucheButton({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon : Container(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SvgPicture.asset(buttonVersGauche),
                Positioned(
                  left: 48.0,
                  bottom: 18.0,
                  child: Text(
                    "FRANCAIS",
                    style: TextStyle(
                      fontFamily: 'Skranji-Bold',
                      fontSize: 25,
                      color: Colors.brown[700],
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ],
            ),
          ),),
        iconSize: 206.0,

        onPressed: onPressed
    );
  }
}
