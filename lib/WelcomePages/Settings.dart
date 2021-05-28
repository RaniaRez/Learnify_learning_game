
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Buttons/buttonInfo.dart';
import 'package:somthn/Buttons/buttonMusic.dart';
import 'package:somthn/Buttons/buttonSound.dart';
import 'package:somthn/Buttons/buttonUserSettings.dart';
import 'package:somthn/modification/Userinfo.dart';
//import 'package:somthn/myicons.dart';
import '../Buttons/BacksButton.dart';
import '../Buttons/butttonExit.dart';

import 'Home.dart';

import '../Services/auth.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:
      Container(
        height: size.height,
        width: size.width,
        child: Stack(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/forestbackground.jpg"),
                        fit: BoxFit.cover)),
              ),
        Positioned(
            top: size.height*0.4,
            left:size.width*0.6,
            child:MusicButton(onPressed:null,)
            ),
              Positioned(
                  top: size.height*0.4,
                  right:size.width*0.6,
                  child:SoundButton(onPressed:null,)
              ),
              Positioned(
                  top: size.height*0.7,
                  left:size.width*0.61,
                  child:UserSettingsButton(onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Userinfo()),);
                  }
                  )
              ),
              Positioned(
                  top: size.height*0.715,
                  right:size.width*0.65,
                  child: ButtonExit(onPressed:() {
                    try {
                      signOutGoogle();
                      print("you signed out ");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),);
                    }
                    catch(e) { print ("error ");}
                  }
                  ),
              ),
              Positioned(
                  top: size.height*0.047,
                  left: size.width*0.39,
                  child:HomeButton(onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),);
                  })
              ),

              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child:BacksButton(onPressed:() {
    print("HELL YEAH");
    Navigator.pop(context);
    },
                  )

              ),
              Positioned(
                  top: size.height*0.04,
                  left:size.width*0.75,
                  child:InfoButton(onPressed:() {
                    print("clicking");
                  })
              ),

            ]
        ),
      ),
    );
  }
}


