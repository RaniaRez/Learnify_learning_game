import 'package:flutter/material.dart';
import 'package:somthn/Bulles/BullenomIcon.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Mutual/Stars.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import '../WelcomePages/Home.dart';
import '../WelcomePages/ChooseAvatar.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';


class Niveau1Pass extends StatefulWidget {
  @override
  _Niveau1PassState createState() => _Niveau1PassState();
}

class _Niveau1PassState extends State<Niveau1Pass> {
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
              child: SettingsButton(onPressed: (){
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
                print("HELL YEAH");
                Navigator.pop(context);
              },)
          ),
          Positioned(
            top: -3.5,
            left: 95.0,
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
            top: 600.0,
            right: 180.0 ,

            child:StarIcon(),
          ),
          if (New.avatar=="Pink")
            Visibility(

              child: Positioned(
                top: 442.0,
                right: 211.0 ,
                height: 300.0,
                width: 200.0,
                child:PinkAvatarIcon(onPressed: null,),
              ),
            ),
          if (New.avatar=="Purple")
            Visibility(

              child: Positioned(
                top: 442.0,
                right: 211.0 ,
                height: 300.0,
                width: 200.0,
                child:PurpleAvatarIcon(onPressed: null,),
              ),
            ),
          if (New.avatar=="Orange")
            Visibility(

              child: Positioned(
                top: 442.0,
                right: 211.0 ,
                height: 300.0,
                width: 200.0,

                child: OrangeAvatarIcon(onPressed: null,),
              ),
            ),
         // if (New.avatar=="Blue")

          Positioned(
                top: 442.0,
                right: 211.0 ,
                height: 300.0,
                width: 200.0,
                child: Transform.rotate
                  (
                   angle:6,
                    child: BlueAvatarIcon(onPressed: null,)),
              ),


          Positioned(
            top: 170.0,
            left: 100.0 ,
            height: 300.0,
            width: 300.0,
            child:BullenomIcon(),
          ),
          Positioned(
            top : 290,
            left: 145.5,
            right: 70.5,
            bottom: 10.0,
            child: SizedBox(
              height: 10,
              width: 10,
              child: Text(
                'Niveau passé',
                style: TextStyle(
                  fontFamily: 'Skranji-bold',
                  fontSize: 30,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,

                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),


        ],
      ),
    );
  }
}
