import 'package:flutter/material.dart';
import 'package:somthn/Buttons/BacksButton.dart';
import 'package:somthn/Francais/F-1.dart';
import 'package:somthn/Francais/F-3.dart';
import 'package:somthn/Maths/BienvenueMath.dart';
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
import 'F-2.dart';
import 'BienvenueFr.dart';

class NiveauFr extends StatefulWidget {
  @override
  _NiveauFrState createState() => _NiveauFrState();
}

class _NiveauFrState extends State<NiveauFr> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,

      child: Scaffold(
        body:
        Stack(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/frBG.jpg"),
                        fit: BoxFit.cover)),
              ),


              Positioned(
                top: size.height*0.75,
                left: 0.0,
                height: size.height*0.2,
                width: size.width*0.5,
                child:Buttonfacile (onPressed:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Fr1()));
                  print('facile');}),
              ),

              Positioned(
                height: size.height*0.15,
                width: size.height*0.15,
                left: size.width*0.01,
                bottom:size.width*0.32,
                child: PinkAvatarIcon(onPressed:null),
              ),
              if (scoreF.niv1<0)
              Positioned(
                  top: size.height*0.82,
                  left: size.width*0.5,
                  child: LockIcon()),
              Positioned(
                top: size.height*0.5,
                right: 0.0,
                height: size.height*0.2,
                width: size.width*0.5,
                child: ButtonMoyen(onPressed:(){
                  print(scoreF.niv2);
                  if (scoreF.niv2>=0){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Fr2()));}

                  print('Moyen');
                }),
              ),

              if (scoreF.niv2<0)
              Positioned(
                  top: size.height*0.57,
                  right: size.width*0.5,
                  child: LockIcon()),
              Positioned(
                height: size.height*0.15,
                width: size.height*0.15,
                right: size.width*0.01,
                top:size.height*0.435,
                child: GreenOwl(onPressed:null),
              ),

              Positioned(
                top: size.height*0.25,
                left: 0.0,
                height: size.height*0.2,
                width: size.width*0.5,
                child: ButtonDifficile(onPressed:(){
                  print(scoreF.niv3);
                  if (scoreF.niv3>=0){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Fr3()));}
                  print('hard');
                }),
              ),

              Positioned(
                height: size.height*0.15,
                width: size.height*0.15,
                left: size.width*0.01,
                top:size.width*0.36,
                child:BrownOwl(onPressed:null),
              ),
              if (scoreF.niv3<0)
              Positioned(
                  top: size.height*0.32,
                  right: size.width*0.44,
                  child: LockIcon()),
              Positioned(
                  top: size.height*0.05,
                  left:size.width*0.75,
                  child:
                  SettingsButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("HELL YEAH");
                  },)
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BienvenueFr()));
                  },)
              ),
            ]
        ),
      ),
    );

  }
}

