import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Buttons/Buttonoui.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/WelcomePages/ChoixDomaines.dart';
import 'package:somthn/WelcomePages/ChooseAvatar.dart';
import 'package:somthn/WelcomePages/Ecriremdp.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Buttons/buttonnon.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'Home.dart';
import 'Settings.dart';
import '../Branches/BranchIconSimple.dart';
import '../Bulles/BullemdpIcon.dart';
import 'ChooseAvatar.dart';
import 'Users.dart';



class AllSet extends StatefulWidget {
  @override
  _AllSetState createState() => _AllSetState();
}

class _AllSetState extends State<AllSet> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
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
                top: 8.00,
                right: 250.00,
                child: BacksButton(onPressed: (){
                  print("u clicked me");
                  Navigator.pop(context);
                },)
            ),
            Positioned(
              top: -3.5,
              left: 100.0,
              child: HomeButton(
                onPressed: (){
                  print("HELL");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),);

                },
              ),
            ),
            Positioned(
                top: 50.00,
                left: 300.00,
                child: SettingsButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                  print("settings");
                },)
            ),
            Positioned(
                top: 140,
                right: 80,
                height: 260,
                width: 260,
                child: SvgPicture.asset(bullevide)),
            Positioned(
                top: 240,
                right: 125,
                child: Text(
                  'Vous êtes prêt',
                  style: TextStyle(
                    fontFamily: 'Skranji-Bold',
                    fontSize: 25,
                    color: Colors.brown[700]
                  ),
                )
            ),
            Visibility(

              child: Positioned(
                top: 320.0,
                right: 250.0 ,
                height: 300.0,
                width: 200.0,
                child:BranchIconSimple(),
              ),
            ),
            if (New.avatar=="Pink")
              Visibility(

                child: Positioned(
                  top: 257.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Purple")
              Visibility(

                child: Positioned(
                  top: 257.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Orange")
              Visibility(

                child: Positioned(
                  top: 257.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Blue")
              Visibility(

                child: Positioned(
                  top: 257.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child:BlueAvatarIcon(onPressed: null,),
                ),
              ),

            Positioned(
              top: 700.0,
              left: 300.00,
              child: GoToButton(onPressed: (){

    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (BuildContext context) => ChoixDomaine()));

    print("non");
    }),
            ),
          ]
      ),
    );

  }
}
