import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'myicons.dart';
import 'package:flutter/foundation.dart';
class BulleIcon extends StatelessWidget {
  BulleIcon({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon : Container(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                    height: 400.0,
                    width: 400.0,
                    child: SvgPicture.asset(bulleWelcome)),
                Positioned(
                  top : 98.0,
                  left: 50.5,
                  right: 50.5,
                  bottom: 10.0,
                  child: Text(
                    "BIENVENUE EN '     '",
                    style: TextStyle(
                      fontFamily: 'Skranji-Bold',
                      fontSize: 30,
                      color: Colors.brown,
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
