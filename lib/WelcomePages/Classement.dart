import 'package:flutter/material.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import '../Bulles/CercleClassementGoldIcon.dart';
import '../Bulles/CercleClassementMarronIcon.dart';
import '../Bulles/CercleClassementGrisIcon.dart';
import '../Avatars/BlueAvatarIcon.dart';
import '../Avatars/PinkAvatarIcon.dart';
import '../Avatars/PurpleAvatarIcon.dart';
import '../Avatars/OrangeAvatarIcon.dart';


import 'Home.dart';
import 'Settings.dart';

class Classement extends StatefulWidget {
  @override
  _ClassementState createState() => _ClassementState();
}

class _ClassementState extends State<Classement> {
  @override
  // First user
  String _avatar1 = "pink";
  String _name1 = "Younes";
  // Second user
  String _avatar2 = "purple";
  String _name2 = "Meriem";
  // Third user
  String _avatar3 = "blue";
  String _name3 = "Rania";

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
                      print("HELL YEAH");
                    },)
                ),
                Positioned(
                    top: size.height*0.05,
                    right:size.width*0.75,
                    child: BacksButton(onPressed: (){
                      print("HELL YEAH");
                      Navigator.pop(context);
                    },)
                ),
                Positioned(
                    top: size.height*0.047,
                    left:size.width*0.4,
                    child: HomeButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },)
                ),

                Positioned(
                  top: size.height*0.55,
                  left:size.width*0.55,
                  child: CercleMarronIcon(),
                ),
                Positioned(
                  top: size.height*0.55,
                  right:size.width*0.55,
                  child: CercleGrisIcon(),
                ),
                Positioned(
                  top: size.height*0.3,
                  width:size.width,
                  child: CercleGoldIcon(),
                ),
                // User 1
                if(_avatar1 == "pink")
                  Positioned(
                    top: size.height*0.27,
                    right: size.width*0.405,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: PinkAvatarIcon(onPressed: null,),
                  ),
                if(_avatar1 == "blue")
                  Positioned(
                    top: size.height*0.27,
                    right: size.width*0.405,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: BlueAvatarIcon(onPressed: null,),
                    ),
                if(_avatar1 == "orange")
                  Positioned(
                    top: size.height*0.27,
                    right: size.width*0.405,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                if(_avatar1 == "purple")
                  Positioned(
                    top: size.height*0.25,
                    right: size.width*0.39,
                    height: size.height*0.24,
                    width: size.width*0.24,
                    child: PurpleAvatarIcon(onPressed: null,),
                  ),
                // User 2
                if(_avatar2 == "pink")
                  Positioned(
                    top: size.height*0.52,
                    right: size.width*0.665,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: PinkAvatarIcon(onPressed: null,),
                  ),
                if(_avatar2 == "blue")
                  Positioned(
                    top: size.height*0.52,
                    right: size.width*0.665,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: BlueAvatarIcon(onPressed: null,),
                  ),
                if(_avatar2 == "orange")
                  Positioned(
                    top: size.height*0.52,
                    right: size.width*0.665,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                if(_avatar2 == "purple")
                  Positioned(
                    top: size.height*0.5,
                    right: size.width*0.645,
                    height: size.height*0.24,
                    width: size.width*0.24,
                    child: PurpleAvatarIcon(onPressed: null,),
                  ),
                // User 3
                if(_avatar3 == "pink")
                  Positioned(
                    top: size.height*0.52,
                    left: size.width*0.65,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: PinkAvatarIcon(onPressed: null,),
                  ),
                if(_avatar3 == "blue")
                  Positioned(
                    top: size.height*0.52,
                    left: size.width*0.65,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: BlueAvatarIcon(onPressed: null,),
                  ),
                if(_avatar3 == "orange")
                  Positioned(
                    top: size.height*0.52,
                    left: size.width*0.65,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                if(_avatar3 == "purple")
                  Positioned(
                    top: size.height*0.5,
                    left: size.width*0.63,
                    height: size.height*0.24,
                    width: size.width*0.24,
                    child: PurpleAvatarIcon(onPressed: null,),
                  ),
                //User names:
                Positioned(
                  top: size.height*0.697,
                  left: size.width*0.13 ,
                  child: InkWell(
                    onTap:(){
                      print("Salamalekoum, nes lbahjaaaaaaaaa salamalekoum");
                    },

                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        _name1,
                        style:TextStyle(
                          fontSize: 20,
                          fontFamily: 'Skranji-Bold',
                          fontWeight: FontWeight.bold,
                          color:Colors.brown[700],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height*0.697,
                  right: size.width*0.13 ,
                  child: InkWell(
                    onTap:(){
                      print("Salamalekoum, nes lbahjaaaaaaaaa salamalekoum");
                    },

                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        _name2,
                        style:TextStyle(
                          fontSize: 20,
                          fontFamily: 'Skranji-Bold',
                          fontWeight: FontWeight.bold,
                          color:Colors.brown[700],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height*0.445,
                  right: size.width*0.39 ,
                  child: InkWell(
                    onTap:(){
                      print("Salamalekoum, nes lbahjaaaaaaaaa salamalekoum");
                    },

                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        _name3,
                        style:TextStyle(
                          fontSize: 20,
                          fontFamily: 'Skranji-Bold',
                          fontWeight: FontWeight.bold,
                          color:Colors.brown[700],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),

                ),



           ],
          ),
        ),
    );
  }
}