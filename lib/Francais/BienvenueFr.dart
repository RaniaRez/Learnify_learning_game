import 'package:flutter/material.dart';
import 'package:somthn/Bulles/BullenomIcon.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonCommencerDroit.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
//import '../WelcomePages/ChooseAvatar.dart';
import 'package:somthn/TestDeNiveau/TestDeNiveau.dart';
import '../Services/Login.dart';
import '../Services/SignUp.dart';




class BienvenueFr extends StatefulWidget {
  @override
  _BienvenueFrState createState() => _BienvenueFrState();
}

class _BienvenueFrState extends State<BienvenueFr> {
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
                top: 50.00,
                left: 300.00,
                child:
                SettingsButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                  print("HELL YEAH");
                },)
            ),
            Positioned(
                top: 10.00,
                right: 250.00,
                child: BacksButton(onPressed: (){
                  Navigator.pop(context);
                },)
            ),
            Positioned(
              bottom: 50.0,
              child: ButtonCommencerD(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TestNiveau()));
              }
              ),
            ),
            if (user.avatar=="Pink")
              Visibility(

                child: Positioned(
                  top: 565.0,
                  right: 270.0 ,
                  height: 130.0,
                  width: 130.0,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Purple")
              Visibility(

                child: Positioned(
                  top: 555.0,
                  right: 270.0 ,
                  height: 150.0,
                  width: 150.0,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Orange")
              Visibility(

                child: Positioned(
                  top: 565.0,
                  right: 270.0 ,
                  height: 130.0,
                  width: 130.0,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Blue")
              Visibility(

                child: Positioned(
                  top: 560.0,
                  right: 270.0 ,
                  height: 130.0,
                  width: 130.0,
                  child:BlueAvatarIcon(onPressed: null,),
                ),
              ),


            Positioned(
              top: 170.0,
              left: 100.0 ,
              height: 300.0,
              width: 300.0,
              child:BullenomIcon(),
            ),
            Positioned(
              top : 270,
              left: 145.5,
              right: 70.5,
              bottom: 10.0,
              child: SizedBox(
                height: 10,
                width: 10,
                child: Text(
                  'Bienvenue en Français  ',
                  style: TextStyle(
                    fontFamily: 'Skranji-bold',
                    fontSize: 30,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,

                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),



          ]
      ),
    );

  }
}

