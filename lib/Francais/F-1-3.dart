import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Francais/F-1-4.dart';
import 'package:somthn/Francais/F-1.dart';
import 'package:somthn/Francais/boxDialog1.dart';
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
import 'package:somthn/Francais/F-1-3-2-OneC.dart';
import 'package:somthn/Francais/F-1-3-2-FourC.dart';
import 'package:somthn/Francais/F-1-3-2-ThreeC.dart';
import 'BienvenueFr.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class F_1_3 extends StatefulWidget {
  const F_1_3({Key key}) : super(key: key);

  @override
  _F_1_3State createState() => _F_1_3State();
}

class _F_1_3State extends State<F_1_3> {
  AudioPlayer advancedPlayer;

  var player = AudioCache();
  var player2 = AudioPlayer();

  bool Visible = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/frBG.jpg"), fit: BoxFit.cover)),
          ),
          Positioned(
              top: size.height * 0.05,
              left: size.width * 0.75,
              child: SettingsButton(
                onPressed: () {
                  player2?.stop();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              )),
          Positioned(
              top: size.height * 0.05,
              right: size.width * 0.75,
              child: BacksButton(
                onPressed: () {
                  player2?.stop();

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return customDialog1();
                      });
                },
              )),
          Positioned(
            bottom: size.height * 0.88,
            left: size.width * 0.275,
            right: size.width * 0.275,
            child: SvgPicture.asset(TwoBars),
          ),
          Visibility(
            visible: !Visible,
            child: Positioned(
              bottom: size.height * 0.88,
              left: size.width * 0.275,
              right: size.width * 0.275,
              child: SvgPicture.asset(ThreeBars),
            ),
          ),
          Visibility(
            child: Positioned(
              top: size.height * 0.2,
              left: size.width * 0.27,
              height: size.width * 0.5,
              width: size.width * 0.5,
              child: SvgPicture.asset('assets/icons/table.svg'),
            ),
          ),
          Visibility(
            child: Positioned(
                top: size.height * 0.22,
                left: size.width * 0.3,
                height: size.width * 0.43,
                width: size.width * 0.43,
                child: Image.asset('images/Canard.jpg')),
          ),
          Visibility(
            visible: Visible,
            child: Positioned(
              top: size.height * 0.58,
              left: size.width * 0.05,
              height: size.width * 0.4,
              width: size.width * 0.4,
              child: IconButton(
                  onPressed: () async {
                    if(advancedPlayer !=null){
                      int result = await advancedPlayer?.pause();
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => F_1_3_2nd_OneC()));
                  },
                  icon: SvgPicture.asset('assets/icons/Canar.svg')),
            ),
          ),
          Visibility(
            visible: Visible,
            child: Positioned(
              top: size.height * 0.58,
              right: size.width * 0.05,
              height: size.width * 0.4,
              width: size.width * 0.4,
              child: IconButton(
                  onPressed: () async {
                    if(advancedPlayer !=null){
                      int result = await advancedPlayer?.pause();
                    }
                    player2 = await player.play('audio/mathsBravo.wav');

                    setState(() {
                      Visible = false;
                    });
                    scoreF.niv1 += 2;
                  },
                  icon: SvgPicture.asset('assets/icons/Canard.svg')),
            ),
          ),
          Visibility(
            visible: Visible,
            child: Positioned(
              top: size.height * 0.75,
              left: size.width * 0.05,
              height: size.width * 0.4,
              width: size.width * 0.4,
              child: IconButton(
                  onPressed: () async {
                    if(advancedPlayer !=null){
                      int result = await advancedPlayer?.pause();
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => F_1_3_2nd_threeC()));
                  },
                  icon: SvgPicture.asset('assets/icons/Cannar.svg')),
            ),
          ),
          Visibility(
            visible: Visible,
            child: Positioned(
              top: size.height * 0.75,
              right: size.width * 0.05,
              height: size.width * 0.4,
              width: size.width * 0.4,
              child: IconButton(
                  onPressed: ()  async {
                    if(advancedPlayer !=null){
                      int result = await advancedPlayer?.pause();
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => F_1_3_2nd_fourC()));
                  },
                  icon: SvgPicture.asset('assets/icons/UnCanar.svg')),
            ),
          ),
          if (user.avatar == "Pink")
            Visibility(
              visible: Visible,
              child: Positioned(
                top: size.height * 0.36,
                left: size.width * 0.72,
                height: size.width * 0.3,
                width: size.width * 0.3,
                child: PinkAvatarIcon(
                  onPressed: null,
                ),
              ),
            ),
          if (user.avatar == "Purple")
            Visibility(
              visible: Visible,
              child: Positioned(
                top: size.height * 0.35,
                left: size.width * 0.69,
                height: size.width * 0.35,
                width: size.width * 0.35,
                child: PurpleAvatarIcon(onPressed: null),
              ),
            ),
          if (user.avatar == "Orange")
            Visibility(
              visible: Visible,
              child: Positioned(
                  top: size.height * 0.365,
                  left: size.width * 0.72,
                  height: size.width * 0.3,
                  width: size.width * 0.3,
                  child: OrangeAvatarIcon(
                    onPressed: null,
                  )),
            ),
          if (user.avatar == "Blue")
            Visibility(
              visible: Visible,
              child: Positioned(
                top: size.height * 0.36,
                left: size.width * 0.72,
                height: size.width * 0.3,
                width: size.width * 0.3,
                child: BlueAvatarIcon(
                  onPressed: null,
                ),
              ),
            ),
          Visibility(
            visible: !Visible,
            child: Positioned(
                top: size.height * 0.8,
                left: 0.0,
                height: size.height * 0.2,
                width: size.width * 0.5,
                child: ButtonContinuer(
                  onPressed: () {
                    player2.stop();

                    print('HADA SCORE');
                    print(scoreF.niv1);
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new F_1_4()));
                  },
                )),
          ),
          if (user.avatar == "Pink")
            Visibility(
              visible: !Visible,
              child: Positioned(
                height: size.width * 0.3,
                width: size.width * 0.3,
                left: size.width * 0.1,
                top: size.height * 0.729,
                child: Image.asset('images/HappyPink.gif'),
              ),
            ),
          if (user.avatar == "Purple")
            Visibility(
              visible: !Visible,
              child: Positioned(
                height: size.width * 0.35,
                width: size.width * 0.35,
                left: size.width * 0.1,
                top: size.height * 0.7,
                child: Image.asset('images/HappyPurple.gif'),
              ),
            ),
          if (user.avatar == "Orange")
            Visibility(
              visible: !Visible,
              child: Positioned(
                height: size.width * 0.3,
                width: size.width * 0.3,
                left: size.width * 0.1,
                top: size.height * 0.729,
                child: Image.asset('images/HappyOrange.gif'),
              ),
            ),
          if (user.avatar == "Blue")
            Visibility(
              visible: !Visible,
              child: Positioned(
                height: size.width * 0.3,
                width: size.width * 0.3,
                left: size.width * 0.1,
                top: size.height * 0.729,
                child: Image.asset('images/HappyBlue.gif'),
              ),
            ),
          Visibility(
            visible: !Visible,
            child: Positioned(
                height: size.width * 0.45,
                width: size.width * 0.45,
                left: size.width * 0.4,
                top: size.height * 0.7,
                child: SvgPicture.asset(bulleBravo)),
          )
        ],
      ),
    ));
  }
}
