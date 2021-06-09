
import 'package:flutter/material.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Buttons/buttonInfo.dart';
import 'package:somthn/Buttons/buttonMusic.dart';
import 'package:somthn/Buttons/buttonSound.dart';
import 'package:somthn/Buttons/buttonUserSettings.dart';
import 'package:somthn/WelcomePages/custom_dialog_box.dart';
import 'package:somthn/modification/Userinfo.dart';
import '../Buttons/BacksButton.dart';
import '../Buttons/butttonExit.dart';
import 'Home.dart';
import '../Services/auth.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


class Settings extends StatefulWidget {
  AudioPlayer value = new AudioPlayer();
  Settings ({this.value});
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AudioPlayer value = new AudioPlayer();
  _SettingsState({this.value});

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
            child:MusicButton(onPressed: () async {
              AudioPlayer advancedPlayer;
              int result = await advancedPlayer.pause();
            })
            ),
              Positioned(
                  top: size.height*0.4,
                  right:size.width*0.6,
                  child:SoundButton(onPressed:(){
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return CustomDialogBox(

                          );
                        }
                    );

                  },)
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
    Navigator.pop(context);
    },
                  )

              ),
              Positioned(
                  top: size.height*0.04,
                  left:size.width*0.75,
                  child:InfoButton(onPressed:() {
                  })
              ),

            ]
        ),
      ),
    );
  }
}


