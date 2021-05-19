import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Maths/M-1-1-3rdAttempt-1.dart';
import 'package:somthn/Maths/M-1-1-3rdAttempt-2.dart';
import 'package:somthn/Maths/M-1-1-3rdAttempt-3.dart';
import 'package:somthn/Maths/M-1-1-3rdAttempt-4.dart';
import 'dart:math';
import 'package:somthn/Maths/M-1-1-3rdAttempt.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../WelcomePages/ChooseAvatar.dart';
import 'package:somthn/Buttons/buttonAppliquer.dart';
import '../Services/Login.dart';
import '../Services/SignUp.dart';

class I_M_1_1_ extends StatefulWidget {
  const I_M_1_1_({Key key}) : super(key: key);

  @override
  _I_M_1_1_State createState() => _I_M_1_1_State();
}

class _I_M_1_1_State extends State<I_M_1_1_> {
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
                bottom: size.height*0.9,
                left: size.width*0.275 ,
                child: SvgPicture.asset(EmptyBar),
              ),

              Positioned(
                  bottom: size.height*0.25,
                  left: size.width*0.2 ,
                  height: size.height*0.6,
                  width: size.width*0.6,
                  child: SvgPicture.asset(I_M_1_1)),
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
            bottom: size.height*0.3,
            left: size.width*0.58 ,
              child: SvgPicture.asset(Stick),
          ),
              Positioned(
                bottom: size.height*0.05,
                right: size.width*0.5 ,
                  child: AppliquerButton(onPressed : (){
                    final _random = new Random();
                    int rnd = 0 + _random.nextInt(5);
                    if(rnd==0){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => M_1_1_3rd()));
                    }else if(rnd==1){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => M_1_1_3rd_1()));
                    }else if (rnd==2){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => M_1_1_3rd_2()));
                    }else if(rnd == 3){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => M_1_1_3rd_3()));
                    }else{
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => M_1_1_3rd_4()));
                    }

                    print('appliquer');
                  }),
              )
            ],
          )),
    );
  }

}
