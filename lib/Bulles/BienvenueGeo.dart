import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
import 'package:flutter/foundation.dart';
class BienvenueGeo extends StatelessWidget {
  BienvenueGeo({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon :
        SvgPicture.asset(BulleBienvenueGeo),
        onPressed: onPressed
    );
  }
}
