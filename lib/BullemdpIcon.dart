import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'myicons.dart';
import 'package:flutter/foundation.dart';
class BullemdpIcon extends StatelessWidget {
  BullemdpIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      child : Container(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SvgPicture.asset(bullevide),
              Positioned(
                top : 55.0,
                left: 55.5,
                right: 70.5,
                bottom: 10.0,
                child: Text(
                  'Voulez-vous créer un mot de passe ?',
                  style: TextStyle(
                    fontFamily: 'Skranji-bold',
                    fontSize: 30,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,

                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            ],
          ),
        ),),



    );
  }
}
