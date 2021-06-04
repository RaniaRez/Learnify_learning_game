import 'package:bouncing_widget/bouncing_widget.dart';
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
    return BouncingWidget(
        onPressed: onPressed,
      scaleFactor: 1.5,
      duration: Duration(milliseconds: 100),
      child: IconButton(
          icon: SvgPicture.asset(settingsIcon),
        iconSize: 70.0,));



  }
}
