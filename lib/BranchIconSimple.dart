import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'myicons.dart';

class BranchIconSimple extends StatelessWidget {
  BranchIconSimple();
  //final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(branch2),
    );
  }
}