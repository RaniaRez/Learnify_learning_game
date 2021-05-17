
import 'package:flutter/material.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Branches/BranchIconSimple.dart';
import 'package:somthn/WelcomePages/ChooseAvatar.dart';
import 'package:somthn/WelcomePages/Ecriremdp.dart';
import 'package:somthn/WelcomePages/Entrernom.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonModifyAvatar.dart';
import 'package:somthn/Buttons/buttonModifyNom.dart';
import 'package:somthn/Buttons/buttonModifyPass.dart';
import 'package:somthn/Buttons/buttonSuppProfile.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'Home.dart';

class Userinfo extends StatefulWidget {


  @override
  _UserinfoState createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                Navigator.pop(
                  context,
                  );
              },)
          ),
          Positioned(
            bottom: size.height*0.765,
            left: size.width*0.24 ,
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
            top: size.height*0.3,
            right:size.width*0.62,
              child:BranchIconSimple(),
            ),
         // if (New.avatar=="Pink")
            Visibility(

              child: Positioned(
                top: size.height*0.145,
                right:size.width*0.62,
                height: size.height*0.3,
                width: size.width*0.3,
                child:PinkAvatarIcon(onPressed: null,),
              ),
            ),
          if (New.avatar=="Purple")
            Visibility(

              child: Positioned(
                top: 167.0,
                right: 310.0 ,

                child:PurpleAvatarIcon(onPressed: null,),
              ),
            ),
          if (New.avatar=="Orange")
            Visibility(

              child: Positioned(
                top: 160.0,
                right: 310.0 ,
                child: OrangeAvatarIcon(onPressed: null,),
              ),
            ),
          if (New.avatar=="Blue")
            Visibility(

              child: Positioned(
                top: 152.0,
                right: 290.0 ,

                child:BlueAvatarIcon(onPressed: null,),
              ),
            ),

          Positioned(
            bottom: 180.00,
            left : 10.00,
       child: Text(
    'Supprimer le compte',
           style: TextStyle(
             fontFamily: 'Skranji-Bold',
             fontSize: 24,

             color:Colors.brown[700],
           ),
          ),

          ),
Positioned(
            bottom: 140.00,
            right: 10.00,
            child:ButtonSupp(
              onPressed: (){

                print("SUPP");
                },
            ),
          ),
          Positioned(
            top: 340.00,

            left : 10.00,
            child: Text(
               'Changer avatar',
                      style: TextStyle(
                        fontFamily: 'Skranji-Bold',
                        fontSize: 24,

                        color:Colors.brown[700],
                      ),
                     ),


            ),
          Positioned(
            top: 320,
            right: 10.00,
            child: ButtonAvatar(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChooseAvatar()),);
                print("HELL YEAH");
              },
            ),
          ),
          Positioned(
            top: 420.00,
         left: 10,
         child: Text(
                      'Changer nom',
                      style: TextStyle(
                        fontFamily: 'Skranji-Bold',
                        fontSize: 24,

                        color:Colors.brown[700],
                      ),
                        ),

              ),

          Positioned(
            top: 400.00,
            left:200,
            child: Container(
              width: 300,
              height: 100,
              child: ButtonModifyNom(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Entrernom()),);

                  print("HELL YEAH");
                },
              ),
            ),
          ),
          Positioned(
            bottom: 270.00,
            left: 10,
            child:Text(

                     'Changer mot de passe',
                      style: TextStyle(
                        fontFamily: 'Skranji-Bold',
                        fontSize: 24,

                        color:Colors.brown[700],
                      ),
                        ),


              ),

          Positioned(
            bottom:230,
            left : 300.00,

            child: ButtonModifyPass(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ecriremdp()),);
                print("HELL YEAH");
              },
            ),
          ),

],
          ),

          );

  }
}


