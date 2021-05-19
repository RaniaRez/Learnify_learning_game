import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
import 'package:somthn/Maths/NiveauMath.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonCommencerDroit.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../WelcomePages/ChooseAvatar.dart';




class BienvenueMath extends StatefulWidget {
  @override
  _BienvenueMathState createState() => _BienvenueMathState();
}

class _BienvenueMathState extends State<BienvenueMath> {
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
                top: size.height*0.5,
                right: size.width*0.48,
               height: size.height*0.55,
                width: size.width*0.55,
                child: ButtonCommencerD(onPressed: () {
                  print('commencer');
                  Navigator.push(

                      context,
                      MaterialPageRoute(builder: (context) => NiveauMath()));
                }
                ),
              ),
           //  if (New.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.15,
                    top:size.height*0.61,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
             if (New.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    top: size.height*0.6,
                    right: size.width*0.6 ,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
             if (New.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    top: size.height*0.61,
                    right: size.width*0.6 ,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (New.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    top: size.height*0.61,
                    right: size.width*0.6 ,
                    height: size.width*0.3,
                    width: size.width*0.25,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

              Positioned(
                top: size.height*0.05,
                left: size.width*0.2 ,
                height: size.height*0.8,
                width: size.width*0.8,
                child:SvgPicture.asset(BulleBienvenueMath),
              ),






            ]
        ),
      ),
    );

  }
}

