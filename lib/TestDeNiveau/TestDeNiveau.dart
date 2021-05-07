import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Buttons/buttonCommencer.dart';
import '../Buttons/settingsButton.dart';
import '../WelcomePages/Users.dart';
import '../WelcomePages/Settings.dart';
import '../myicons.dart';
import '../WelcomePages/ChooseAvatar.dart';

class TestNiveau extends StatefulWidget {
  @override
  _TestNiveauState createState() => _TestNiveauState();
}

class _TestNiveauState extends State<TestNiveau> {
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
                top: 20.00,
                right: 250.00,
                child: BacksButton(onPressed: (){
                  print("HELL YEAH");
                  Navigator.pop(context);
                },)
            ),
            Positioned(
                bottom: 50.00,
                left : 50.00,
                right: 50.00,
                child: ButtonCommencer(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Users()));
                  print("allons-y");
                } )),
            Positioned(
                top: 60.00,
                left: 300.00,
                child:
                SettingsButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                  print("settings");
                },)
            ),
            Positioned(
                top: 160,
                right: 90,
                height: 300,
                width: 300,
                child: SvgPicture.asset(BulleTest)),
            Visibility(

              child: Positioned(
                top: 360.0,
                right: -3.0 ,
                height: 300.0,
                width: 200.0,
                child: Container(child: SvgPicture.asset(SimpleBranch2)),
              ),
            ),
            if (New.avatar=="Pink")
              Visibility(

                child: Positioned(
                  top: 310.0,
                  right: 20.0 ,
                  height: 300.0,
                  width: 200.0,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Purple")
              Visibility(

                child: Positioned(
                  top: 310.0,
                  right: 20.0 ,
                  height: 300.0,
                  width: 200.0,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Orange")
              Visibility(

                child: Positioned(
                  top: 310.0,
                  right: 20.0 ,
                  height: 300.0,
                  width: 200.0,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Blue")
              Visibility(

                child: Positioned(
                  top: 310.0,
                  right: 20.0 ,
                  height: 300.0,
                  width: 200.0,
                  child:BlueAvatarIcon(onPressed: null,),
                ),
              ),
          ]
      ),
    );

  }
}
