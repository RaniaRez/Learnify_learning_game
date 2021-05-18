import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Bulles/BullenomIcon.dart';
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
                left: size.width*0.2 ,
                height: size.height*0.55,
                width: size.width*0.55,

                child: ButtonCommencerD(onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TestNiveau()));
                }
                ),
              ),
              if (New.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    top: 400.0,
                    right: 250.0 ,
                    height: 300.0,
                    width: 200.0,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (New.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    top: 405.0,
                    right: 250.0 ,
                    height: 300.0,
                    width: 200.0,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (New.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    top: 410.0,
                    right: 250.0 ,
                    height: 300.0,
                    width: 200.0,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (New.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    top: 400.0,
                    right: 250.0 ,
                    height: 300.0,
                    width: 200.0,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

                Positioned(
                  height: size.height*0.6,
                  width: size.width*0.6,
                  right: size.width*0.15,
                  top:size.height*0.2,
                  child:SvgPicture.asset(bulleTestNiv),
                ),


            ]
        ),
      ),
    );

  }
}

