import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart';
class BulleN1Q2 extends StatelessWidget {
  BulleN1Q2({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon :
        SvgPicture.asset('assets/icons/BulleN1Q2.svg'),
        onPressed: onPressed
    );
  }
}