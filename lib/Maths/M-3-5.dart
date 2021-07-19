import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Maths/Niveau3Pass%C3%A9.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


import 'package:somthn/Francais/ScoreFr.dart';
import 'package:somthn/Geographie/ScoreGeo.dart';
import 'HighestScore.dart';

ScoreGeo scorG;
ScoreFr scorF ;
HighestScore highG , highF;


class M_3_5 extends StatefulWidget {
  const M_3_5({Key key}) : super(key: key);

  @override
  _M_3_5State createState() => _M_3_5State();
}
class _M_3_5State extends State<M_3_5> {
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

  bool oneClicked = false;
  bool twoClicked = false;
  bool threeClicked = false;
  bool fourClicked = false;
  bool Visible = true;
  bool correct = false;
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
                  right:size.width*0.75,

                  child: BacksButton(onPressed: () async {
                    player2?.stop();
                    if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                    print("u clicked me");
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return customDialogMath3();
                        }
                    );
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
                  child: SvgPicture.asset(FourBars)),

              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(FiveBars),
                ),
              ),
              if (user.avatar=="Pink")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.5,
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
                    top: size.height*0.49,
                    left: size.width*0.69,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.5,
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
                    top: size.height*0.5,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),
              Positioned(
                top: size.height*0.2,
                left: size.width*0.1,
                height: size.width*0.8,
                width: size.width*0.8,
                child:SvgPicture.asset('assets/icons/M-3-Q-5.svg'),
              ),

              Visibility(
                visible:!Visible,
                child: Positioned(
                    top: size.height*0.61,
                    left: size.width*0.33,
                    height: size.width*0.2,
                    width: size.width*0.33,
                    child: QButton(onPressed: null,)
                ),
              ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                  top: size.height*0.6,
                  left: size.width*0.375,
                  child: IconButton(
                    iconSize: 80,
                    onPressed: (){
                      print('frdv');
                      setState(() {
                        oneClicked = true;
                        twoClicked = false;
                        threeClicked = false;
                        fourClicked = false;
                      });},
                    icon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '122 mm',
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

                    top: size.height*0.67,
                    left: size.width*0.1,
                    height: size.width*0.2,
                    width: size.width*0.33,
                    child: QButton(onPressed: null,)
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.66,
                  left: size.width*0.15,
                  child: IconButton(
                    iconSize: 80,
                    onPressed: (){
                      print('frdv');
                      setState(() {
                        oneClicked = true;
                        twoClicked = false;
                        threeClicked = false;
                        fourClicked = false;
                      });},
                    icon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '122 mm',
                        style:TextStyle(
                          fontSize:30,
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
                    left: size.width*0.48,
                    height: size.width*0.2,
                    width: size.width*0.33,
                    child: QButton(onPressed: null,)
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.74,
                  left: size.width*0.54,
                  child: IconButton(
                    iconSize: 80,
                    onPressed: (){
                      print('frdv');
                      setState(() {
                        oneClicked = false;
                        twoClicked = true;
                        threeClicked = false;
                        fourClicked = false;
                      });},
                    icon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '130 mm',
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
                    top: size.height*0.82,
                    left: size.width*0.1,
                    height: size.width*0.2,
                    width: size.width*0.33,
                    child: QButton(onPressed: null,)
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.81,
                  left: size.width*0.16,
                  child: IconButton(
                    iconSize: 80,
                    onPressed: (){
                      print('frdv');
                      setState(() {
                        oneClicked = false;
                        twoClicked = false;
                        threeClicked = true;
                        fourClicked = false;
                      });},
                    icon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '128 mm',
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
                    top: size.height*0.89,
                    left: size.width*0.48,
                    height: size.width*0.2,
                    width: size.width*0.33,
                    child: QButton(onPressed: null,)
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.88,
                  left: size.width*0.54,
                  child: IconButton(
                    iconSize: 80,
                    onPressed: (){
                      print('frdv');
                      setState(() {
                        oneClicked = false;
                        twoClicked = false;
                        threeClicked = false;
                        fourClicked = true;
                      });},
                    icon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '80 mm',
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
                left: size.width*0.065,
                top:size.height*0.6,
                height: size.height*0.25,
                width:size.width*0.4,
                child: Visibility(
                    visible: (oneClicked && Visible),
                    child: IconButton(
                        onPressed: () async {
                          if (oneClicked){
                            player2?.stop();
                            if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                            setState(() {
                              Visible = false;
                            });
                            print('Correct');
                          }
                          print('2');
                        },
                        icon: SvgPicture.asset(quotes))
                ),
              ),
              Positioned(
                left: size.width*0.44,
                top:size.height*0.815,
                height: size.height*0.25,
                width:size.width*0.4,
                child: Visibility(
                    visible: (fourClicked&&Visible),
                    child: IconButton(
                        onPressed: () async {
                          if (fourClicked)  {
                            player2?.stop();
                            if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                            print('Wrong');
                          }
                          print('4');
                        },
                        icon: SvgPicture.asset(quotes))
                ),
              ),
              Positioned(
                left: size.width*0.44,
                top:size.height*0.67,
                height: size.height*0.25,
                width:size.width*0.4,

                child: Visibility(
                    visible: (twoClicked&&Visible),
                    child: IconButton(
                        onPressed: () async {
                          if (twoClicked)  {
                            player2?.stop();
                            if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                            print('Wrong');
                          }
                          print('1');
                        },
                        icon: SvgPicture.asset(quotes))
                ),
              ),
              Positioned(
                left: size.width*0.06,
                top:size.height*0.74,
                height: size.height*0.25,
                width:size.width*0.4,
                child: Visibility(
                    visible: (threeClicked&&Visible),
                    child: IconButton(
                        onPressed: () async {
                          if (threeClicked)  {
                            player2?.stop();
                            if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                            print('Wrong');
                          }
                          print('3');
                        },
                        icon: SvgPicture.asset(quotes))
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
              Positioned(
                left: size.width*0.44,
                top:size.height*0.67,
                height: size.height*0.25,
                width:size.width*0.4,
                child: Visibility(
                    visible: (twoClicked && Visible),
                    child: IconButton(
                        onPressed: () async {
                          if (twoClicked)  {
                            player2?.stop();
                            if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                            setState(() {
                              Visible = false;
                              correct=false;

                            });
                            print('Wrong');
                          }
                          print('2');
                        },
                        icon: SvgPicture.asset(quotes))
                ),
              ),
              Positioned(
                left: size.width*0.44,
                top:size.height*0.815,
                height: size.height*0.25,
                width:size.width*0.4,
                child: Visibility(
                    visible: (fourClicked&&Visible),
                    child: IconButton(
                        onPressed: () async {
                          if (fourClicked)  {
                            player2?.stop();
                            if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                            setState(() {
                              Visible = false;
                              correct=false;
                              print('Wrong');
                            });
                          }
                          print('4');
                        },
                        icon: SvgPicture.asset(quotes))
                ),
              ),
              Positioned(
                left: size.width*0.065,
                top:size.height*0.6,
                height: size.height*0.25,
                width:size.width*0.4,
                child: Visibility(
                    visible: (oneClicked&&Visible),
                    child: IconButton(
                        onPressed: () async {
                          if (oneClicked){
                            player2?.stop();
                            player2 =  await player.play('audio/mathsBravo.wav');
                            if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                            setState(() {
                              Visible = false;
                              correct = true;
                            });
                            scoreM.niv3=scoreM.niv3+2;
                            print(scoreM.niv3);
                            print('Correct');
                          }
                          print('1');
                        },
                        icon: SvgPicture.asset(quotes))
                ),
              ),
              Positioned(
                left: size.width*0.06,
                top:size.height*0.74,
                height: size.height*0.25,
                width:size.width*0.4,
                child: Visibility(
                    visible: (threeClicked&&Visible),
                    child: IconButton(
                        onPressed: () async {
                          if (threeClicked)  {
                            player2?.stop();
                            if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                            //int result = await advancedPlayer?.pause();
                            setState(() {
                              Visible = false;
                              print('Wrong');
                              correct=false;
                            });

                          }
                          print('3');
                        },
                        icon: SvgPicture.asset(quotes))
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

                      Firestore.instance.collection('users').document(user.uid).collection('domains').document('maths').updateData({'niv3':scoreM.niv3});
                      if (scoreM.niv3>hs.niv3)
                      { hs.niv3=scoreM.niv3 ;
                        Firestore.instance.collection('users').document(user.uid).collection('domains').document('maths').updateData({'high3':scoreM.niv3});}
                      // infos geo
                      var dm=await  Firestore.instance.collection('users').document(user.uid).collection('domains').document('geographie').get();
                      scorG =new ScoreGeo(dm.data["testFait"], dm.data["niv1"], dm.data["niv2"], dm.data["niv3"]);
                      highG =new HighestScore(dm.data["high1"],dm.data["high2"],dm.data["high3"]);
                      //infos fr
                      var df=await Firestore.instance.collection('users').document(user.uid).collection('domains').document('francais').get();
                      scorF =new ScoreFr(df.data["testFait"], df.data["niv1"], df.data["niv2"], df.data["niv3"]);
                      highF =new HighestScore(df.data["high1"],df.data["high2"],df.data["high3"]);
                      int score=scoreM.somme()+scorF.somme() +scorG.somme() ;
                      int high=hs.somme()+highF.somme() +highG.somme() ;
                      var doc=await Firestore.instance.collection('users').document(user.uid).get();
                      if (doc.data['finalScore']<high){
                        Firestore.instance.collection('users').document(user.uid).updateData({'finalScore':high});
                      }
                      Firestore.instance.collection('users').document(user.uid).updateData({'score':score});
                      Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Niveau3Pass()));

                      print('Continuer');},)
                ),
              ),
            ],
          ),

        ));
  }

}



