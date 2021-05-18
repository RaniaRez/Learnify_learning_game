import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';

class CercleIcon extends StatelessWidget {
  CercleIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(Cercle),

    );
  }
}