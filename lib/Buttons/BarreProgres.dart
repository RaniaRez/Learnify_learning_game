import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';

class BarreProgres extends StatelessWidget {
  BarreProgres();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(barreProgress),
    );
  }
}