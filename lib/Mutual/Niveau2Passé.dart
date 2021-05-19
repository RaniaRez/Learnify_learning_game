import 'package:flutter/material.dart';
import 'package:somthn/Bulles/BullenomIcon.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Mutual/Stars.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import '../WelcomePages/Home.dart';
//import '../WelcomePages/ChooseAvatar.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import '../Services/Login.dart';
import '../Services/SignUp.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';


class Niveau2Pass extends StatefulWidget {
  @override
  _Niveau2PassState createState() => _Niveau2PassState();
}

class _Niveau2PassState extends State<Niveau2Pass> {
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
          if (user.avatar=="Pink")
            Visibility(

              child: Positioned(
                top: 442.0,
                right: 211.0 ,
                height: 300.0,
                width: 200.0,
                child:PinkAvatarIcon(onPressed: null,),
              ),
            ),
          if (user.avatar=="Purple")
            Visibility(

              child: Positioned(
                top: 442.0,
                right: 211.0 ,
                height: 300.0,
                width: 200.0,
                child:PurpleAvatarIcon(onPressed: null,),
              ),
            ),
          if (user.avatar=="Orange")
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
            top : 270,
            left: 145.5,
            right: 70.5,
            bottom: 10.0,
            child: SizedBox(
              height: 10,
              width: 10,
              child: Text(
                'Niveau 2 passé',
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
          Positioned(
            top: 750.0,
            left: 300.00,
            child: GoToButton(onPressed: (){

            }),
          ),

        ],
      ),
    );
  }
}
