import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/HomeButton.dart';
import 'myicons.dart';
import 'settingsButton.dart';
import 'BacksButton.dart';
import 'ButtonAllons-y.dart';
import 'PurpleOwlIcon.dart';
import 'BranchIcon.dart';
import 'BulleIcon.dart';

class OnClickUser extends StatefulWidget {
  @override
  _OnClickUserState createState() => _OnClickUserState();
}

class _OnClickUserState extends State<OnClickUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Stack(
          children: <Widget>[
            Positioned(
              bottom: 10.0,
                child: SettingsButton(onPressed: null,))
           ]
      ),
    );

  }
}
