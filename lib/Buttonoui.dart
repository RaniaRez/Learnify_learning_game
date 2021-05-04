import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'myicons.dart';
import 'package:flutter/foundation.dart';
class Buttonoui extends StatelessWidget {
  Buttonoui({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(

        icon:SvgPicture.asset(buttonOui),
        iconSize: 90.0,

        onPressed: onPressed
    );
  }
}