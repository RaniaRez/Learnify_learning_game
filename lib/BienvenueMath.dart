import 'package:flutter/material.dart';
import 'package:somthn/BullenomIcon.dart';
import 'package:somthn/TestDeniveau.dart';
import 'package:somthn/buttonCommencerDroit.dart';
import 'settingsButton.dart';
import 'BacksButton.dart';
import 'package:somthn/OrangeAvatarIcon.dart';
import 'package:somthn/PinkAvatarIcon.dart';
import 'package:somthn/PurpleAvatarIcon.dart';
import 'package:somthn/BlueAvatarIcon.dart';
import 'ChooseAvatar.dart';




class BienvenueMath extends StatefulWidget {
  @override
  _BienvenueMathState createState() => _BienvenueMathState();
}

class _BienvenueMathState extends State<BienvenueMath> {
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
            if (New.avatar=="Pink")
              Visibility(

                child: Positioned(
                  top: 400.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Purple")
              Visibility(

                child: Positioned(
                  top: 405.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Orange")
              Visibility(

                child: Positioned(
                  top: 410.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Blue")
              Visibility(

                child: Positioned(
                  top: 400.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
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
              top : 250,
              left: 140.5,
              right: 80.5,
              child: SizedBox(
                height: 150,
                width:150,
                child: Text(
                  'Bienvenue en ',
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
            Positioned(
              top : 330,
              right: 60.5,
                child: Text(
                  'Mathématique',
                  style: TextStyle(
                    fontFamily: 'Skranji-bold',
                    fontSize: 30,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,

                  ),
                  textAlign: TextAlign.center,
                ),
              ),




          ]
      ),
    );

  }
}

