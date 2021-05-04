import 'package:flutter/material.dart';
import 'package:somthn/PurpleOwlWelcome.dart';
import 'settingsButton.dart';
import 'BacksButton.dart';
import 'BranchIconSimple.dart';
import 'Bulle2icon.dart';
import 'GaucheButton.dart';
import 'DroiteButton.dart';
import 'CentreButton.dart';



class BienvenueTest extends StatefulWidget {
  @override
  _BienvenueTestState createState() => _BienvenueTestState();
}

class _BienvenueTestState extends State<BienvenueTest> {
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
              child: GaucheButton(onPressed: null,),
            ),

          ]
      ),
    );

  }
}

