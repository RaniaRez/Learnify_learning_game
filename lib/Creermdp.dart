import 'package:flutter/material.dart';
import 'package:somthn/BienvenueTestNiveau.dart';
import 'package:somthn/BlueAvatarIcon.dart';
import 'package:somthn/Buttonoui.dart';
import 'package:somthn/ChoixDomaines.dart';
import 'package:somthn/ChooseAvatar.dart';
import 'package:somthn/Ecriremdp.dart';
import 'package:somthn/HomeButton.dart';
import 'package:somthn/OrangeAvatarIcon.dart';
import 'package:somthn/PinkAvatarIcon.dart';
import 'package:somthn/PurpleAvatarIcon.dart';
import 'package:somthn/TestDeNiveau.dart';
import 'package:somthn/Userinfo.dart';

import 'package:somthn/buttonnon.dart';

import 'settingsButton.dart';
import 'BacksButton.dart';
import 'Home.dart';
import 'Settings.dart';
import 'BranchIconSimple.dart';
import 'BullemdpIcon.dart';
import 'ChooseAvatar.dart';
import 'Users.dart';



class Creermdp extends StatefulWidget {
  @override
  _CreermdpState createState() => _CreermdpState();
}

class _CreermdpState extends State<Creermdp> {
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
                top: 8.00,
                right: 250.00,
                child: BacksButton(onPressed: (){
                  print("u clicked me");
                  Navigator.pop(context);
                },)
            ),
            Positioned(
              top: -3.5,
              left: 100.0,
              child: HomeButton(
                onPressed: (){
                  print("HELL");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),);

                },
              ),
            ),
            Positioned(
                top: 50.00,
                left: 300.00,
                child: SettingsButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                  print("settings");
                },)
            ),
            Visibility(

              child: Positioned(
                top: 320.0,
                right: 250.0 ,
                height: 300.0,
                width: 200.0,
                child:BranchIconSimple(),
              ),
            ),
            if (New.avatar=="Pink")
              Visibility(

                child: Positioned(
                  top: 257.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Purple")
              Visibility(

                child: Positioned(
                  top: 257.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Orange")
              Visibility(

                child: Positioned(
                  top: 257.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Blue")
              Visibility(

                child: Positioned(
                  top: 257.0,
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
              child:BullemdpIcon(),
            ),

            Positioned(
                bottom: 210.00,
                left: 50.00,
                right: 50.00,
                child: Buttonoui (onPressed: () {
              Navigator.push(
                     context,
                MaterialPageRoute(
                builder: (BuildContext context) => Ecriremdp()));
              print('chooseavatar');
    },
            )
            ),

            Positioned(
                bottom: 130.00,
                left : 50.00,
                right: 50.00,
                child: Buttonnon(onPressed: (){
                  setState(() {
                    Utilisateurs.add(New);
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ChoixDomaine()));

                  print("non");
                } )
            ),
          ]
      ),
    );

  }
}
