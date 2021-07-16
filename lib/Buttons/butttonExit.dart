import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
import 'package:flutter/foundation.dart';
class ButtonExit extends StatelessWidget {
  ButtonExit({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      onPressed: onPressed,
      scaleFactor: 1.5,
      duration: Duration(milliseconds: 100),
      child: IconButton(
          icon : SvgPicture.asset(buttonExit),
          iconSize: 80.0,
      ),
    );
  }
}