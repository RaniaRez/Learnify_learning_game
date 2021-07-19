import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/BarreProgres.dart';
import 'package:somthn/Francais/F-1.dart';
import 'package:somthn/Francais/F-2-1-2nd-Alice.dart';
import 'package:somthn/Francais/F-2-1-2nd-Entrain.dart';
import 'package:somthn/Francais/F-2-1-2nd-Francaise.dart';
import 'package:somthn/Francais/F-2-1-2nd-dapprendre.dart';
import 'package:somthn/Francais/F-2-1-2nd-lalangue.dart';
import 'package:somthn/Francais/F-2-2.dart';
import 'package:somthn/Francais/F-2-3.dart';
import 'package:somthn/Francais/F-2.dart';
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

import 'F-2-2.dart';

class F_2_1 extends StatefulWidget {
  const F_2_1({Key key}) : super(key: key);

  @override
  _F_2_1State createState() => _F_2_1State();
}

class _F_2_1State extends State<F_2_1> {

  AudioPlayer advancedPlayer;
  var player = AudioCache();
  var player2 = AudioPlayer ();
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
                  SettingsButton(onPressed: (){
                    player2?.stop();

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
                    player2?.stop();

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
                child: SvgPicture.asset(EmptyBar),
              ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: BarreProgres(),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.49,
                  left: size.width*0.15,
                  height: size.width*0.7,
                  width: size.width*0.7,
                  child:SvgPicture.asset('assets/icons/SquareTable.svg'),
                ),
              ),
              if (user.avatar=="Pink")
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.36,
                  left: size.width*0.62,
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
                    child:PurpleAvatarIcon( onPressed: null,
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
                child:SvgPicture.asset('assets/icons/trouverVerbe.svg'),
              ),

              Positioned(
                  top: size.height*0.55,
                  left: size.width*0.2,
                  height: size.width*0.15,
                  width: size.width*0.25,
                  child: Visibility(
                    visible: Visible,
                    child: IconButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => F_2_1_2nd_alice()));
                        print('alice');
                      },
                      icon: SvgPicture.asset('assets/icons/Alice.svg'),
                    ),)
              ),
              Positioned(
                  top: size.height*0.55,
                  left: size.width*0.39,
                  height: size.width*0.15,
                  width: size.width*0.15,
                  child: Visibility(
                    visible: Visible,
                    child: IconButton(
                      onPressed: () async {
                        player2 =  await player.play('audio/mathsBravo.wav');

                        setState(() {
                          Visible=false;
                          correct=true;
                          scoreF.niv2+=2;
                        });
                        print('est');
                      },
                      icon: SvgPicture.asset('assets/icons/Est.svg'),
                    ),)
              ),
              Positioned(
                  top: size.height*0.55,
                  left: size.width*0.51,
                  height: size.width*0.15,
                  width: size.width*0.3,
                  child: Visibility(
                    visible: Visible,
                    child: IconButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => F_2_1_2nd_entrain()));
                        print('entrain');
                      },
                      icon: SvgPicture.asset('assets/icons/en train.svg'),
                    ),)
              ),
              Positioned(
                  top: size.height*0.6,
                  left: size.width*0.315,
                  height: size.width*0.2,
                  width: size.width*0.4,
                  child: Visibility(
                    visible: Visible,
                    child: IconButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => F_2_1_2nd_app()));
                        print('dapprendre');
                      },
                      icon: SvgPicture.asset('assets/icons/dapprendre.svg'),
                    ),)
              ),
              Positioned(
                  top: size.height*0.67,
                  left: size.width*0.22,
                  height: size.width*0.16,
                  width: size.width*0.3,
                  child: Visibility(
                    visible: Visible,
                    child: IconButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => F_2_1_2nd_lalangue()));
                        print('lalangue');
                      },
                      icon: SvgPicture.asset('assets/icons/lalangue.svg'),
                    ),)
              ),
              Positioned(
                  top: size.height*0.67,
                  left: size.width*0.5,
                  height: size.width*0.16,
                  width: size.width*0.3,
                  child: Visibility(
                    visible: Visible,
                    child: IconButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => F_2_1_2nd_fr()));
                        print('fr');
                      },
                      icon: SvgPicture.asset('assets/icons/Francaise.svg'),
                    ),)
              ),
              Visibility(
                visible: !Visible&&correct,
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(Right),
                ),
              ),
              Visibility(
                visible: !Visible&&!correct,
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(Wrong),
                ),
              ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                    top: size.height*0.8,
                    left: 0.0,
                    height: size.height*0.2,
                    width: size.width*0.5,
                    child: ButtonContinuer(onPressed: (){
                      player2?.stop();

                      print('HADA SCORE');
                      print(scoreF.niv2);
                      Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => new F_2_2()));
                      print('Continuer');
                    },)
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
              )
            ],
          ),
        ));
  }

}
