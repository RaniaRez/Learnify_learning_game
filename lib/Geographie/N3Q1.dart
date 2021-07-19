import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Geographie/N3Q1T2_C_1.dart';
import 'package:somthn/Geographie/N3Q1T2_C_2.dart';
import 'package:somthn/Geographie/N3Q1T2_C_3.dart';
import 'package:somthn/Geographie/N3Q2.dart';
import 'package:somthn/Geographie/N3.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonContinuer.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../Services/Login.dart';
import 'package:vibration/vibration.dart';
import 'package:somthn/Geographie/BienvenueGeo.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'BienvenueGeo.dart';
import 'package:somthn/Geographie/boxDialogGeo3.dart';





class N3Q1 extends StatefulWidget {
  const N3Q1({Key key}) : super(key: key);

  @override
  _N3Q1State createState() => _N3Q1State();
}
class _N3Q1State extends State<N3Q1> {
  var player = AudioCache();
  var player2 = AudioPlayer ();
  AudioPlayer advancedPlayer;

  @override
  initState() {
    super.initState();
    loadMusic();
    scoreG.niv3=0 ;
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/doubleClic.wav");
  }
  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }



  bool oneClicked = false;
  bool twoClicked = false;
  bool threeClicked = false;
  bool fourClicked = false;
  bool Visible = true;
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
                  child: BacksButton(onPressed: ()async{
                    int result = await advancedPlayer?.pause();
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return customDialogGeo3();
                        }
                    );
                    player2?.stop();

                  },)
              ),

              Positioned(
                  top:size.height*0.05,
                  left:size.width*0.75,
                  child: SettingsButton(onPressed: () async {
                    player2?.stop();
                    if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
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
                  child: SvgPicture.asset(EmptyBar)),
              Positioned(
                bottom: size.height*0.57,
                left: size.width*0.05,
                height: size.height*0.3,
                width: size.width*0.6,
                child:SvgPicture.asset('assets/icons/N3Q1bulle.svg'),
              ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset('assets/icons/OneBar.svg'),
                ),
              ),

              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.468,
                  left: size.width*0.7,
                  child: IconButton(
                    iconSize: 64,
                    icon: SvgPicture.asset('assets/icons/QuestionMark.svg'),
                    onPressed: () async {
                      player2?.stop();
                      if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                      print('QuestionMark');
                      player2 =  await player.play('audio/geomonnaie.wav');



                    },
                  ),
                ),
              ),


              if (user.avatar=="Pink")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.35,
                    left: size.width*0.66,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.34,
                    left: size.width*0.62,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.353,
                    left: size.width*0.645,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.348,
                    left: size.width*0.645,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.5,
                  left: size.width*0.0,
                  height: size.height*0.1,
                  width: size.width*0.5,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/Dirham.svg'),
                    onPressed: (){
                      print('Dirham');
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
                visible: Visible,
                child: Positioned(
                  top: size.height*0.6,
                  left: size.width*0.5,
                  height: size.height*0.1,
                  width: size.width*0.5,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/Euro.svg'),
                    onPressed: (){
                      print('Euro');
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
                  left: size.width*0,
                  height: size.height*0.1,
                  width: size.width*0.5,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/Dollar.svg'),
                    onPressed: (){
                      print('Dollar');
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
                  top: size.height*0.8,
                  left: size.width*0.5,
                  height: size.height*0.1,
                  width: size.width*0.5,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/Dinar.svg'),
                    onPressed: (){
                      print('Dinar');
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
                visible: !Visible,
                child: Positioned(
                    top: size.height*0.8,
                    left: 0.0,
                    height: size.height*0.2,
                    width: size.width*0.5,
                    child: ButtonContinuer(onPressed: () async {
                      player2?.stop();
                      if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                      player2 =  await player.play('audio/mathsBravo.wav');
                      scoreG.niv3+=2 ;
                      print(scoreG.niv3);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => N3Q2()));
                      print('Continuer');},)
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

              Positioned(
                  top: size.height*0.7,
                  left: size.width*0,
                  height: size.height*0.1,
                  width: size.width*0.5,
                  child: Visibility(
                      visible: (threeClicked && Visible),
                      child: IconButton(
                        onPressed: () async {
                          player2?.stop();
                          if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                          if (threeClicked){
                            //Vibration.vibrate();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => N3Q1T2_C_3()));
                              print('Wrong');


                            print('Correct');
                          }
                          print('2');
                        },
                        icon: SvgPicture.asset('assets/icons/Dollar.svg'),))
              ),

              Positioned(
                top: size.height*0.7,
                left: size.width*0.5,
                height: size.height*0.3,
                width: size.width*0.5,
                child: Visibility(
                    visible: (fourClicked&&Visible),
                    child: IconButton(
                        onPressed: () async {
                          player2?.stop();
                          if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                          if (fourClicked){
                            player2 =  await player.play('audio/mathsBravo.wav');

                            setState(() {
                              Visible = false;
                            });

                            print('Correct');

                          }
                          print('2');
                        },
                        icon: SvgPicture.asset('assets/icons/Dinar.svg'))
                ),
              ),
              Positioned(
                top: size.height*0.6,
                left: size.width*0.5,
                height: size.height*0.1,
                width: size.width*0.5,

                child: Visibility(
                    visible: (twoClicked&&Visible),
                    child: IconButton(
                        onPressed: () async {
                          player2?.stop();
                          if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                          if (twoClicked){
                            //Vibration.vibrate();

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => N3Q1T2_C_2()));
                              print('Wrong');

                            //print('Correct');
                          }
                          print('2');
                        },
                        icon: SvgPicture.asset('assets/icons/Euro.svg'))
                ),
              ),
              Positioned(
                top: size.height*0.5,
                left: size.width*0.0,
                height: size.height*0.1,
                width: size.width*0.5,
                child: Visibility(
                    visible: (oneClicked&&Visible),
                    child: IconButton(
                        onPressed: () async {
                          player2?.stop();
                          if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                          if (oneClicked)  {
                            //Vibration.vibrate();
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => N3Q1T2_C_1()));
                            print('Wrong');
                          }
                          print('3');
                        },
                        icon: SvgPicture.asset('assets/icons/Dirham.svg'))
                ),
              ),
              Positioned(
                top: size.height*0.6,
                left: size.width*0.2,
                height: size.height*0.1,
                width: size.width*0.6,
                child: Visibility(
                    visible: !Visible,
                    child: IconButton(
                        onPressed: (){
                          print('3aychin ghaya kho');
                        },
                        icon: SvgPicture.asset('assets/icons/Dinar.svg'))
                ),
              ),
              Visibility(
                visible: !Visible,
                child:Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(Right)
                ),
              ),

            ],
          ),
        ));
  }
}