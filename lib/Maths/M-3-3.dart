import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Maths/BienvenueMath.dart';
import 'package:somthn/Maths/M-3-4.dart';
import 'package:somthn/Maths/boxDialogMath3.dart';
import 'package:somthn/WelcomePages/Settings.dart';
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
import 'BienvenueMath.dart';
import 'M-3.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


class M_3_3 extends StatefulWidget {
  const M_3_3({Key key}) : super(key: key);

  @override
  _M_3_3State createState() => _M_3_3State();
}

class _M_3_3State extends State<M_3_3> {
  var player = AudioCache();
  var player2 = AudioPlayer ();
  AudioPlayer advancedPlayer;

  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/doubleClic.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }

  bool Visible = true;
  bool correct = false;
  bool oneClicked = false;
  bool twoClicked = false;
  bool threeClicked = false;
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
                        image: AssetImage("images/mathsBG.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: size.height*0.05,
                  left:size.width*0.75,
                  child:
                  SettingsButton(onPressed: () async {
                    player2?.stop();
                    if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("HELL YEAH");
                  },)
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: () async {
                    player2?.stop();
                    if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return customDialogMath3();
                        }
                    );
                  },)
              ),
              Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(TwoBars)),

              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(ThreeBars),
                ),
              ),
              Positioned(
                top: size.height*0.45,
                left: size.width*0.15,
                right: size.width*0.15,
                child: Visibility(
                    child: Visibility(
                        visible: Visible,
                        child: SvgPicture.asset('assets/icons/M-3-T-3.svg'))
                ),
              ),
              if (user.avatar=="Pink")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.32,
                    left: size.width*0.6,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.31,
                    left: size.width*0.57,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.32,
                    left: size.width*0.6,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.32,
                    left: size.width*0.6,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),
              Positioned(
                top: size.height*0.15,
                left: size.width*0.1,
                height: size.width*0.4,
                width: size.width*0.8,
                child: SvgPicture.asset('assets/icons/M-3-Q-3.svg'),
              ),

              Visibility(
                visible: Visible,
                child: Positioned(

                    top: size.height*0.84,

                    height: size.width*0.2,
                    width: size.width*0.33,
                    child: QButton(onPressed: null,)
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.85,
                  left: size.width*0.08,
                  child: IconButton(
                    iconSize: 50,
                    onPressed: (){
                      print('frdv');
                      setState(() {
                        oneClicked = true;
                        twoClicked = false;
                        threeClicked = false;
                      });},
                    icon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '4',
                        style:TextStyle(
                          fontSize: 30,
                          fontFamily: 'Skranji-Bold',
                          fontWeight: FontWeight.bold,
                          color:Colors.brown[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                    top: size.height*0.75,
                    right: size.width*0.0,
                    height: size.width*0.2,
                    width: size.width*0.33,
                    child: QButton(onPressed: null,)
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.76,
                  right: size.width*0.08,
                  child: IconButton(
                    iconSize: 50,
                    onPressed: (){
                      print('frdv');
                      setState(() {
                        oneClicked = false;
                        twoClicked = true;
                        threeClicked = false;
                      });},
                    icon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '8',
                        style:TextStyle(
                          fontSize: 30,
                          fontFamily: 'Skranji-Bold',
                          fontWeight: FontWeight.bold,
                          color:Colors.brown[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                    top: size.height*0.8,
                    right: size.width*0.33,
                    height: size.width*0.2,
                    width: size.width*0.33,
                    child: QButton(onPressed: null,)
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.81,
                  right: size.width*0.41,
                  child: IconButton(
                    iconSize: 50,
                    onPressed: (){
                      print('frdv');
                      setState(() {
                        oneClicked = false;
                        twoClicked = false;
                        threeClicked = true;
                      });},
                    icon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '16',
                        style:TextStyle(
                          fontSize: 30,
                          fontFamily: 'Skranji-Bold',
                          fontWeight: FontWeight.bold,
                          color:Colors.brown[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top:size.height*0.76,
                left: size.width*-0.035,
                height: size.height*0.25,
                width:size.width*0.4,
                child: Visibility(
                  visible: oneClicked&&Visible,
                  child: IconButton(
                    onPressed: () async {
                      player2?.stop();
                      if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                      setState(() {
                        //int result = await advancedPlayer?.pause();
                        Visible = false;
                      });
                    },
                    icon: SvgPicture.asset(quotes),
                  ),

                ),
              ),
              Positioned(
                right: size.width*-0.035,
                top:size.height*0.68,
                height: size.height*0.25,
                width:size.width*0.4,
                child: Visibility(
                  visible: twoClicked&&Visible,

                  child: IconButton(
                    onPressed: ()  async  {
                      player2?.stop();
                      if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                      player2 =  await player.play('audio/mathsBravo.wav');
                      setState(()   {
                        Visible = false;
                        correct = true;
                      });
                      scoreM.niv3+=2;
                      print(scoreM.niv3);
                    },
                    icon: SvgPicture.asset(quotes),
                  ),

                ),
              ),
              Positioned(
                left: size.width*0.3,
                top:size.height*0.73,
                height: size.height*0.25,
                width:size.width*0.4,
                child: Visibility(
                  visible: threeClicked&&Visible,

                  child: IconButton(
                    onPressed: () async {
                      player2?.stop();
                      if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                      setState(() {

                        //int result = await advancedPlayer?.pause();
                        Visible = false;
                      });
                    },
                    icon: SvgPicture.asset('assets/icons/Quotes2.svg'),
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
                     // int result = await advancedPlayer?.pause();
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => M_3_4()));
                      print('Continuer');},)
                ),
              ),
              if (correct)
                Stack(
                  children: <Widget>[
                    Visibility(
                      visible: !Visible,
                      child: Positioned(
                          left: size.width*0.17,
                          top:size.height*0.63,
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
                      child: Positioned(
                          left: size.width*0.17,
                          top:size.height*0.63,
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

