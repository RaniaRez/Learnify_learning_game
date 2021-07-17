import 'package:flutter/material.dart';
import 'package:somthn/Branches/Brin.dart';
import 'package:somthn/Branches/Brin2.dart';
import 'package:somthn/Buttons/Cercle2Icon.dart';
import 'package:somthn/Buttons/CercleIcon.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/WelcomePages/Voila.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import '../Owls/PurpleOwlIcon.dart';
import '../Buttons/buttonGoTo.dart';
import 'Home.dart';
import '../Owls/PinkOwlIcon.dart';
import '../Owls/BlueOwlIcon.dart';
import '../Owls/OrangeOwlIcon.dart';
import 'Entrernom.dart';
import '../Services/Login.dart';



//User New = new User();
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
                  Navigator.pop(
                    context,
                  );
                },)
            ),
            Positioned(
              top: size.height*0.047,
              left: size.width*0.39,
              child: HomeButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Voila()),);

                },
              ),
            ),
            Positioned(
              top: size.height*0.3,
              left: size.width*0.2,
              child: Text(
                  'Choisis ton avatar :',
                  style: TextStyle(
                    fontFamily: 'Skranji-Bold',
                    fontSize: 27.0,
                    color: Colors.brown[700],

                  ),
                  textAlign: TextAlign.center,
                ),

              ),
            Positioned(
              top: size.height*0.8,
              left:size.width*0.75,
              child: Visibility(
                child: GoToButton(onPressed: (){
                  print(user.uid);
                  setState(() {
                    if(_PurpleVisible) user.SetAvatar("Purple");
                    print(user.avatar);
                    if(_PinkVisible) user.SetAvatar("Pink");
                    if (_OrangeVisible) user.SetAvatar("Orange");
                    if (_BlueVisible) user.SetAvatar("Blue");
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Entrernom()));
                },
                ),
                visible: _GoToVisible,
              ),

            ),
            Positioned(
              top: size.height*0.62,
              right: size.width*0.582 ,
              height: size.height*0.32,
              width: size.width*0.32,
              child: Visibility(
                child: CercleIcon(),
                visible: _OrangeVisible,
              ),//Orange
            ),
            Positioned(
              top: size.height*0.37,
              left: size.width*0.125 ,
              height: size.height*0.33,
              width: size.width*0.33,
              child: Visibility(
                child: CercleIcon(),
                visible: _PurpleVisible,
              ),//Purple
            ),
            Positioned(
              top: size.height*0.29,
              left: size.width*0.54 ,
              height: size.height*0.35,
              width: size.width*0.35,
              child: Visibility(
                child: Cercle2Icon(),
                visible: _PinkVisible,
              ),//Pink
            ),
            Positioned(
              height: size.height*0.35,
              width: size.width*0.35,
              bottom: size.height*0.16,
              right: size.width*0.08 ,
              child: Visibility(
                child: Cercle2Icon(),
                visible: _BlueVisible,
              ),//Blue
            ),
            Positioned(
              height: size.height*0.1,
              width: size.width*0.35,
              top:size.height*0.452,
            left:size.width*0.67,
              child: BrinIcon(),
            ),
            Positioned(
              top: size.height*0.31,
              left: size.width*0.58 ,
              height: size.height*0.3,
              width: size.width*0.3,
              child: PinkOwl(onPressed: (){
                showPink();
              } ,),
            ),
            Positioned(
              height: size.height*0.1,
              width: size.width*0.35,
              top:size.height*0.658,
              left:size.width*0.67,
              child: BrinIcon(),
            ),
            Positioned(
             bottom: size.height*0.185,
              right: size.width*0.1 ,
              height: size.height*0.3,
              width: size.width*0.3,
              child: BlueOwl(onPressed: (){
                showBlue();
              },
              ),
            ),
            Positioned(
                top:size.height*0.532,
                height: size.height*0.1,
                width: size.width*0.35,
                child: Brin2Icon()
            ),
            Positioned(
              bottom: size.height*0.265,
              right: size.width*0.52 ,
              height: size.height*0.39,
              width: size.width*0.39,
              child: PurpleOwl(onPressed: (){
                showPurple();
              } ,),
            ),

            Positioned(
                height: size.height*0.1,
                width: size.width*0.35,
                top:size.height*0.763,

                child: Brin2Icon()
            ),

            Positioned(
              top: size.height*0.63,
              right: size.width*0.59 ,
              height: size.height*0.3,
              width: size.width*0.3,
              child: OrangeOwl(onPressed: (){
                showOrange();
              } ,),
            ),

          ],
        ),
      ),
    );
  }
}