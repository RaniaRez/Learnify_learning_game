import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
import 'package:flutter/foundation.dart';
class SettingsButton extends StatelessWidget {
  SettingsButton({@required this.onPressed});
 final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return IconButton(
          icon : Container(
              child: SvgPicture.asset(settingsIcon)),
        iconSize: 70.0,
        onPressed: onPressed
    );
  }
}
