import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Buttons/buttonCommencer.dart';
import '../Buttons/settingsButton.dart';
import '../WelcomePages/Users.dart';
import '../WelcomePages/Settings.dart';
import '../myicons.dart';
import '../WelcomePages/ChooseAvatar.dart';

class TestNiveau extends StatefulWidget {
  @override
  _TestNiveauState createState() => _TestNiveauState();
}

class _TestNiveauState extends State<TestNiveau> {
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
                  right:size.width*0.75,
                  child: BacksButton(onPressed: (){
                    print("HELL YEAH");
                    Navigator.pop(context);
                  },)
              ),
              Positioned(
                  top: size.height*0.54,
                  right: size.width*0.25,
                  height: size.height*0.55,
                  width: size.width*0.55,
                  child: ButtonCommencer(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Users()));
                    print("allons-y");
                  } )),
              Positioned(
                  top: size.height*0.05,
                  left:size.width*0.75,
                  child:
                  SettingsButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("settings");
                  },)
              ),
              Positioned(
                  height: size.height*0.7,
                  width: size.width*0.7,
                  right: size.width*0.2,
                  top:size.height*0.1,

                  child: SvgPicture.asset(BulleTest)),
              Visibility(

                child: Positioned(
                    height: size.height*0.5,
                    width: size.width*0.5,
                    left: size.width*0.52,
                    top:size.height*0.4,
                  child: SvgPicture.asset(SimpleBranch2)),
                ),
              if (New.avatar=="Pink")
                Visibility(

                  child: Positioned(
                     top: size.height*0.45,
                     right: size.width*0.05 ,
                      height: size.height*0.3,
                     width: size.width*0.3,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (New.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    top: size.height*0.42,
                    right: size.width*0.05 ,
                    height: size.height*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (New.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    top: size.height*0.45,
                    right: size.width*0.05 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
             // if (New.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    top: size.height*0.45,
                    right: size.width*0.05 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),
            ]
        ),
      ),
    );

  }
}
