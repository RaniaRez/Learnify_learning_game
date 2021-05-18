
import 'package:flutter/material.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Buttons/buttonInfo.dart';
import 'package:somthn/Buttons/buttonLightDark.dart';
import 'package:somthn/Buttons/buttonMusic.dart';
import 'package:somthn/Buttons/buttonSound.dart';
import 'package:somthn/Buttons/buttonUserSettings.dart';
import '../Buttons/BacksButton.dart';
import 'Home.dart';

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
            top: size.height*0.5,
            left:size.width*0.6,
            child:MusicButton(onPressed:null,)
            ),
              Positioned(
                  top: size.height*0.5,
                  right:size.width*0.6,
                  child:SoundButton(onPressed:null,)
              ),
              Positioned(
                  top: size.height*0.7,
                  left:size.width*0.61,
                  child:UserSettingsButton(onPressed:null,)
              ),
              Positioned(
                  top: size.height*0.7,
                  right:size.width*0.61,
                  child:HomeButton(onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),);
                  })
              ),

              Positioned(
                  top: size.height*0.3,
                  right:size.width*0.625,
                  child:BacksButton(onPressed:() {
    print("HELL YEAH");
    Navigator.pop(context);
    },
                  )

              ),
              Positioned(
                  top: size.height*0.3,
                  left:size.width*0.6,
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


