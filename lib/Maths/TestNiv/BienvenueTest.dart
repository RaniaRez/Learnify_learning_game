import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Buttons/buttonCommencer.dart';
import 'package:somthn/Buttons/settingsButton.dart';
import 'package:somthn/WelcomePages/ChoixDomaines.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/myicons.dart';
import 'package:somthn/Services/Login.dart';
import 'TestNivMathQ1.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class TestNiveau extends StatefulWidget {
  @override
  _TestNiveauState createState() => _TestNiveauState();
}

class _TestNiveauState extends State<TestNiveau> {

  AudioPlayer advancedPlayer;


  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/test.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }


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
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: (){
                    print("HELL YEAH");

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChoixDomaine()));
                  },)
              ),
              Positioned(
                  top: size.height*0.54,
                  right: size.width*0.25,
                  height: size.height*0.55,
                  width: size.width*0.55,
                  child: ButtonCommencer(onPressed: ()async {
                    if (advancedPlayer!=null){
                    int result = await advancedPlayer?.pause();}
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestNivM1()));
                    print("allons-y");
                  } )),
              Positioned(
                  top: size.height*0.05,
                  left:size.width*0.75,
                  child:
                  SettingsButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("settings");
                  },)
              ),
              Positioned(
                  height: size.height*0.7,
                  width: size.width*0.7,
                  right: size.width*0.2,
                  top:size.height*0.1,

                  child: SvgPicture.asset(BulleTest)),
              Visibility(

                child: Positioned(
                    height: size.height*0.5,
                    width: size.width*0.5,
                    left: size.width*0.52,
                    top:size.height*0.4,
                    child: SvgPicture.asset(SimpleBranch2)),
              ),
              if (user.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    top: size.height*0.45,
                    right: size.width*0.05 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    top: size.height*0.42,
                    right: size.width*0.05 ,
                    height: size.height*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    top: size.height*0.45,
                    right: size.width*0.05 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    top: size.height*0.45,
                    right: size.width*0.05 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),
            ]
        ),
      ),
    );

  }
}
