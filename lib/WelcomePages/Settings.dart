
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Buttons/buttonInfo.dart';
import 'package:somthn/Buttons/buttonMusic.dart';
import 'package:somthn/Buttons/buttonSound.dart';
import 'package:somthn/Buttons/buttonUserSettings.dart';
import 'package:somthn/WelcomePages/Ipage.dart';
import 'package:somthn/WelcomePages/Voila.dart';
import 'package:somthn/modification/Userinfo.dart';
import '../Buttons/BacksButton.dart';
import '../Buttons/butttonExit.dart';
import 'Home.dart';
import '../Services/auth.dart';
import 'package:audioplayers/audioplayers.dart';
import 'musicVar.dart';


class Settings extends StatefulWidget {
  AudioPlayer value = new AudioPlayer();
  Settings ({this.value});
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AudioPlayer value = new AudioPlayer();
  _SettingsState({this.value});
  bool noSound=false;
  bool noMusic= (advancedPlayer!=null);

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
            left:size.width*0.39,
            child:MusicButton(onPressed: () async {

              int result = await advancedPlayer.pause();
              setState(() {
                noMusic=true;
              });
            })
            ),
              if(noMusic)
                Positioned(
                    top: size.height*0.4,
                    left:size.width*0.39,
                    child:IconButton(
                      icon: SvgPicture.asset('assets/icons/noMusic.svg'),
                      iconSize: 90,
                      onPressed:() async{
                        advancedPlayer = await AudioCache().loop("audio/music.mp3");
                        await advancedPlayer?.setVolume(0.03);
                        setState(() {
                          noMusic=false;
                        });
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

                top: size.height*0.7,
                  right:size.width*0.6,
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
                      MaterialPageRoute(builder: (context) => Voila()),);
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ipage()),);
                  })
              ),

            ]
        ),
      ),
    );
  }
}


