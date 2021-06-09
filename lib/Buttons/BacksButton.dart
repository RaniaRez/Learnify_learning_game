import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
class BacksButton extends StatelessWidget {
  BacksButton({this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      onPressed: onPressed,
      scaleFactor: 2,
      duration: Duration(milliseconds: 100),
      child: IconButton(
          icon : SvgPicture.asset(backButton),
          iconSize: 70.0,
      ),
    );
  }
}
