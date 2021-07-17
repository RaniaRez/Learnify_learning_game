import 'package:flutter/material.dart';
import 'package:somthn/WelcomePages/Voila.dart';
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
import '../WelcomePages/Home.dart';
import '../WelcomePages/Settings.dart';
import '../Data/DataUser.dart';





class Classement extends StatefulWidget {
  List<DataUser> value = new List<DataUser>.empty(growable: true);
  Classement({this.value});

  @override
  _ClassementState createState() => _ClassementState(value : value );
}

class _ClassementState extends State<Classement> {
  List<DataUser> value = new List<DataUser>.empty(growable: true);
  _ClassementState({this.value});
  @override

  Widget build(BuildContext context)  {

    Size size = MediaQuery
        .of(context)
        .size;
    // First user
    value.sort((a, b) => b.score.compareTo(a.score));
    String _avatar1 = value[0].avatar;
    String _name1 = value[0].username;
    int _score1 =value[0].score;
    print(_name1);
    print(value[0].score);
    // Second user
    String _avatar2 = value[1].avatar;
    String _name2 = value[1].username;
    int _score2 =value[1].score;
    print(_name2);
    print(value[1].score);
    // Third user
    String _avatar3 = value[2].avatar;
    String _name3 = value[2].username;
    int _score3 =value[2].score;
    print(_name3);
    print(value[2].score);
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
                          MaterialPageRoute(builder: (context) => Voila()));
                    },)
                ),

                Positioned(
                  top: size.height*0.528,
                  left:size.width*0.55,
                  height: size.width*0.45,
                  width: size.width*0.45,
                  child: CercleMarronIcon(onPressed: null,),
                ),
                Positioned(
                  top: size.height*0.528,
                  right:size.width*0.55,
                  height: size.width*0.45,
                  width: size.width*0.45,
                  child: CercleGrisIcon(onPressed: null),
                ),
                Positioned(
                  top: size.height*0.3,
                  right: size.width*0.28,
                  height: size.width*0.45,
                  width: size.width*0.45,
                  child: CercleGoldIcon(onPressed: null),
                ),
                // User 1
                if(_avatar1 == "Pink")

                  Positioned(
                    top: size.height*0.28,
                    right: size.width*0.405,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: PinkAvatarIcon(onPressed: null,),
                  ),
                if(_avatar1 == "Blue")
                  Positioned(
                    top: size.height*0.28,
                    right: size.width*0.405,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: BlueAvatarIcon(onPressed: null,),
                    ),
                if(_avatar1 == "Orange")
                  Positioned(
                    top: size.height*0.28,
                    right: size.width*0.405,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                if(_avatar1 == "Purple")
                  Positioned(
                    top: size.height*0.26,
                    right: size.width*0.39,
                    height: size.height*0.24,
                    width: size.width*0.24,
                    child: PurpleAvatarIcon(onPressed: null,),
                  ),
                // User 2
                if(_avatar2 == "Pink")
                  Positioned(
                    top: size.height*0.51,
                    right: size.width*0.67,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: PinkAvatarIcon(onPressed: null,),
                  ),
                if(_avatar2 == "Blue")
                  Positioned(
                    top: size.height*0.51,
                    right: size.width*0.67,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: BlueAvatarIcon(onPressed: null,),
                  ),
                if(_avatar2 == "Orange")
                  Positioned(
                    top: size.height*0.51,
                    right: size.width*0.67,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                if(_avatar2 == "Purple")
                  Positioned(
                    top: size.height*0.49,
                    right: size.width*0.66,
                    height: size.height*0.24,
                    width: size.width*0.24,
                    child: PurpleAvatarIcon(onPressed: null,),
                  ),
                // User 3
                if(_avatar3 == "Pink")
                  Positioned(
                    top: size.height*0.51,
                    left: size.width*0.67,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: PinkAvatarIcon(onPressed: null,),
                  ),
                if(_avatar3 == "Blue")
                  Positioned(
                    top: size.height*0.51,
                    left: size.width*0.67,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: BlueAvatarIcon(onPressed: null,),
                  ),
                if(_avatar3 == "Orange")
                  Positioned(
                    top: size.height*0.51,
                    left: size.width*0.67,
                    height: size.height*0.2,
                    width: size.width*0.2,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                if(_avatar3 == "Purple")
                  Positioned(
                    top: size.height*0.49,
                    left: size.width*0.65,
                    height: size.height*0.24,
                    width: size.width*0.24,
                    child: PurpleAvatarIcon(onPressed: null,),
                  ),
                //User names:
                Positioned(
                  top: size.height*0.685,
                  left: size.width*0.1 ,
                  child: InkWell(
                    onTap:(){
                      //print("Salamalekoum, nes lbahjaaaaaaaaa salamalekoum");
                    },

                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        _name2+':'+_score2.toString(),
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
                  top: size.height*0.685,
                  right: size.width*0.1 ,
                  child: InkWell(
                    onTap:(){
                     // print("Salamalekoum, nes lbahjaaaaaaaaa salamalekoum");
                    },

                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        _name3+':'+_score3.toString(),
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
                  top: size.height*0.46,
                  right: size.width*0.44 ,
                  child: InkWell(
                    onTap:(){
                    //  print("Salamalekoum, nes lbahjaaaaaaaaa salamalekoum");
                    },

                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        _name1+':'+_score1.toString(),
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