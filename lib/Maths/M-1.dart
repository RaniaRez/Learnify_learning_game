import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Bulles/BullenomIcon.dart';
import 'package:somthn/Maths/M-1-1.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../WelcomePages/ChooseAvatar.dart';
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
                bottom: size.height*0.25,
                right: size.width*0.5 ,
                child: SvgPicture.asset(buttonfacile),
              ),
              if (New.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.2,
                    bottom:size.width*0.63,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (New.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    height: size.width*0.35,
                    width: size.width*0.35,
                    left: size.width*0.15,
                    top:size.height*0.53,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
             if (New.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.1,
                    top:size.height*0.54,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
             // if (New.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.1,
                    top:size.height*0.54,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

              Positioned(
                  top: size.height*0.05,
                  left: size.width*0.3 ,
                  height: size.height*0.7,
                  width: size.width*0.7,
                child:SvgPicture.asset(bulleCalculReflechi1)
              ),


              Positioned(
                top: size.height*0.8,
                left:size.width*0.75,
                  child: GoToButton(onPressed: (){
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

