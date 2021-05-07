import 'package:flutter/material.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Buttons/buttonNom.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'Home.dart';
import 'Settings.dart';




class Nom extends StatefulWidget {
  @override
  _NomState createState() => _NomState();
}

class _NomState extends State<Nom> {
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
                  print("HELL YEAH");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),);

                },
              ),
            ),
            Positioned(
                top: 10.00,
                left: 250.00,
                child:
                SettingsButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                  print("HELL YEAH");
                },)
            ),

            Positioned(
                top: 250.00,
                left : 50.00,
                right: 50.00,
                child: ButtonNom(onPressed: (){
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Users()));*/
                  print("HELL YEAH");
                } )
            ),

          ]
      ),
    );

  }
}
