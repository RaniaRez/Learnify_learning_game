import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart';
class BarreGeo extends StatelessWidget {
  BarreGeo({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon : SvgPicture.asset('assets/icons/BarreGeo.svg'),
        onPressed: onPressed
    );
  }
}