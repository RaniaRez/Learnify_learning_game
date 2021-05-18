import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
import 'package:flutter/foundation.dart';
class ButtonSeConnecter extends StatelessWidget {
  ButtonSeConnecter({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon :
        SvgPicture.asset(seConnecter),
        onPressed: onPressed
    );
  }
}