import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Branches/BranchIconSimple.dart';
import 'package:somthn/Francais/F-1-1.dart';
import 'package:somthn/Francais/NiveauFr.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../Services/Login.dart';
import 'BienvenueFr.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Fr1 extends StatefulWidget {
  @override
  _Fr1State createState() => _Fr1State();
}

class _Fr1State extends State<Fr1> {

  AudioPlayer advancedPlayer;


  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/Fr1.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Scaffold(
        body:
        Stack(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/frBG.jpg"),
                        fit: BoxFit.cover)),
              ),

              Positioned(
                  top: size.height*0.05,
                  left:size.width*0.75,
                  child:
                  SettingsButton(onPressed: () async {
                    int result = await advancedPlayer?.pause();

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("HELL YEAH");
                  },)
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: () async {
                    int result = await advancedPlayer?.pause();

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NiveauFr()));
                  },)
              ),


              Visibility(

                child: Positioned(
                  top: size.height*0.62,
                  right: size.width*0.62 ,
                  child:BranchIconSimple(),
                ),
              ),

              if (user.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    top: size.height*0.45,
                    right: size.width*0.63 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    top: size.height*0.43,
                    right: size.width*0.63 ,
                    height: size.height*0.35,
                    width: size.width*0.35,

                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    top: size.height*0.46,
                    right: size.width*0.63 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    top: size.height*0.45,
                    right: size.width*0.63 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

              Positioned(
                height: size.width*0.7,
                width: size.width*0.7,
                left: size.width*0.25,
                top:size.height*0.2,
                child:SvgPicture.asset('assets/icons/bulleN1.svg'),
              ),


              Positioned(
                top: size.height*0.8,
                left:size.width*0.75,
                child: GoToButton(onPressed: () async {
                  int result = await advancedPlayer?.pause();

                  print("HELL YEAH");
                  scoreF.niv1=0;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => F_1_1()),);
                },),
              ),
            ]
        ),
      ),
    );

  }
}

