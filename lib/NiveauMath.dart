import 'package:flutter/material.dart';
import 'package:somthn/BrownOwl.dart';
import 'package:somthn/LockIcon.dart';
import 'package:somthn/PinkAvatarIcon.dart';
import 'package:somthn/buttonDifficile.dart';
import 'package:somthn/buttonMoyen.dart';
import 'package:somthn/buttonfacile.dart';
import 'package:somthn/madGreenOwl.dart';



class NiveauMath extends StatefulWidget {
  @override
  _NiveauMathState createState() => _NiveauMathState();
}

class _NiveauMathState extends State<NiveauMath> {
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
              bottom: 156.0,
              right: 152.0,
              child: Container(
                width: 300,
                height: 100,
                child:Buttonfacile (onPressed:(){
                  print('facile');}),
              ),
            ),
            Positioned(
              bottom: 225.0,
              right: 290.0,
              child: PinkAvatarIcon(onPressed:null),
            ),
            Positioned(
              top:586.0,
              left:230.0,
              child: Container(

                  child: LockIcon()),
            ),
            Positioned(
              top: 370.0,
              left:165.0,
              child: Container(
                width: 300,
                height: 100,
                child: ButtonMoyen(onPressed:(){
                  print('Moyen');
                }),
              ),
            ),
            Positioned(
              top: 395.0,
              left:180.0,
              child: Container(

                  child: LockIcon()),
            ),
            Positioned(
              top: 290.0,
              left: 290.0,
              child: GreenOwl(onPressed:null),
            ),

            Positioned(
              top: 167.0,
              right: 158.0,
              child: Container(
                width: 300,
                height: 100,
                child: ButtonDifficile(onPressed:(){
                  print('hard');
                }),
              ),
            ),
            Positioned(
              top: 90.0,
              right: 290.0,
              child:BrownOwl(onPressed:null),
            ),
            Positioned(
              top:187.0,
              left:220.0,
              child: Container(

                  child: LockIcon()),
            ),
          ]
      ),
    );

  }
}

