import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Geographie/N1Q4T2_C_1.dart';
import 'package:somthn/Geographie/N1Q4T2_C_2.dart';
import 'package:somthn/Geographie/N1Q4T2_C_4.dart';
import 'package:somthn/Geographie/N2Q3.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/WelcomePages/Home.dart';
import 'package:vibration/vibration.dart';

import 'package:somthn/Buttons/buttonContinuer.dart';
import 'package:somthn/Buttons/buttonQ.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../Services/Login.dart';

import 'package:somthn/Bulles/BulleN1Q4T2.dart';

class N2Q4T2_C_3 extends StatefulWidget {
  const N2Q4T2_C_3({Key key}) : super(key: key);

  @override
  _N2Q4T2_C_3State createState() => _N2Q4T2_C_3State();
}

class _N2Q4T2_C_3State extends State<N2Q4T2_C_3> {
  bool Visible = true;
  bool correct = false;
  bool oneClicked = false;
  bool twoClicked = false;
  bool threeClicked = false;
  bool fourClicked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        child: Scaffold(
          body:
          Stack(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/geo_BG.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,

                  child: BacksButton(onPressed: (){
                    print("u clicked me");
                    Navigator.pop(context);
                  },)
              ),

              Positioned(
                  top:size.height*0.05,
                  left:size.width*0.75,
                  child: SettingsButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("settings");
                  },)
              ),
              Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(FourBars)),
              Positioned(
                bottom: size.height*0.55,
                left: size.width*0.05,
                height: size.height*0.3,
                width: size.width*0.8,
                child:SvgPicture.asset('assets/icons/BulleN2Q4T2.svg'),
              ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(FourBars),
                ),
              ),
              if (user.avatar=="Pink")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.38,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.38,
                    left: size.width*0.72,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.38,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.38,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),


              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.5,
                  left: size.width*0.5,
                  height: size.height*0.3,
                  width: size.width*0.5,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/Alpes.svg'),
                    onPressed: (){
                      setState(() {
                        oneClicked = false;
                        twoClicked = true;
                        threeClicked = false;
                        fourClicked = false;
                      });},
                  ),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.7,
                  left: size.width*0.5,
                  height: size.height*0.3,
                  width: size.width*0.5,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/OuledNail.svg'),
                    onPressed: (){
                      print('adrar');
                      setState(() {
                        oneClicked = false;
                        twoClicked = false;
                        threeClicked = false;
                        fourClicked = true;
                      });},
                  ),
                ),
              ),
              Visibility(
                visible: false,
                child: Positioned(
                  top: size.height*0.6,
                  left: size.width*0,
                  height: size.height*0.3,
                  width: size.width*0.5,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/Tahat.svg'),
                    onPressed: (){
                      print('alger');
                      setState(() {
                        oneClicked = false;
                        twoClicked = false;
                        threeClicked = true;
                        fourClicked = false;
                      });},
                  ),

                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.4,
                  left: size.width*0.0,
                  height: size.height*0.3,
                  width: size.width*0.5,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/LallaKhedidja.svg'),
                    onPressed: (){
                      print('annaba');
                      setState(() {
                        oneClicked = true;
                        twoClicked = false;
                        threeClicked = false;
                        fourClicked = false;
                      });},
                  ),
                ),
              ),

              Visibility(
                visible: !Visible,
                child: Positioned(
                    top: size.height*0.8,
                    left: 0.0,
                    height: size.height*0.2,
                    width: size.width*0.5,
                    child: ButtonContinuer(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => N2Q3()));
                      print('Continuer');},)
                ),
              ),
              //Second click
              Positioned(
                  top: size.height*0.6,
                  left: size.width*0,
                  height: size.height*0.3,
                  width: size.width*0.5,
                  child: Visibility(
                      visible: false,
                      child: IconButton(
                        onPressed: (){
                          Vibration.vibrate();

                          if (threeClicked){
                            setState(() {
                              correct = false;
                              Visible = false;

                              print('Correct');
                            });
                            print('Oran');
                          }
                          print('Alger');
                        },
                        icon: SvgPicture.asset('assets/icons/Tahat.svg'),))
              ),
              Positioned(
                top: size.height*0.7,
                left: size.width*0.5,
                height: size.height*0.3,
                width: size.width*0.5,
                child: Visibility(
                    visible: (fourClicked&&Visible),
                    child: IconButton(
                        onPressed: (){
                          if (fourClicked) {
                            Vibration.vibrate();

                            setState(() {
                              correct = false;
                              Visible = false;

                              print('Correct');
                            });


                          }
                          print('Alger');
                        },
                        icon: SvgPicture.asset('assets/icons/OuledNail.svg'))
                ),
              ),
              Positioned(
                top: size.height*0.5,
                left: size.width*0.5,
                height: size.height*0.3,
                width: size.width*0.5,

                child: Visibility(
                    visible: (twoClicked&&Visible),
                    child: IconButton(
                        onPressed: (){

                          if (twoClicked) {
                            Vibration.vibrate();

                            setState(() {
                              correct = true;
                              Visible = false;

                              print('Correct');
                            });
                            print('Oran');
                          }
                        },
                        icon: SvgPicture.asset('assets/icons/Alpes.svg'))
                ),
              ),
              Positioned(
                top: size.height*0.4,
                left: size.width*0.0,
                height: size.height*0.3,
                width: size.width*0.5,
                child: Visibility(
                    visible: (oneClicked&&Visible),
                    child: IconButton(
                        onPressed: (){
                          if (oneClicked) {

                            setState(() {
                              correct = false;
                              Visible = false;

                              print('Correct');
                            });}
                        },
                        icon: SvgPicture.asset('assets/icons/LallaKhedidja.svg'))
                ),
              ),
              if (correct)
                Stack(
                  children: <Widget>[
                    Positioned(
                      top: size.height*0.45,
                      left: size.width*0.2,
                      height: size.height*0.3,
                      width: size.width*0.6,
                      child: Visibility(
                          visible: !Visible,
                          child: IconButton(
                              onPressed: (){
                                print('3aychin ghaya kho');
                              },
                              icon: SvgPicture.asset('assets/icons/Alpes.svg'))
                      ),
                    ),
                    Visibility(
                      visible: !Visible,
                      child:Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(Right)
                      ),
                    ),
                    if (user.avatar=="Pink")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child:Image.asset('images/HappyPink.gif'),
                        ),
                      ),
                    if (user.avatar=="Purple")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.35,
                          width: size.width*0.35,
                          left: size.width*0.1,
                          top:size.height*0.7,
                          child:Image.asset('images/HappyPurple.gif'),
                        ),
                      ),
                    if (user.avatar=="Orange")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child: Image.asset('images/HappyOrange.gif'),
                        ),
                      ),
                    if (user.avatar=="Blue")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child:Image.asset('images/HappyBlue.gif'),
                        ),
                      ),
                    Visibility(
                      visible: !Visible,
                      child: Positioned(
                          height: size.width*0.45,
                          width: size.width*0.45,
                          left: size.width*0.4,
                          top:size.height*0.7,
                          child: SvgPicture.asset(bulleBravo)
                      ),
                    ),
                  ],
                ),
              if (!correct)
                Stack(
                  children:[
                    Visibility(
                      visible: !Visible,
                      child: Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(Wrong)
                      ),
                    ),
                    if (user.avatar=="Pink")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child: Image.asset('images/MadPink.gif'),
                        ),
                      ),
                    if (user.avatar=="Purple")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.35,
                          width: size.width*0.35,
                          left: size.width*0.1,
                          top:size.height*0.7,
                          child:Image.asset('images/MadPurple.gif'),
                        ),
                      ),
                    if (user.avatar=="Orange")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child: Image.asset('images/MadOrange.gif'),
                        ),
                      ),
                    if (user.avatar=="Blue")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child:Image.asset('images/MadBlue.gif'),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ));
  }
}