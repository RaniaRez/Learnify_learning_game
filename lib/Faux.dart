import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/BullenomIcon.dart';
import 'package:somthn/TestDeniveau.dart';
import 'package:somthn/Users.dart';
import 'package:somthn/buttonContinuer.dart';
import 'package:somthn/buttonReessayer.dart';
import 'package:somthn/myicons.dart';
import 'settingsButton.dart';
import 'BacksButton.dart';
import 'package:somthn/OrangeAvatarIcon.dart';
import 'package:somthn/PinkAvatarIcon.dart';
import 'package:somthn/PurpleAvatarIcon.dart';
import 'package:somthn/BlueAvatarIcon.dart';
import 'ChooseAvatar.dart';




class Faux extends StatefulWidget {
  @override
  _FauxState createState() => _FauxState();
}

class _FauxState extends State<Faux> {
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
                      image: AssetImage("images/lightBackGround.png"),
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
                top: 515,
                right: 200,
                child:ButtonReessayer(
                  onPressed: (){
                  },
                )

            ),
            Visibility(
              child: Positioned(
                top: 490.0,
                right: 280.0 ,
                child:PinkAvatarIcon(onPressed: null,),
              ),
            ),

            if (New.avatar=="Pink")
              Visibility(

                child: Positioned(
                  top: 490.0,
                  right: 280.0 ,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Purple")
              Visibility(

                child: Positioned(
                  top: 490.0,
                  right: 280.0 ,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Orange")
              Visibility(

                child: Positioned(
                  top: 490.0,
                  right: 280.0 ,

                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Blue")
              Visibility(

                child: Positioned(
                  top: 490.0,
                  right: 280.0 ,
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
              top : 275,
              left: 145.5,
              right: 70.5,
              bottom: 10.0,
              child: SizedBox(
                height: 10,
                width: 10,
                child: Text(
                  "Ce n'est pas Correct",
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