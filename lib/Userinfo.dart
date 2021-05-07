import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:somthn/BlueAvatarIcon.dart';
import 'package:somthn/BranchIconSimple.dart';
import 'package:somthn/ChooseAvatar.dart';
import 'package:somthn/Ecriremdp.dart';
import 'package:somthn/Entrernom.dart';
import 'package:somthn/HomeButton.dart';
import 'package:somthn/OrangeAvatarIcon.dart';
import 'package:somthn/PinkAvatarIcon.dart';
import 'package:somthn/PurpleAvatarIcon.dart';
import 'package:somthn/Settings.dart';
import 'package:somthn/buttonModifyAvatar.dart';
import 'package:somthn/buttonModifyNom.dart';
import 'package:somthn/buttonModifyPass.dart';
import 'package:somthn/buttonSuppProfile.dart';
import 'package:somthn/myicons.dart';
import 'settingsButton.dart';
import 'BacksButton.dart';
import 'Home.dart';

class Userinfo extends StatefulWidget {


  @override
  _UserinfoState createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
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
              top: 5.00,
              right: 250.00,
              child: BacksButton(onPressed: (){
                print("HELL YEAH");
                Navigator.pop(
                  context,
                  );
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
              top: 120.0,
              right: 250.0 ,
              height: 300.0,
              width: 200.0,
              child:BranchIconSimple(),
            ),
          Positioned(

              top: 150,
              right: 60,
             child : SvgPicture.asset(bulleModify),
          ),
          if (New.avatar=="Pink")
            Visibility(

              child: Positioned(
                top: 154.0,
                right: 290.0 ,
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
            left : 0.00,
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

            left : 0.00,
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


