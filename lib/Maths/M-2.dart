import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Bulles/BullenomIcon.dart';
import 'package:somthn/Maths/M-2-1.dart';
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
class Math2 extends StatefulWidget {
  @override
  _Math2State createState() => _Math2State();
}

class _Math2State extends State<Math2> {
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
                        image: AssetImage("images/mathsBG.jpg"),
                        fit: BoxFit.cover)),
              ),

              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,

                  child: BacksButton(onPressed: (){
                    print("u clicked me");
                    Navigator.pop(context);
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
                bottom: 200.0,
                left: 215,
                child: SvgPicture.asset(buttonMoyen),
              ),
              if (user.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    top: size.height*0.48,
                    right: size.width*0.58,
                    height: size.height*0.3,
                    width: size.width*0.3,


                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    top: size.height*0.48,
                    right: size.width*0.58,
                    height: size.height*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    top: size.height*0.48,
                    right: size.width*0.58,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    top: size.height*0.48,
                    right: size.width*0.58,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

             /* Positioned(

                child:SvgPicture.asset(bulleCalculReflechi),
              ),*/
              Positioned(
                top : 250,
                left: 140.5,
                right: 80.5,
                child: SizedBox(
                  height: 150,
                  width:150,
                  child: Text(
                    'Calcul réfléchi niveau 2',
                    style: TextStyle(
                      fontFamily: 'Skranji-bold',
                      fontSize: 30,
                      color: Colors.brown[700],
                      fontWeight: FontWeight.bold,

                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Positioned(
                bottom: 20.0,
                left: 300.00,
                child: GoToButton(onPressed: (){
                  print("HELL YEAH");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => M_2_1()),);
                },),
              ),
            ]
        ),
      ),
    );

  }
}

