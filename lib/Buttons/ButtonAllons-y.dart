import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
import 'package:flutter/foundation.dart';
class ButtonAllonsy extends StatelessWidget {
  ButtonAllonsy({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 200,
        icon :
        SvgPicture.asset(buttonAllonsy),
        onPressed: onPressed
    );
  }
}