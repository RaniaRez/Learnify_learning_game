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
import '../Services/Login.dart';
import 'Voila.dart';



class ChoixDomaine extends StatefulWidget {
  @override
  _ChoixDomaineState createState() => _ChoixDomaineState();
}

class _ChoixDomaineState extends State<ChoixDomaine> {






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
                  left:size.width*0.75,
                  child: SettingsButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },)
              ),

              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Voila()));
                  },)
              ),
              Positioned(
                  top: size.height*0.47,
                  right: size.width*0.61 ,
                  child:BranchIconSimple()
              ),
              if (user.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    top: size.height*0.31,
                    right: size.width*0.67,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:PinkAvatarIcon(onPressed:null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    top: size.height*0.29,
                    right: size.width*0.58 ,
                    height: size.height*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed:null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    top: size.height*0.32,
                    right: size.width*0.61 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
                  if (user.avatar=="Blue")
              Visibility(

                child: Positioned(
                  top: size.height*0.306,
                  right: size.width*0.61 ,
                  height: size.height*0.3,
                  width: size.width*0.3,
                  child:BlueAvatarIcon(onPressed: null,),
                ),
              ),
              Positioned(
                bottom: size.height*0.4,
                left: size.width*0.25 ,
                height: size.height*0.6,
                width: size.width*0.7,
                child:Bulle2Icon(),
              ),

              Positioned(
                bottom: size.height*0.18,
                left: size.width*0.15 ,
                height: size.height*0.1,
                width: size.width*0.7,
                  child: CentreButton(onPressed:(){
                    print('math');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => BienvenueMath()));

                  }),
              ),
              Positioned(
                top: size.height*0.6,
                height: size.height*0.1,
                width: size.width*0.55,
                child:  GaucheButton(onPressed:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => BienvenueFr()));

                  }),
                ),
              Positioned(
                top: size.height*0.84,
                left: size.width*0.45,
                height: size.height*0.1,
                width: size.width*0.55,
                child: DroiteButton(onPressed:(){
                    print('geo');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => BienvenueGeo()));
                  }),
                ),
            ]
        ),
      ),
    );

  }
}

