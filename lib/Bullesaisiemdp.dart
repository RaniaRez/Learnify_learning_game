import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'myicons.dart';

class Bullesaisiemdp extends StatelessWidget {
  Bullesaisiemdp();

  @override
  Widget build(BuildContext context) {
    return Container(
      child : Container(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SvgPicture.asset(bullevide),

            ],
          ),
        ),
      ),



    );
  }
}
