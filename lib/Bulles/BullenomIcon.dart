import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';

class BullenomIcon extends StatelessWidget {
  BullenomIcon();

  @override
  Widget build(BuildContext context) {
    return Container(

        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SvgPicture.asset(bulleNom),

            ],
          ),
        ),



    );
  }
}
