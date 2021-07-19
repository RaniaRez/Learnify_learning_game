import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Francais/boxDialog1.dart';
import 'package:somthn/Maths/M-1-1-3rdAttempt-1.dart';
import 'package:somthn/Maths/boxDialogMath1.dart';
import 'dart:math';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Buttons/buttonAppliquer.dart';
import '../Services/Login.dart';
import 'M-1.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


class I_M_1_1_ extends StatefulWidget {
  const I_M_1_1_({Key key}) : super(key: key);

  @override
  _I_M_1_1_State createState() => _I_M_1_1_State();
}

class _I_M_1_1_State extends State<I_M_1_1_> {
  var player = AudioCache();
  var player2 = AudioPlayer ();
  AudioPlayer advancedPlayer;


  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/mathsObserve.wav");
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
                        image: AssetImage("images/mathsBG.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: size.height*0.05,
                  left:size.width*0.75,
                  child:
                  SettingsButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("HELL YEAH");
                  },)
              ),
    Positioned(
    top: size.height*0.05,
    right:size.width*0.75,
    child: BacksButton(onPressed: (){
    showDialog(context: context,
    builder: (BuildContext context){
    return customDialogMath1();
    }
    );

    },)
    ),



              Positioned(
                bottom: size.height*0.88,
                left: size.width*0.275 ,
                right:size.width*0.275 ,
                child: SvgPicture.asset(EmptyBar),
              ),

              Positioned(
                  bottom: size.height*0.25,
                  left: size.width*0.2 ,
                  height: size.height*0.6,
                  width: size.width*0.6,
                  child: SvgPicture.asset('assets/icons/M-1-1-Indice.svg')),
              if (user.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.7,
                    top:size.height*0.57,
                    child:SvgPicture.asset('assets/icons/BPink.svg'),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.68,
                    top:size.height*0.57,
                    child:SvgPicture.asset('assets/icons/BPurple.svg'),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.7,
                    top:size.height*0.57,
                    child: SvgPicture.asset('assets/icons/BOrange.svg'),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.7,
                    top:size.height*0.57,
                    child:SvgPicture.asset('assets/icons/BBlue.svg'),
                  ),
                ),
              Positioned(
                bottom: size.height*0.05,
                right: size.width*0.5 ,
                  child: AppliquerButton(onPressed : () async {
                    player2?.stop();
                    if (advancedPlayer!=null){
                      int result = await advancedPlayer?.pause();}
                    final _random = new Random();

                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => M_1_1_3rd_1()));
                  }),
              )
            ],
          )),
    );
  }

}
