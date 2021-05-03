import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Brin.dart';
import 'package:somthn/Brin2.dart';
import 'package:somthn/BullenomIcon.dart';
import 'package:somthn/Cercle2Icon.dart';
import 'package:somthn/CercleIcon.dart';
import 'package:somthn/HomeButton.dart';
import 'package:somthn/OwlBranch.dart';
import 'package:somthn/buttonNom.dart';
import 'myicons.dart';
import 'settingsButton.dart';
import 'BacksButton.dart';
import 'PlusButton.dart';
import 'buttonGoTo.dart';
import 'buttonStatistique.dart';
import 'buttonUserSettings.dart';
import 'Home.dart';
import 'Settings.dart';
import 'ChooseAvatar.dart';



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
