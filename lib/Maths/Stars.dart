import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';

class StarIcon extends StatelessWidget {
  StarIcon();
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Star
    );
  }
}