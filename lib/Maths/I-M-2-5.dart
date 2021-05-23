import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Maths/M-1-5-3rdAttempt-1.dart';
import 'package:somthn/Maths/M-1-5-3rdAttempt.dart';
import 'package:somthn/Maths/M-2-4-3rdAttempt.dart';
import 'dart:math';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
//import '../WelcomePages/ChooseAvatar.dart';
import 'package:somthn/Buttons/buttonAppliquer.dart';
import 'package:somthn/Maths/M-1-4-3rdAttempt-1.dart';
import 'package:somthn/Maths/M-1-4-3rdAttempt.dart';
import '../Services/Login.dart';
import '../Services/SignUp.dart';

import '../myicons.dart';

class I_M_2_5_ extends StatefulWidget {
  const I_M_2_5_({Key key}) : super(key: key);

  @override
  _I_M_2_5_State createState() => _I_M_2_5_State();
}

class _I_M_2_5_State extends State<I_M_2_5_> {
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
                    Navigator.pop(context);
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
                  child: SvgPicture.asset(EmptyTable)),
              if (user.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.7,
                    top:size.height*0.57,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    height: size.width*0.35,
                    width: size.width*0.35,
                    left: size.width*0.68,
                    top:size.height*0.57,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.7,
                    top:size.height*0.57,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.7,
                    top:size.height*0.57,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),
              Positioned(
                bottom: size.height*0.27,
                left: size.width*0.58,
                child: SvgPicture.asset(Stick),
              ),

              Positioned(
                top: size.height*0.3,
                left: size.width*0.27 ,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Observe :\nDiviser un nombre \nde dizaines par 5:\n5 est la moitié de 10\n120/10=12\n12x2=24\nen fin 120/5=24',



                    style:TextStyle(
                      fontSize: 20.5,
                      fontFamily: 'Skranji-Bold',
                      fontWeight: FontWeight.bold,
                      color:Colors.brown[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              ),
              Positioned(
                bottom: size.height*0.05,
                right: size.width*0.5 ,
                child: AppliquerButton(onPressed : (){
                  print('appliquer');


                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => M_2_4_3rd_()));}

                ),
              ),
            ],
          )),
    );
  }

}
