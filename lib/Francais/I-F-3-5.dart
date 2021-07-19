import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/buttonReessayer.dart';
import 'package:somthn/Francais/F-3-5-2nd.dart';
import 'package:somthn/Francais/boxDialog3.dart';
import 'package:somthn/Maths/M-1-1-3rdAttempt-1.dart';
import 'dart:math';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Buttons/buttonAppliquer.dart';
import '../Services/Login.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


class I_F_3_5 extends StatefulWidget {
  const I_F_3_5({Key key}) : super(key: key);

  @override
  _I_F_3_5State createState() => _I_F_3_5State();
}

class _I_F_3_5State extends State<I_F_3_5> {
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
                  SettingsButton(onPressed: ()async{
                    await advancedPlayer?.pause();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("HELL YEAH");
                  },)
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: ()async{
                    await advancedPlayer?.pause();
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return customDialog3();
                        }
                    );

                  },)
              ),
              Positioned(
                bottom: size.height*0.88,
                left: size.width*0.275 ,
                right:size.width*0.275 ,
                child: SvgPicture.asset(FourBars),
              ),

              Positioned(
                  bottom: size.height*0.25,
                  left: size.width*0.2 ,
                  height: size.height*0.6,
                  width: size.width*0.6,
                  child: SvgPicture.asset('assets/icons/tbE.svg')),
              Positioned(
                  bottom: size.height*0.25,
                  left: size.width*0.2 ,
                  height: size.height*0.6,
                  width: size.width*0.6,
                  child: Image.asset('images/girafe.png')),
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
                child: ButtonReessayer(onPressed : () async {
                  player2?.stop();
                  int result = await advancedPlayer?.pause();
                  final _random = new Random();

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => F_3_5_2nd()));
                }),
              )
            ],
          )),
    );
  }

}
