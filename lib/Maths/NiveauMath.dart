import 'package:flutter/material.dart';
import 'package:somthn/Buttons/BacksButton.dart';
import 'package:somthn/Maths/M-2.dart';
import 'package:somthn/Owls/BrownOwl.dart';
import 'package:somthn/Owls/LockIcon.dart';
import 'package:somthn/Maths/M-1.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonDifficile.dart';
import 'package:somthn/Buttons/buttonMoyen.dart';
import 'package:somthn/Buttons/buttonfacile.dart';
import 'package:somthn/Owls/madGreenOwl.dart';
import 'package:somthn/Buttons/settingsButton.dart';



class NiveauMath extends StatefulWidget {
  @override
  _NiveauMathState createState() => _NiveauMathState();
}

class _NiveauMathState extends State<NiveauMath> {
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
                      image: AssetImage("images/mathsBG.jpg"),
                      fit: BoxFit.cover)),
            ),


            Positioned(
              bottom: 86.0,
              right: 152.0,
              child: Container(
                width: 300,
                height: 100,
                child:Buttonfacile (onPressed:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Math1()));
                  print('facile');}),
              ),
            ),
            Positioned(
              bottom: 155.0,
              right: 290.0,
              child: PinkAvatarIcon(onPressed:null),
            ),
            Positioned(
              top:656.0,
              left:230.0,
              child: Container(

                  child: LockIcon()),
            ),
            Positioned(
              top: 440.0,
              left:165.0,
              child: Container(
                width: 300,
                height: 100,
                child: ButtonMoyen(onPressed:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Math2()));
                  print('Moyen');
                }),
              ),
            ),
            Positioned(
              top: 465.0,
              left:180.0,
              child: Container(

                  child: LockIcon()),
            ),
            Positioned(
              top: 360.0,
              left: 290.0,
              child: GreenOwl(onPressed:null),
            ),

            Positioned(
              top: 237.0,
              right: 158.0,
              child: Container(
                width: 300,
                height: 100,
                child: ButtonDifficile(onPressed:(){
                  print('hard');
                }),
              ),
            ),
            Positioned(
              top: 160.0,
              right: 290.0,
              child:BrownOwl(onPressed:null),
            ),
            Positioned(
              top:257.0,
              left:220.0,
              child: Container(

                  child: LockIcon()),
            ),
            Positioned(
                top: 50.00,
                left: 300.00,
                child: SettingsButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                  print("HELL YEAH");
                },)
            ),

            Positioned(
                top: 6.00,
                right: 250.00,
                child: BacksButton(onPressed: (){
                  print("HELL YEAH");
                  Navigator.pop(context);
                },)
            ),
          ]
      ),
    );

  }
}

