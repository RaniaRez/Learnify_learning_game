import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Francais/F-1-1-2nd.dart';
import 'package:somthn/Francais/F-1.dart';
import 'package:somthn/Francais/F-3.dart';
import 'package:somthn/Francais/boxDialog1.dart';
import 'package:somthn/Francais/boxDialog3.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import '../Buttons/buttonReessayer.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../Services/Login.dart';


class I_F_1_1 extends StatefulWidget {
  @override
  _I_F_1_1State createState() => _I_F_1_1State();
}

class _I_F_1_1State extends State<I_F_1_1> {
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
                        image: AssetImage("images/frBG.jpg"),
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
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return customDialog1();
                        }
                    );
                  },)
              ),

              Positioned(
                bottom: size.height*0.3,
                right: size.width*0.47,
                height: size.height*0.1,
                width: size.width*0.55,
                child: ButtonReessayer(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => F_1_1_2nd()));

                },),
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
                child:SvgPicture.asset('assets/icons/IF1.svg'),
              ),



            ]
        ),
      ),
    );

  }
}

