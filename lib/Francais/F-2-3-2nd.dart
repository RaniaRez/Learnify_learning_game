import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Francais/F-2-4.dart';
import 'package:somthn/Francais/boxDialog2.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonContinuer.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../Services/Login.dart';
import 'BienvenueFr.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'F-2.dart';

class F_1_2 extends StatefulWidget {
  const F_1_2({Key key}) : super(key: key);

  @override
  _F_1_2State createState() => _F_1_2State();
}

class _F_1_2State extends State<F_1_2> {

  AudioPlayer advancedPlayer;
  var player = AudioCache();
  var player2 = AudioPlayer ();

  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/mathsMauvRep.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }


  bool Visible = true;
  bool correct = false;
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
                        image: AssetImage("images/frBG.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: size.height*0.05,
                  left:size.width*0.75,
                  child:
                  SettingsButton(onPressed: ()async {
                    player2?.stop();
                    await advancedPlayer?.pause();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },)
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: ()async {
                    player2?.stop();
                    await advancedPlayer?.pause();
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return customDialog2();
                        }
                    );
                  },)
              ),
              Positioned(
                bottom: size.height*0.88,
                left: size.width*0.275,
                right: size.width*0.275,
                child: SvgPicture.asset(TwoBars),
              ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(ThreeBars),
                ),
              ),
              Positioned(
                top: size.height*0.5,
                left: size.width*0.2,
                height: size.width*0.3,
                width: size.width*0.6,
                child:SvgPicture.asset('assets/icons/F-2-T-3.svg'),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.7,
                  left: size.width*0.05,
                  height: size.height*0.15,
                  width: size.width*0.4,
                  child: IconButton(
                      onPressed: (){

                        setState(() {
                          Visible=false;
                        });
                      },
                      icon: SvgPicture.asset('assets/icons/ge.svg')),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.7,
                  right: size.width*0.05,
                  height: size.height*0.15,
                  width: size.width*0.4,
                  child: IconButton(
                      onPressed: (){
                        setState(() {
                          Visible=false;
                        });
                      },
                      icon: SvgPicture.asset('assets/icons/g.svg')),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.8,
                  left: size.width*0.05,
                  height: size.height*0.15,
                  width: size.width*0.4,
                  child: IconButton(
                      onPressed: () async {
                        await advancedPlayer?.pause();
                        player2 =  await player.play('audio/mathsBravo.wav');

                        setState(() {
                          Visible=false;
                          correct=true;
                          scoreF.niv2+=1;
                        });
                      },
                      icon: SvgPicture.asset('assets/icons/gu.svg')),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.8,
                  right: size.width*0.05,
                  height: size.height*0.15,
                  width: size.width*0.4,
                  child: IconButton(
                      onPressed: (){
                        setState(() {
                          Visible=false;
                        });
                      },
                      icon: SvgPicture.asset('assets/icons/j.svg')),
                ),
              ),
              if (user.avatar=="Pink")
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.36,
                  left: size.width*0.72,
                  height: size.width*0.3,
                  width: size.width*0.3,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
              if (user.avatar=="Purple")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.35,
                    left: size.width*0.69,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,
                    ),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.365,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.36,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

              Positioned(
                top: size.height*0.12,
                left: size.width*0.2,
                height: size.width*0.6,
                width: size.width*0.6,
                child:SvgPicture.asset('assets/icons/bulleCompleter.svg'),
              ),



              Visibility(
                visible: !Visible,
                child: Positioned(
                    top: size.height*0.8,
                    left: 0.0,
                    height: size.height*0.2,
                    width: size.width*0.5,
                    child: ButtonContinuer(onPressed: ()async {
                      player2?.stop();
                      await advancedPlayer?.pause();
                      print('HADA SCORE');
                      print(scoreF.niv2);
                      Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => new F_2_4()));
                    },)
                ),
              ),
              if (correct)
                Stack(
                  children: <Widget>[
                    Visibility(
                      visible: !Visible,
                      child:Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(Right)
                      ),
                    ),
                    if (user.avatar=="Pink")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child:Image.asset('images/HappyPink.gif'),
                        ),
                      ),
                    if (user.avatar=="Purple")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.35,
                          width: size.width*0.35,
                          left: size.width*0.1,
                          top:size.height*0.7,
                          child:Image.asset('images/HappyPurple.gif'),
                        ),
                      ),
                    if (user.avatar=="Orange")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child: Image.asset('images/HappyOrange.gif'),
                        ),
                      ),
                    if (user.avatar=="Blue")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child:Image.asset('images/HappyBlue.gif'),
                        ),
                      ),
                    Visibility(
                      visible: !Visible,
                      child: Positioned(
                          height: size.width*0.45,
                          width: size.width*0.45,
                          left: size.width*0.4,
                          top:size.height*0.7,
                          child: SvgPicture.asset(bulleBravo)
                      ),
                    ),
                  ],
                ),
              if (!correct)
                Stack(
                  children:[
                    Visibility(
                      visible: !Visible,
                      child: Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(Wrong)
                      ),
                    ),
                    if (user.avatar=="Pink")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child: Image.asset('images/MadPink.gif'),
                        ),
                      ),
                    if (user.avatar=="Purple")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.35,
                          width: size.width*0.35,
                          left: size.width*0.1,
                          top:size.height*0.7,
                          child:Image.asset('images/MadPurple.gif'),
                        ),
                      ),
                    if (user.avatar=="Orange")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child: Image.asset('images/MadOrange.gif'),
                        ),
                      ),
                    if (user.avatar=="Blue")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child:Image.asset('images/MadBlue.gif'),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ));
  }

}
