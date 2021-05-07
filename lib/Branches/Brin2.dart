import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';

class Brin2Icon extends StatelessWidget {
  Brin2Icon();
  //final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(brin2),
    );
  }
}