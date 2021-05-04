import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'myicons.dart';

class BranchIcon extends StatelessWidget {
  BranchIcon();
  //final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SvgPicture.asset(branch),
    );
  }
}