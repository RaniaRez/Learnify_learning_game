import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'myicons.dart';
import 'package:flutter/foundation.dart';
class ButtonCommencer extends StatelessWidget {
  ButtonCommencer({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon : Container(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SvgPicture.asset(buttonNom),
                Positioned(
                  child: Text(
                    "Commencer",
                    style: TextStyle(
                      fontFamily: 'Skranji-Bold',
                      fontSize: 30,
                      color: Colors.brown[700],
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ],
            ),
          ),),
        iconSize: 200.0,

        onPressed: onPressed
    );
  }
}