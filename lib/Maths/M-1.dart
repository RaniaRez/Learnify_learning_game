import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Maths/M-1-1.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../Services/Login.dart';
import 'BienvenueMath.dart';



class Math1 extends StatefulWidget {
  @override
  _Math1State createState() => _Math1State();
}

class _Math1State extends State<Math1> {
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
                bottom: size.height*0.3,
                right: size.width*0.47,
                child: SvgPicture.asset(buttonfacile),
              ),
             if (user.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.1,
                    bottom:size.width*0.7,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
             if (user.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    height: size.width*0.35,
                    width: size.width*0.35,

                    left: size.width*0.07,
                    bottom:size.width*0.69,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
             if (user.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.1,
                    bottom:size.width*0.7,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.1,
                    bottom:size.width*0.7,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

              Positioned(
                height: size.width*0.7,
                width: size.width*0.7,
                left: size.width*0.25,
                top:size.height*0.2,
                child:SvgPicture.asset(bulleCalculReflechi1),
              ),


              Positioned(
                top: size.height*0.8,
                left:size.width*0.75,
                  child: GoToButton(onPressed: (){
                    scoreM.niv1=0;
                    print("HELL YEAH");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => M_1_1()),);
                  },),
              ),
            ]
        ),
      ),
    );

  }
}

