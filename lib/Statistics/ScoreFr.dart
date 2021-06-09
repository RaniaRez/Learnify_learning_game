

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Francais/F-1-1.dart';
import 'package:somthn/Francais/NiveauFr.dart';
import 'package:somthn/Maths/M-1-1.dart';
import 'package:somthn/Statistics/Statistiques.dart';
import 'package:somthn/WelcomePages/Home.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../Services/Login.dart';


class FrScore extends StatefulWidget {
  @override
  _FrScoreState createState() => _FrScoreState();
}

class _FrScoreState extends State<FrScore> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int score=scorF.somme() ;
    int high=highF.somme();
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
                        image: AssetImage("images/forestbackground.jpg"),
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
                  },)
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: (){
                    Navigator.pop(context);
                  },)
              ),
              Positioned(
                  top: size.height*0.047,
                  left:size.width*0.4,
                  child: HomeButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },)
              ),

              if (user.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.65,
                    bottom:size.width*0.94,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    height: size.width*0.35,
                    width: size.width*0.35,
                    left: size.width*0.6,
                    bottom:size.width*0.9,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.65,
                    bottom:size.width*0.94,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.6,
                    bottom:size.width*0.99,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

              Positioned(
                height: size.width*0.5,
                width: size.width*0.5,
                left: size.width*0.25,
                top:size.height*0.2,
                child:SvgPicture.asset('assets/icons/bulleFr.svg'),
              ),
              Positioned(
                height: size.width*0.8,
                width: size.width*0.8,
                left: size.width*0.1,
                top:size.height*0.5,
                child:SvgPicture.asset('assets/icons/tableauScore.svg'),
              ),
              Stack(
                children: <Widget>
                [
                  Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.33,
                    top:size.height*0.57,
                    child:SvgPicture.asset('assets/icons/ButtonQ.svg'),
                  ),
                  Positioned(
                      left: size.width*0.45,
                      top:size.height*0.62,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          high.toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Skranji-Bold',
                            color: Color(0xff693821),
                          ),
                        ),
                      )
                  ) ,
                ],
              ),
              Stack(
                children: <Widget>
                [
                  Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.33,
                    top:size.height*0.75,
                    child:SvgPicture.asset('assets/icons/ButtonQ.svg'),
                  ),
                  Positioned(
                      left: size.width*0.45,
                      top:size.height*0.8,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          score.toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Skranji-Bold',
                            color: Color(0xff693821),
                          ),
                        ),
                      )
                  ) ,
                ],
              ),
            ]
        ),
      ),
    );

  }
}

