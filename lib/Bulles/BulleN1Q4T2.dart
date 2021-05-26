import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart';
class BulleN1Q4T2 extends StatelessWidget {
  BulleN1Q4T2({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon :
        SvgPicture.asset('assets/icons/BulleN1Q4T2.svg'),
        onPressed: onPressed
    );
  }
}