import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/Buttons/buttonReset.dart';
import 'package:somthn/Francais/F-1.dart';
import 'package:somthn/Francais/F-2.dart';
import 'package:somthn/Maths/BienvenueMath.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/WelcomePages/Voila.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import '../WelcomePages/Home.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../Services/Login.dart';
import 'BienvenueFr.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


class Niveau1Pass extends StatefulWidget {
  @override
  _Niveau1PassState createState() => _Niveau1PassState();
}

class _Niveau1PassState extends State<Niveau1Pass> {

  AudioPlayer advancedPlayer;
  bool complet = (scoreF.niv1 >=7.5);

  @override
  initState() {
    super.initState();
    if (complet){
      loadMusic();}
    else {}
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/niveauPasse.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool star1 = (scoreF.niv1>=3);
    bool star2 = (scoreF.niv1>=6);
    bool star3 = (scoreF.niv1>=9);
    if ((scoreF.niv2<0)&&(complet)) { scoreF.niv2=0;
    Firestore.instance.collection('users').document(user.uid).collection('domains').document('francais').updateData({'niv2':scoreF.niv2});}
    /*print("khra2");
    print(scoreM.niv1);
    print("khra2");
    Firestore.instance.collection('users').document(user.uid).collection('domains').document('maths').updateData({'niv1':scoreM.niv1});*/
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
                left:size.width*0.75,
                child: SettingsButton(onPressed: () async {
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

                  print("HELL YEAH");
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Fr1() ));
                },)
            ),
            Positioned(
              top: size.height*0.047,
              left: size.width*0.39,
              child: HomeButton(
                onPressed: () async {
                  int result = await advancedPlayer?.pause();

                  print("HELL YEAH8");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Voila()),);

                },
              ),
            ),
            Positioned(
                top: size.height*0.42,
                left: size.width*0.1,
                height: size.height*0.3,
                width: size.width*0.8,
                child: Visibility(

                    child: SvgPicture.asset('assets/icons/nivTab.svg'))
            ),
            Positioned(
                top: size.height*0.61,
                left: size.width*0.45,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    high.niv1 .toString(),
                    style:TextStyle(
                      fontSize: 30,
                      fontFamily: 'Skranji-Bold',
                      fontWeight: FontWeight.bold,
                      color:Color(0xff693821),
                    ),
                  ),
                )),
            Positioned(
                top: size.height*0.52,
                left: size.width*0.45,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    scoreF.niv1 .toString() ,
                    style:TextStyle(
                      fontSize: 30,
                      fontFamily: 'Skranji-Bold',
                      fontWeight: FontWeight.bold,
                      color:Color(0xff693821),
                    ),
                  ),
                )),
            if ((complet)&&(user.avatar=="Pink"))
              Visibility(

                child: Positioned(
                  top: size.height*0.32,
                  right: size.width*0.6,
                  height: size.width*0.3,
                  width: size.width*0.3,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if ((complet)&&(user.avatar=="Purple"))
              Visibility(

                child: Positioned(
                  top: size.height*0.31,
                  right: size.width*0.57,
                  height: size.width*0.35,
                  width: size.width*0.35,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if ((complet)&&(user.avatar=="Orange"))
              Visibility(

                child: Positioned(
                  top: size.height*0.32,
                  right: size.width*0.6,
                  height: size.width*0.3,
                  width: size.width*0.3,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
            if ((complet)&&(user.avatar=="Blue"))
              Visibility(

                child: Positioned(
                  top: size.height*0.32,
                  right: size.width*0.6,
                  height: size.width*0.3,
                  width: size.width*0.3,
                  child:BlueAvatarIcon(onPressed: null,),
                ),
              ),

            if ((!complet)&&(user.avatar=="Pink"))
              Visibility(
                child: Positioned(
                  height: size.width*0.3,
                  width: size.width*0.3,
                  left: size.width*0.1,
                  top:size.height*0.31,
                  child: Image.asset('images/MadPink.gif'),
                ),
              ),
            if ((!complet)&&(user.avatar=="Purple"))
              Visibility(

                child: Positioned(
                  height: size.width*0.35,
                  width: size.width*0.35,
                  left: size.width*0.1,
                  top:size.height*0.29,
                  child:Image.asset('images/MadPurple.gif'),
                ),
              ),
            if ((!complet)&&(user.avatar=="Orange"))
              Visibility(

                child: Positioned(
                  height: size.width*0.3,
                  width: size.width*0.3,
                  left: size.width*0.1,
                  top:size.height*0.31,
                  child: Image.asset('images/MadOrange.gif'),
                ),
              ),
            if ((!complet)&&(user.avatar=="Blue"))
              Visibility(
                child: Positioned(
                  height: size.width*0.3,
                  width: size.width*0.3,
                  left: size.width*0.1,
                  top:size.height*0.31,
                  child:Image.asset('images/MadBlue.gif'),
                ),
              ),
            Visibility(
              visible: complet,
              child: Positioned(
                top: size.height*0.07,
                right: size.width*0.07,
                height: size.height*0.4,
                width: size.width*0.6,
                child:SvgPicture.asset(bulleNiveauPasse),
              ),
            ),
            Visibility(
              visible: !complet,
              child: Positioned(
                top: size.height*0.07,
                right: size.width*0.07,
                height: size.height*0.4,
                width: size.width*0.6,
                child:SvgPicture.asset('assets/icons/nivIncomplet.svg'),
              ),
            ),
            Positioned(

              top: size.height*0.7,
              left: size.width*0.08,
              child: Row(
                children: <Widget>[
                  Container(
                      height: size.height*0.15,
                      width: size.height*0.15,
                      child: SvgPicture.asset('assets/icons/EmptyStar.svg')),
                  Container(
                      height: size.height*0.15,
                      width: size.height*0.15,
                      child: SvgPicture.asset('assets/icons/EmptyStar.svg')),
                  Container(
                      height: size.height*0.15,
                      width: size.height*0.15,
                      child: SvgPicture.asset('assets/icons/EmptyStar.svg')),
                ],
              ),
            ),
            Positioned(

              top: size.height*0.7,
              left: size.width*0.08,
              child: Row(
                children: <Widget>[
                  Visibility(
                    visible: star1,
                    child: Container(
                        height: size.height*0.15,
                        width: size.height*0.15,
                        child: SvgPicture.asset('assets/icons/Star.svg')),
                  ),
                  Visibility(
                    visible: star2,
                    child: Container(
                        height: size.height*0.15,
                        width: size.height*0.15,
                        child: SvgPicture.asset('assets/icons/Star.svg')),
                  ),
                  Visibility(
                    visible: star3,
                    child: Container(
                        height: size.height*0.15,
                        width: size.height*0.15,
                        child: SvgPicture.asset('assets/icons/Star.svg')),
                  ),
                ],
              ),
            ),

            Positioned(
              top: size.height*0.87,
              left: size.width*0.7 ,
              child: Visibility(
                visible: ((complet) || (scoreF.niv2 >=0 )) ,
                child: GoToButton(onPressed: () async {
                 // int result = await advancedPlayer?.pause();

                  print(scoreM.niv1);
                  print('khra');
                  //Firestore.instance.collection('users').document(user.uid).collection('domains').document('maths').updateData({'niv1':scoreM.niv1});
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Fr2()));
                }),
              ),
            ),
            Visibility(
              visible: !complet,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonReset(
                    onPressed: () {
                      print('reset');
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Fr1()));
                    }

                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
