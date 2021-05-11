import 'package:flutter/material.dart';
import 'package:somthn/Francais/BienvenueFr.dart';
import 'package:somthn/Geographie/BienvenueGeo.dart';
import 'package:somthn/Maths/BienvenueMath.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import '../Branches/BranchIconSimple.dart';
import '../Bulles/Bulle2icon.dart';
import '../Buttons/GaucheButton.dart';
import '../Buttons/DroiteButton.dart';
import '../Buttons/CentreButton.dart';
import 'ChooseAvatar.dart';



class ChoixDomaine extends StatefulWidget {
  @override
  _ChoixDomaineState createState() => _ChoixDomaineState();
}

class _ChoixDomaineState extends State<ChoixDomaine> {
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
                top: 50.00,
                left: 300.00,
                child:
                SettingsButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                  print("HELL YEAH");
                },)
            ),
            Positioned(
                top: 10.00,
                right: 250.00,
                child: BacksButton(onPressed: (){
                  Navigator.pop(context);
                },)
            ),
            Positioned(
                top: 400,
                right: 260.0,
                child:BranchIconSimple()
            ),
            if (New.avatar=="Pink")
              Visibility(

                child: Positioned(
                  top: 335.50,
                  right: 270.00,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Purple")
              Visibility(

                child: Positioned(
                  top: 330.50,
                  right: 270.00,
                  height: 130,
                  width: 130,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Orange")
              Visibility(

                child: Positioned(
                  top: 335.50,
                  right: 270.00,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Blue")
              Visibility(

                child: Positioned(
                  top: 335.50,
                  right: 270.00,
                  child:BlueAvatarIcon(onPressed: null,),
                ),
              ),
            Positioned(
              top: 130.0,
              left: 65.0 ,
              height: 300.0,
              width: 300.0,
              child:Bulle2Icon(),
            ),

            Positioned(
              bottom: 170.0,
              left: 62.0,
              child: Container(
                width: 300,
                height: 100,
                child: CentreButton(onPressed:(){
                  print('math');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => BienvenueMath()));

                }),
              ),
            ),
            Positioned(
              top: 520.0,
              child: Container(
                width: 250,
                height: 100,
                child: GaucheButton(onPressed:(){
                  print('fr');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => BienvenueFr()));

                }),
              ),
            ),
            Positioned(
              bottom: 60.0,
              left: 160.0,
              child: Container(
                width: 250,
                height: 100,
                child: DroiteButton(onPressed:(){
                  print('geo');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => BienvenueGeo()));

                }),
              ),
            ),
          ]
      ),
    );

  }
}

