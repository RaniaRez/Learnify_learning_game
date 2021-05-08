import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
import 'package:flutter/foundation.dart';
class ButtonContinuer extends StatelessWidget {
  ButtonContinuer({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 200,
        icon :
        SvgPicture.asset(buttonContinuer),
        onPressed: onPressed
    );
  }
}