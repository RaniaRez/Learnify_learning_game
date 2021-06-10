
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
import 'package:flutter/foundation.dart';
class ButtonAllonsy extends StatefulWidget {
  ButtonAllonsy({this.onPressed});
  final GestureTapCallback onPressed;

  @override
  _ButtonAllonsyState createState() => _ButtonAllonsyState();
}

class _ButtonAllonsyState extends State<ButtonAllonsy> {
  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
        onPressed: widget.onPressed,
        scaleFactor: 1.5,
        duration: Duration(milliseconds: 100),
      child:IconButton(
        icon :
        SvgPicture.asset(buttonAllonsy),

    ));
  }
}