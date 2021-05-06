import 'package:flutter/material.dart';
import 'package:somthn/BienvenueFr.dart';
import 'package:somthn/BienvenueGeo.dart';
import 'package:somthn/BienvenueMath.dart';
import 'package:somthn/BlueAvatarIcon.dart';
import 'package:somthn/OrangeAvatarIcon.dart';
import 'package:somthn/PinkAvatarIcon.dart';
import 'package:somthn/PurpleAvatarIcon.dart';
import 'package:somthn/Settings.dart';
import 'settingsButton.dart';
import 'BacksButton.dart';
import 'BranchIconSimple.dart';
import 'Bulle2icon.dart';
import 'GaucheButton.dart';
import 'DroiteButton.dart';
import 'CentreButton.dart';
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
              bottom: 140.0,
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
              top: 470.0,
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
              bottom: 30.0,
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

