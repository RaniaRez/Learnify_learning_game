import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Brin.dart';
import 'package:somthn/Brin2.dart';
import 'package:somthn/BullenomIcon.dart';
import 'package:somthn/Buttonoui.dart';
import 'package:somthn/Cercle2Icon.dart';
import 'package:somthn/CercleIcon.dart';
import 'package:somthn/ChoixDomaines.dart';
import 'package:somthn/ChooseAvatar.dart';
import 'package:somthn/Ecriremdp.dart';
import 'package:somthn/HomeButton.dart';
import 'package:somthn/Nom.dart';
import 'package:somthn/OwlBranch.dart';
import 'package:somthn/Userinfo.dart';
import 'package:somthn/buttonNom.dart';
import 'package:somthn/buttonnon.dart';
import 'myicons.dart';
import 'settingsButton.dart';
import 'BacksButton.dart';
import 'ButtonAllons-y.dart';
import 'PurpleOwlIcon.dart';
import 'BranchIcon.dart';
import 'Bulle2icon.dart';
import 'ClassUser.dart';
import 'PlusButton.dart';
import 'buttonGoTo.dart';
import 'buttonStatistique.dart';
import 'buttonUserSettings.dart';
import 'Home.dart';
import 'PinkOwlIcon.dart';
import 'BlueOwlIcon.dart';
import 'OrangeOwlIcon.dart';
import 'Settings.dart';
import 'BranchIconSimple.dart';
import 'BullemdpIcon.dart';
import 'ChooseAvatar.dart';
import 'Users.dart';


class Creermdp extends StatefulWidget {
  @override
  _CreermdpState createState() => _CreermdpState();
}

class _CreermdpState extends State<Creermdp> {
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
              top: 270.0,
              right: 250.0 ,
              height: 300.0,
              width: 200.0,
              child:OwlBranch(),
            ),


            Positioned(
              top: 170.0,
              left: 100.0 ,
              height: 300.0,
              width: 300.0,
              child:BullemdpIcon(),
            ),

            Positioned(
                bottom: 210.00,
                left: 50.00,
                right: 50.00,
                child: Buttonoui (onPressed: () {
              Navigator.push(
                     context,
                MaterialPageRoute(
                builder: (BuildContext context) => Ecriremdp()));
              print('chooseavatar');
    },
            )
            ),

            Positioned(
                bottom: 130.00,
                left : 50.00,
                right: 50.00,
                child: Buttonnon(onPressed: (){

                  Utilisateurs.add(New);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Userinfo()));

                  print("non");
                } )
            ),
          ]
      ),
    );

  }
}
