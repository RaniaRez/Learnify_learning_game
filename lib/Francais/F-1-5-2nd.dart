import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Buttons/BacksButton.dart';
import 'package:somthn/Buttons/buttonContinuer.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/Buttons/buttonReset.dart';
import 'package:somthn/Buttons/settingsButton.dart';
import 'package:somthn/Francais/F-1.dart';
import 'package:somthn/Francais/Niveau1Pass%C3%A9.dart';
import 'package:somthn/Francais/NiveauFr.dart';
import 'package:somthn/Francais/boxDialog1.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/myicons.dart';
import '../Services/Login.dart';
import 'BienvenueFr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import '../Maths/ScoreMaths.dart';
import'../Geographie/ScoreGeo.dart';
import'../Maths/HighestScore.dart';

ScoreMaths scorM;
ScoreGeo scorG ;
HighestScore highM , highG;

class F_1_5_2nd extends StatefulWidget {
  const F_1_5_2nd({Key key}) : super(key: key);

  @override
  _F_1_5_2ndState createState() => _F_1_5_2ndState();
}

class _F_1_5_2ndState extends State<F_1_5_2nd> {

  AudioPlayer advancedPlayer;
  var player = AudioCache();
  var player2 = AudioPlayer ();

  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/mathsMauvRep.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }


  bool Visible = true;
  bool correct=false;
  String letterS;
  String letterO;
  String letterL;
  String drag1;
  String drag2;
  String drag3;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/frBG.jpg"),
                        fit: BoxFit.cover)),),
              Positioned(
                  top: size.height*0.05,
                  left:size.width*0.75,
                  child:
                  SettingsButton(onPressed: ()async {
                    player2?.stop();
                    if(advancedPlayer !=null){
                      int result = await advancedPlayer?.pause();
                    }

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
                    if(advancedPlayer !=null){
                      int result = await advancedPlayer?.pause();
                    }
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return customDialog1();
                        }
                    );
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
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.6,
                  left: size.width*0.75,
                  child: GoToButton(onPressed: () async {
                    if((drag1=="assets/icons/s.svg")&&(drag2=="assets/icons/o.svg")&&(drag3=="assets/icons/l.svg")){
                      print('correct');
                      int result = await advancedPlayer?.pause();

                      player2 =  await player.play('audio/mathsBravo.wav');

                      scoreF.niv1+=1;
                      print('HADA SCORE');
                      print(scoreF.niv1);
                      setState(() {
                        Visible=false;
                        correct=true;
                      });}else if ((drag1==null)&&(drag2==null)&&(drag3==null)){                   int result = await advancedPlayer?.pause();
                    }else{
                      int result = await advancedPlayer?.pause();
                      player2 =  await player.play('audio/losing.wav');
                      setState(() {
                        Visible=false;

                      });
                    }

                    print("HELL YEAH");

                  },),
                ),
              ),
              Positioned(
                top: size.height*0.615,
                left:size.width*0.3,
                height: size.height*0.1,
                width: size.width*0.4,

                child: Visibility(
                  child: SvgPicture.asset("assets/icons/mediumButton.svg"),
                ),
              ),
              Positioned(
                top: size.height*0.2,
                left: size.width*0.2,
                height: size.width*0.5,
                width: size.width*0.5,
                child:SvgPicture.asset('assets/icons/bulle2ndAttempt.svg'),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.61,
                  right: size.width*0.77,
                  child: ButtonReset(
                      onPressed: () {
                        setState(() {
                          letterS="";
                          letterO="";
                          letterL="";
                          drag1=null;
                          drag2=null;
                          drag3=null;
                        });
                        print('reset');
                      }

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
                      int result = await advancedPlayer?.pause();


                      print("score final");
                      print(scoreF.niv1);
                      Firestore.instance.collection('users').document(user.uid).collection('domains').document('francais').updateData({'niv1':scoreF.niv1});
                      if (scoreF.niv1>high.niv1)
                      {high.niv1=scoreF.niv1 ;
                        Firestore.instance.collection('users').document(user.uid).collection('domains').document('francais').updateData({'high1':scoreF.niv1});}
                      // infos maths
                      var dm=await  Firestore.instance.collection('users').document(user.uid).collection('domains').document('maths').get();
                      scorM =new ScoreMaths(dm.data["testFait"], dm.data["niv1"], dm.data["niv2"], dm.data["niv3"]);
                      highM =new HighestScore(dm.data["high1"],dm.data["high2"],dm.data["high3"]);
                      // infos geo
                      var dg=await Firestore.instance.collection('users').document(user.uid).collection('domains').document('geographie').get();
                      scorG =new ScoreGeo(dg.data["testFait"], dg.data["niv1"], dg.data["niv2"], dg.data["niv3"]);
                      highG =new HighestScore(dg.data["high1"],dg.data["high2"],dg.data["high3"]);
                      int score=scorM.somme()+scoreF.somme() +scorG.somme() ;
                      int highest=highM.somme()+high.somme() +highG.somme() ;
                      var doc=await Firestore.instance.collection('users').document(user.uid).get();
                      if (doc.data['finalScore']<highest){
                        Firestore.instance.collection('users').document(user.uid).updateData({'finalScore':highest});
                      }
                      Firestore.instance.collection('users').document(user.uid).updateData({'score':score});
                      Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Niveau1Pass()));

                      print('Continuer');},)
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
                top: size.height*0.8,
                right: size.width*0.23,
                child: Visibility(
                  visible: Visible,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /////////////////////
                      /// Draggable
                      Draggable<String>(
                        onDragCompleted: (){
                          print('gfds');
                          letterO = 'assets/icons/o.svg';
                        },
                        data:
                        "assets/icons/o.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterO == 'assets/icons/o.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/o.svg',
                            height: 50,
                            width: 50,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          //color: Colors.purple,
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/o.svg',
                            height: 50,
                            width: 50,
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 50,
                          height: 50,),


                      ),
                      SizedBox( width: size.width*0.1,),
                      Draggable<String>(
                        onDragCompleted: (){
                          print('gfds');
                          letterS = 'assets/icons/s.svg';
                        },
                        data:
                        "assets/icons/s.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterS == 'assets/icons/s.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/s.svg',
                            height: 50,
                            width: 50,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          //color: Colors.purple,
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/s.svg',
                            height: 50,
                            width: 50,
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 50,
                          height: 50,),
                      ),
                      SizedBox( width: size.width*0.1,),
                      Draggable<String>(
                        onDragCompleted: (){
                          print('gfds');
                          letterL = 'assets/icons/l.svg';
                        },
                        data:
                        "assets/icons/l.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterL == 'assets/icons/l.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/l.svg',
                            height: 50,
                            width: 50,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          //color: Colors.purple,
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/l.svg',
                            height: 50,
                            width: 50,
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 50,
                          height: 50,),
                      ),




                      ////////////////////////


                    ],
                  ),
                ),

              ),

              Positioned(
                top: size.height*0.632,
                left:size.width*0.32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DragTarget<String>(
                      onAccept: (value) {
                        setState(() {
                          drag1 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(

                          width: 50,
                          height: 50,

                          alignment: Alignment.center,
                          child: drag1 != null
                              ? SvgPicture.asset(
                            drag1,
                            height: 50,
                            width: 50,
                          )
                              : Container(),
                        );
                      },
                    ),
                    DragTarget<String>(
                      onAccept: (value) {
                        setState(() {
                          drag2 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(

                          width: 50,
                          height: 50,

                          alignment: Alignment.center,
                          child: drag2 != null
                              ? SvgPicture.asset(

                            drag2,
                            height: 50,
                            width: 50,
                          )
                              : Container(),
                        );
                      },
                    ),
                    DragTarget<String>(
                      onAccept: (value) {
                        setState(() {
                          drag3 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(

                          width: 50,
                          height: 50,

                          alignment: Alignment.center,
                          child: drag3 != null
                              ? SvgPicture.asset(

                            drag3,
                            height: 50,
                            width: 50,
                          )
                              : Container(),
                        );
                      },
                    ),

                  ],
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
              if (correct)
                Stack(
                  children: <Widget>[
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
            ]
        ),
      ),
    );
  }

}
