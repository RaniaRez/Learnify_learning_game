import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart';
import '../myicons.dart';
class AppliquerButton extends StatelessWidget {
  AppliquerButton({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon : SvgPicture.asset(ButtonAppliquer),
        iconSize: 200.0,
        onPressed: onPressed
    );
  }
}
