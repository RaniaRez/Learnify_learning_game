import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/myicons.dart';
import 'TestDeniveau.dart';
import 'package:somthn/Buttons/buttonCommencerDroit.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../WelcomePages/ChooseAvatar.dart';
import '../Services/Login.dart';
import '../Services/SignUp.dart';




class BienvenueTest extends StatefulWidget {
  @override
  _BienvenueTestState createState() => _BienvenueTestState();
}

class _BienvenueTestState extends State<BienvenueTest> {
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
                top: size.height*0.48,
                right: size.width*0.48,
                height: size.height*0.55,
                width: size.width*0.55,

                child: ButtonCommencerD(onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TestNiveau()));
                }
                ),
              ),
              if (user.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    top: size.height*0.51,
                    right: size.width*0.7 ,
                    height: size.height*0.3,
                    width: size.width*0.3,

                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    top: size.height*0.52,
                    right: size.width*0.7 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    top: size.height*0.516,
                    right: size.width*0.7 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    top: size.height*0.51,
                    right: size.width*0.7 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

                Positioned(
                  height: size.height*0.7,
                  width: size.width*0.7,
                  right: size.width*0.1,
                  top:size.height*0.1,
                  child:SvgPicture.asset(bulleTestNiv),
                ),


            ]
        ),
      ),
    );

  }
}

