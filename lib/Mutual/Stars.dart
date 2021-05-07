import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';

class StarIcon extends StatelessWidget {
  StarIcon();
  @override
  Widget build(BuildContext context) {
    return Container(
    height:150,
    width:150,
      child: SvgPicture.asset(Star),
    );
  }
}