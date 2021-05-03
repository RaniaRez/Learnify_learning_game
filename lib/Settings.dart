
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
import 'ClassUser.dart';
import 'PlusButton.dart';
import 'buttonGoTo.dart';
import 'buttonStatistique.dart';
import 'buttonUserSettings.dart';
import 'Home.dart';
import 'Users.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/forestbackground.jpg"),
                      fit: BoxFit.cover)),
            ),
            Positioned(
                top: 10.00,
                left: 250.00,
                child:
                SettingsButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                  print("HELL YEAH");
                },)
            ),
            Positioned(
                top: 240,
                right: 225.0,
                child:BranchIcon()
            ),
            Positioned(
              top: 130.00,
              right: 195.00,
              child: PurpleOwl(onPressed: (){
                print("YAS");
              }),
            ),
            Positioned(
              top: 275.0,
              left: 115.0 ,
              height: 300.0,
              width: 300.0,
              child:BulleIcon(onPressed: (){}),
            ),]
      ),
    );
  }
}


