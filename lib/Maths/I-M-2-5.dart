import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Maths/M-1-5-3rdAttempt-1.dart';
import 'package:somthn/Maths/M-1-5-3rdAttempt-2.dart';
import 'package:somthn/Maths/M-1-5-3rdAttempt-3.dart';
import 'package:somthn/Maths/M-1-5-3rdAttempt-4.dart';
import 'package:somthn/Maths/M-1-5-3rdAttempt.dart';
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
import 'package:somthn/Maths/M-1-4-3rdAttempt-2.dart';
import 'package:somthn/Maths/M-1-4-3rdAttempt-3.dart';
import 'package:somthn/Maths/M-1-4-3rdAttempt-4.dart';
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
    return Scaffold(
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
                top: 50.00,
                left: 300.00,
                child:
                SettingsButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                  print("HELL YEAH");
                },)
            ),
            Positioned(
                top: 10.00,
                right: 250.00,
                child: BacksButton(onPressed: (){
                  Navigator.pop(context);
                },)
            ),

            Positioned(
              top: 70.00,
              right: 115.00,
              child: SvgPicture.asset(FourBars),
            ),

            Positioned(
                top: 200,
                right: 55,
                child: SvgPicture.asset(EmptyTable)),
            if (user.avatar=="Pink")
              Visibility(

                child: Positioned(
                  top: 465.0,
                  left: 290.0 ,
                  height: 130.0,
                  width: 130.0,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Purple")
              Visibility(

                child: Positioned(
                  top: 455.0,
                  left: 270.0 ,
                  height: 150.0,
                  width: 150.0,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Orange")
              Visibility(

                child: Positioned(
                  top: 470.0,
                  left: 285.0 ,
                  height: 130.0,
                  width: 130.0,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Blue")
              Visibility(

                child: Positioned(
                  top: 465.0,
                  left: 280.0 ,
                  height: 130.0,
                  width: 130.0,
                  child:BlueAvatarIcon(onPressed: null,),
                ),
              ),
            Positioned(
              top: 450,
              right: 90,
              child: SvgPicture.asset(Stick),
            ),
            Positioned(
                top: 250,
                right: 90,
                child: Text(
                  'Observe :\nDiviser un nombre \nde dizaines par 5:\n5 est la moitié de 10\n120/10=12\n12x2=24\nen fin 120/5=24',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Skranji-Bold',
                      color : Colors.brown[700]
                  ),
                  textAlign: TextAlign.center,
                )
            ),
            Positioned(
              bottom: 0,
              child: AppliquerButton(onPressed : (){
                final _random = new Random();
                int rnd = 0 + _random.nextInt(5);
                if(rnd==0){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => M_1_5_3rd()));
                }else if(rnd==1){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => M_1_5_3rd_1()));
                }else if (rnd==2){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => M_1_5_3rd_2()));
                }else if(rnd == 3){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => M_1_5_3rd_3()));
                }else{
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => M_1_5_3rd_4()));
                }

                print('appliquer');
              }),
            )
          ],
        ));
  }

}
