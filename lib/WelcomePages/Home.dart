
import 'package:flutter/material.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/ButtonAllons-y.dart';
import '../Bulles/BulleIcon.dart';
import 'Users.dart';
import 'Settings.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height : 1520 ,
      width : 720,
      child: Scaffold(
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
                  top: 60.00,
                  left: 300.00,
                  child:
                  SettingsButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("settings");
                  },)
              ),


              Positioned(
                  bottom: 50.00,
                  left : 50.00,
                  right: 50.00,
                  child: ButtonAllonsy(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Users()));
                    print("allons-y");
                  } )),

              Positioned(
                top: 80,
                right: 50.0,
                child: Container(
                  height: 380.0,
                  width: 380.0,
                  child: Image.asset('images/OWL.gif'),
                ),
              ),
              Positioned(
                top: 285.0,
                left: 115.0 ,
                height: 300.0,
                width: 300.0,
                child:BulleIcon(onPressed: (){}),
              ),
            ]
        ),
      ),
    );

  }
}
