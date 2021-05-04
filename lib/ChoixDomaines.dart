import 'package:flutter/material.dart';
import 'package:somthn/BienvenueFr.dart';
import 'package:somthn/BienvenueGeo.dart';
import 'package:somthn/BienvenueMath.dart';
import 'package:somthn/PurpleOwlWelcome.dart';
import 'package:somthn/TestDeNiveau.dart';
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
            Positioned(
              top: 234.50,
              right: 190.00,
              child: PurpleOwlWelcome(onPressed: (){
                print("YAS");
              }),
            ),
            Positioned(
              top: 130.0,
              left: 65.0 ,
              height: 300.0,
              width: 300.0,
              child:Bulle2Icon(),
            ),
            Positioned(
              bottom: 210.0,
                child: GaucheButton(onPressed:(){
                  print('fr');
                  if(New.New) {
                    Navigator.push(

                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => TestNiveau()));}
                  else{
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => BienvenueFr()));
                  }
                }),
            ),
            Positioned(
              bottom: 90.0,
              left: 62.0,
              child: CentreButton(onPressed:(){
                print('math');
                if(New.New) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => TestNiveau()));}
                else{
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => BienvenueMath()));
                }
              }),
            ),
            Positioned(
              bottom: 30.0,
              left: 170.0,
              child: DroiteButton(onPressed:(){
                print('geo');
                if(New.New) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => TestNiveau()));}
                else{
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => BienvenueGeo()));
                }
              }),
            ),
          ]
      ),
    );

  }
}

