import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
import 'package:flutter/foundation.dart';
class SinscrireButton extends StatelessWidget {
  SinscrireButton({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 250,
        icon :
        SvgPicture.asset(sinscrire),
        onPressed: onPressed
    );
  }
}