import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Branches/BranchIconSimple.dart';
import 'package:somthn/Geographie/N1Q1.dart';
import 'package:somthn/Geographie/N1Q2.dart';
import 'package:somthn/Geographie/NiveauGeo.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../Services/Login.dart';
import 'BienvenueGeo.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Geo1 extends StatefulWidget {
  @override
  _Geo1State createState() => _Geo1State();
}

class _Geo1State extends State<Geo1> {

  AudioPlayer advancedPlayer;


  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/Geo1.wav");
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
                        image: AssetImage("images/geo_BG.jpg"),
                        fit: BoxFit.cover)),
              ),

              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,

                  child: BacksButton(onPressed: ()async{
                    if (advancedPlayer!=null){
                      int result = await advancedPlayer?.pause();}
                    print("u clicked me");
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NiveauGeo()));
                  },)
              ),

              Positioned(
                  top:size.height*0.05,
                  left:size.width*0.75,
                  child: SettingsButton(onPressed: ()async {
                    if (advancedPlayer!=null){
                      int result = await advancedPlayer?.pause();}
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("settings");
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
                    top: size.height*0.455,
                    right: size.width*0.65 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    top: size.height*0.435,
                    right: size.width*0.645,
                    height: size.height*0.35,
                    width: size.width*0.35,

                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    top: size.height*0.465,
                    right: size.width*0.675 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    top: size.height*0.455,
                    right: size.width*0.66 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

              Positioned(
                height: size.width*0.7,
                width: size.width*0.7,
                left: size.width*0.15,
                top:size.height*0.2,
                child:SvgPicture.asset("assets/icons/bulleN1.svg"),
              ),
              Positioned(
                top: size.height*0.8,
                left:size.width*0.75,
                child: GoToButton(onPressed: ()async {
                  print("HELL YEAH");
                  //scoreG.niv1=0;
                  if (advancedPlayer!=null){
                    int result = await advancedPlayer?.pause();}
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => N1Q1()),);
                },),
              ),



            ]
        ),
      ),
    );

  }
}