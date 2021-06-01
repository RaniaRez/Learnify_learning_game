import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Bulles/BullenomIcon.dart';
import 'package:somthn/Francais/F-1.dart';
import 'package:somthn/Francais/F-3-1.dart';
import 'package:somthn/Francais/NiveauFr.dart';
import 'package:somthn/Maths/M-2-1.dart';
import 'package:somthn/Maths/M-3-1.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../WelcomePages/ChooseAvatar.dart';
import '../Services/Login.dart';
import '../Services/SignUp.dart';
import 'BienvenueFr.dart';

class Fr3 extends StatefulWidget {
  @override
  _Fr3State createState() => _Fr3State();
}

class _Fr3State extends State<Fr3> {
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
                  right:size.width*0.75,

                  child: BacksButton(onPressed: (){
                    print("u clicked me");
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NiveauFr()));
                  },)
              ),

              Positioned(
                  top:size.height*0.05,
                  left:size.width*0.75,
                  child: SettingsButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("settings");
                  },)
              ),
              Positioned(
                top: size.height*0.67,
                left: size.width*0.5,
                child: SvgPicture.asset(buttonDifficile),
              ),
              if (user.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    top: size.height*0.465,
                    right: size.width*0.2,
                    height: size.height*0.3,
                    width: size.width*0.3,


                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    top: size.height*0.44,
                    right: size.width*0.18,
                    height: size.height*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    top: size.height*0.47,
                    right: size.width*0.2,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    top: size.height*0.465,
                    right: size.width*0.2,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

              Positioned(
                height: size.width*0.7,
                width: size.width*0.7,
                left: size.width*0.15,
                top:size.height*0.2,
                child:SvgPicture.asset("assets/icons/bulleN3.svg"),
              ),
              Positioned(
                top: size.height*0.8,
                left:size.width*0.75,
                child: GoToButton(onPressed: (){
                  print("HELL YEAH");
                  scoreF.niv3=0;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => F_3_1()),);
                },),
              ),



            ]
        ),
      ),
    );

  }
}

