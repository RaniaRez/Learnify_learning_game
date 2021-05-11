import 'package:flutter/material.dart';
import 'package:somthn/Branches/Brin.dart';
import 'package:somthn/Branches/Brin2.dart';
import 'package:somthn/Buttons/Cercle2Icon.dart';
import 'package:somthn/Buttons/CercleIcon.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import '../Owls/PurpleOwlIcon.dart';
import 'ClassUser.dart';
import '../Buttons/buttonGoTo.dart';
import 'Home.dart';
import '../Owls/PinkOwlIcon.dart';
import '../Owls/BlueOwlIcon.dart';
import '../Owls/OrangeOwlIcon.dart';
import 'Entrernom.dart';

User New = new User();
class ChooseAvatar extends StatefulWidget {
  @override
  _ChooseAvatarState createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> {
  @override
  bool _GoToVisible = false;
  bool _PurpleVisible = false;
  bool _PinkVisible = false;
  bool _OrangeVisible = false;
  bool _BlueVisible = false;
  void showPurple() {
    setState(() {
      _PurpleVisible = !_PurpleVisible;
      _PinkVisible = false;
      _OrangeVisible = false;
      _BlueVisible = false;
      if( _PurpleVisible){
        _GoToVisible = true;
      }else{
        _GoToVisible = false;
      }

    });
  }
  void showPink() {
    setState(() {
      _PinkVisible = !_PinkVisible;
       _PurpleVisible = false;
       _OrangeVisible = false;
       _BlueVisible = false;
      if( _PinkVisible){
        _GoToVisible = true;
      }else{
        _GoToVisible = false;
      }


    });
  }
  void showOrange() {
    setState(() {
      _OrangeVisible = !_OrangeVisible;
      _PurpleVisible = false;
      _PinkVisible = false;
      _BlueVisible = false;
      if( _OrangeVisible){
        _GoToVisible = true;
      }else{
        _GoToVisible = false;
      }
    });
  }
  void showBlue() {
    setState(() {
      _BlueVisible = !_BlueVisible;
      _PurpleVisible = false;
      _PinkVisible = false;
      _OrangeVisible = false;
      if( _BlueVisible){
        _GoToVisible = true;
      }else{
        _GoToVisible = false;
      }
    });
  }

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
            top: 200.0,
            right: 80.0,
              child: SizedBox(
                height: 150.0,
                width: 250.0,
                  child: Text(
                  'Choisis ton avatar :',
                      style: TextStyle(
                        fontFamily: 'Skranji-Bold',
                        fontSize: 30.0,
                        color: Colors.brown[700],

                      ),
                      textAlign: TextAlign.center,
            ),

              ),
          ),
            Positioned(
              top: 700.0,
              left: 300.00,
            child: Visibility(
              child: GoToButton(onPressed: (){
                setState(() {
                if(_PurpleVisible) New.SetAvatar("Purple");
                if(_PinkVisible) New.SetAvatar("Pink");
                if (_OrangeVisible) New.SetAvatar("Orange");
                if (_BlueVisible) New.SetAvatar("Blue");
                });
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Entrernom()));
    print("HELL YEAH");
    },
              ),
              visible: _GoToVisible,
            ),

          ),
          Positioned(
            bottom: 110.0,
            right: 195.0,
            child: Visibility(
              child: CercleIcon(),
              visible: _OrangeVisible,
            ),//Orange
          ),
          Positioned(
            top: 450.0,
            right: 195.0,
            child: Visibility(
              child: CercleIcon(),
              visible: _PurpleVisible,
            ),//Purple
          ),
          Positioned(
            top: 300.0,
            right: 55.0,
            child: Visibility(
              child: Cercle2Icon(),
              visible: _PinkVisible,
            ),//Pink
          ),
          Positioned(
            bottom: 180.0,
            right: 45.0,
            child: Visibility(
              child: Cercle2Icon(),
              visible: _BlueVisible,
            ),//Blue
          ),
          Positioned(
            top: 365.0,
              right: -5.0,
              child: BrinIcon(),
          ),
          Positioned(
            top: 270.0,
            right: 25.0,
            child: PinkOwl(onPressed: (){
              print("fuck");
              showPink();
              print("fuck");
            } ,),
          ),
          Positioned(
            bottom: 195.0,
            left: 250.0,
            child: BrinIcon(),
          ),
          Positioned(
            bottom: 163.0,
            left: 174.0,
            child: BlueOwl(onPressed: (){
              showBlue();
           },
            ),
          ),
          Positioned(
              bottom: 300.0,
              child: Brin2Icon()
          ),
          Positioned(
            top: 411.0,
          right: 160.0,
          child: PurpleOwl(onPressed: (){
            showPurple();
          } ,),
          ),

          Positioned(
              bottom: 113.0,
              child: Brin2Icon()
          ),

          Positioned(
            bottom: 70.0,
            right:160.0,
            child: OrangeOwl(onPressed: (){
              showOrange();
            } ,),
          ),

          ],
      ),
    );
  }
}
