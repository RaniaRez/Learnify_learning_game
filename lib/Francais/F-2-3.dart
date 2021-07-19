import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Francais/F-1.dart';
import 'package:somthn/Francais/F-2-3-2nd-FourC.dart';
import 'package:somthn/Francais/F-2-3-2nd-OneC.dart';
import 'package:somthn/Francais/F-2-3-2nd-TwoC.dart';
import 'package:somthn/Francais/F-2-4.dart';
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

class F_2_3 extends StatefulWidget {
  const F_2_3({Key key}) : super(key: key);

  @override
  _F_2_3State createState() => _F_2_3State();
}

class _F_2_3State extends State<F_2_3> {
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
                        return customDialog2();
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
          Positioned(
            top: size.height * 0.5,
            left: size.width * 0.2,
            height: size.width * 0.3,
            width: size.width * 0.6,
            child: SvgPicture.asset('assets/icons/F-2-T-3.svg'),
          ),
          Visibility(
            visible: Visible,
            child: Positioned(
              top: size.height * 0.7,
              left: size.width * 0.05,
              height: size.height * 0.15,
              width: size.width * 0.4,
              child: IconButton(
                  onPressed: () async {
                    if(advancedPlayer !=null){
                      int result = await advancedPlayer?.pause();
                    }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => F_2_3_2ndOne()));
                  },
                  icon: SvgPicture.asset('assets/icons/ge.svg')),
            ),
          ),
          Visibility(
            visible: Visible,
            child: Positioned(
              top: size.height * 0.7,
              right: size.width * 0.05,
              height: size.height * 0.15,
              width: size.width * 0.4,
              child: IconButton(
                  onPressed: () async {
                    if(advancedPlayer !=null){
                      int result = await advancedPlayer?.pause();
                    }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => F_2_3_2ndTwo()));
                  },
                  icon: SvgPicture.asset('assets/icons/g.svg')),
            ),
          ),
          Visibility(
            visible: Visible,
            child: Positioned(
              top: size.height * 0.8,
              left: size.width * 0.05,
              height: size.height * 0.15,
              width: size.width * 0.4,
              child: IconButton(
                  onPressed: () async {
                    if(advancedPlayer !=null){
                      int result = await advancedPlayer?.pause();
                    }

                    player2 = await player.play('audio/mathsBravo.wav');

                    scoreF.niv2 += 2;
                    setState(() {
                      Visible = false;
                    });
                  },
                  icon: SvgPicture.asset('assets/icons/gu.svg')),
            ),
          ),
          Visibility(
            visible: Visible,
            child: Positioned(
              top: size.height * 0.8,
              right: size.width * 0.05,
              height: size.height * 0.15,
              width: size.width * 0.4,
              child: IconButton(
                  onPressed: () async {
                    if(advancedPlayer !=null){
                      int result = await advancedPlayer?.pause();
                    }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => F_2_3_2ndFour()));
                  },
                  icon: SvgPicture.asset('assets/icons/j.svg')),
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
                  onPressed: () {
                    setState(() {
                      Visible = false;
                    });
                  },
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
                child: PurpleAvatarIcon(
                  onPressed: () {
                    setState(() {
                      Visible = false;
                    });
                  },
                ),
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
                  onPressed: () {
                    setState(() {
                      Visible = false;
                    });
                  },
                ),
              ),
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
                  onPressed: () {
                    setState(() {
                      Visible = false;
                    });
                  },
                ),
              ),
            ),
          Positioned(
            top: size.height * 0.12,
            left: size.width * 0.2,
            height: size.width * 0.6,
            width: size.width * 0.6,
            child: SvgPicture.asset('assets/icons/bulleCompleter.svg'),
          ),
          Visibility(
            visible: !Visible,
            child: Positioned(
                top: size.height * 0.8,
                left: 0.0,
                height: size.height * 0.2,
                width: size.width * 0.5,
                child: ButtonContinuer(
                  onPressed: () async {
                    player2?.stop();
                    int result = await advancedPlayer?.pause();

                    print('HADA SCORE');
                    print(scoreF.niv2);
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new F_2_4()));
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
