
import 'package:flutter/material.dart';
import 'package:somthn/HomeButton.dart';
import 'package:somthn/buttonInfo.dart';
import 'package:somthn/buttonLightDark.dart';
import 'package:somthn/buttonMusic.dart';
import 'package:somthn/buttonSound.dart';
import 'BacksButton.dart';
import 'Home.dart';

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
  top:380,
  left: 250,
  child:MusicButton(onPressed:null,)
),
            Positioned(
                top:380,
                left: 55,
                child:SoundButton(onPressed:null,)
            ),
            Positioned(
                bottom:80,
                left:197,
                child:LightDarkButton(onPressed:null,)
            ),
            Positioned(
                bottom:80,
                left:0,
                child:HomeButton(onPressed:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),);
                })
            ),

            Positioned(
                top:140,
                left:0,
                child:BacksButton(onPressed:() {
    print("HELL YEAH");
    Navigator.pop(context);
    },
                )

            ),
            Positioned(
                top:180,
                left:250,
                child:InfoButton(onPressed:() {
                  print("clicking");
                })
            ),

          ]
      ),
    );
  }
}


