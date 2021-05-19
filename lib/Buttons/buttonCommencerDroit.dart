import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
import 'package:flutter/foundation.dart';
class ButtonCommencerD extends StatelessWidget {
  ButtonCommencerD({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon :
                SvgPicture.asset(CommencerDroite),
        onPressed: onPressed
    );
  }
}