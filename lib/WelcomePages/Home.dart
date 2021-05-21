
import 'package:flutter/material.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/ButtonAllons-y.dart';
import '../Bulles/BulleIcon.dart';
import 'Users.dart';
import 'Settings.dart';
//for backend
import '../Services/Login.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  child:
                  SettingsButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("settings");
                  },)
              ),


              Positioned(
                  top: size.height*0.55,
                  right : size.height*0.1,
                  height: size.height*0.6,
                  width: size.width*0.6,
                  child: ButtonAllonsy(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Users()));
                    print("allons-y");
                  } )),

              Positioned(
                top: size.height*0.001,
                right: size.width*0.2,
                child: Container(
                  height: size.height*0.6,
                  width: size.width*0.8,
                  child: Image.asset('images/OWL.gif'),
                ),
              ),
              Positioned(
                top: size.height*0.2,
                left: size.width*0.3 ,
                height: size.height*0.6,
                width: size.width*0.7,
                child:BulleIcon(onPressed: (){}),
              ),
            ]
        ),
      ),
    );

  }
}
