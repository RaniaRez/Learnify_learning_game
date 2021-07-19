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
import 'package:somthn/Francais/Niveau2Pass%C3%A9.dart';
import 'package:somthn/Francais/boxDialog2.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/myicons.dart';
import '../Services/Login.dart';
import 'BienvenueFr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'F-2.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import '../Maths/ScoreMaths.dart';
import'../Geographie/ScoreGeo.dart';
import'../Maths/HighestScore.dart';

ScoreMaths scorM;
ScoreGeo scorG ;
HighestScore highM , highG;

class F_2_5_2nd extends StatefulWidget {
  const F_2_5_2nd({Key key}) : super(key: key);

  @override
  _F_2_5_2ndState createState() => _F_2_5_2ndState();
}

class _F_2_5_2ndState extends State<F_2_5_2nd> {

  AudioPlayer advancedPlayer;
  var player = AudioCache();
  var player2 = AudioPlayer ();

  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/frBateau.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }


  bool Visible = true;
  String letterE;
  String letterO;
  String letterL;
  String letterV;
  String letterI;
  String drag1;
  String drag2;
  String drag3;
  String drag4;
  String drag5;
  bool correct=false;
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
                  SettingsButton(onPressed: () async {
                    player2?.stop();
                    if(advancedPlayer !=null){
                      int result = await advancedPlayer?.pause();
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
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
                          return customDialog2();
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
                  top: size.height*0.47,
                  left: size.width*0.75,
                  child: GoToButton(onPressed: () async {
                    if(advancedPlayer !=null){
                      int result = await advancedPlayer?.pause();
                    }
                    if((drag1=="assets/icons/v.svg")&&(drag2=="assets/icons/o.svg")&&(drag3=="assets/icons/i.svg")&&(drag4=="assets/icons/l.svg")&&(drag5=="assets/icons/e.svg")){
                      player2 =  await player.play('audio/mathsBravo.wav');
                      setState(() {
                        Visible=false;
                        correct=true;

                        scoreF.niv2+=1;
                      });}else if ((drag1==null)&&(drag2==null)&&(drag3==null)&&(drag4==null)&&(drag5==null)){}
                    else{
                      player2 =  await player.play('audio/losing.wav');
                      setState(() {
                        Visible=false;
                      });

                    }
                  },),
                ),
              ),
              Positioned(
                top: size.height*0.57,
                left:size.width*0.16,
                height: size.height*0.2,
                width: size.width*0.7,
                child: Visibility(
                  child: SvgPicture.asset("assets/icons/bigButton.svg"),
                ),
              ),
              Positioned(
                top: size.height*0.15,
                left: size.width*0.2,
                height: size.width*0.5,
                width: size.width*0.5,
                child:SvgPicture.asset('assets/icons/bulle2ndAttempt.svg'),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.48,
                  right: size.width*0.77,
                  child: ButtonReset(
                      onPressed: () {
                        setState(() {
                          letterI="";
                          letterO="";
                          letterL="";
                          letterV="";
                          letterE="";
                          drag1=null;
                          drag2=null;
                          drag3=null;
                          drag4=null;
                          drag5=null;
                        });
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
                      print(scoreF.niv2);
                      Firestore.instance.collection('users').document(user.uid).collection('domains').document('francais').updateData({'niv2':scoreF.niv2});
                      if (scoreF.niv2>high.niv2)
                      { high.niv2=scoreF.niv2 ;
                        Firestore.instance.collection('users').document(user.uid).collection('domains').document('francais').updateData({'high2':scoreF.niv2});}
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
                            MaterialPageRoute(builder: (context) => Niveau2Pass()));
                    },)
                ),
              ),
              if (user.avatar=="Pink")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.36,
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
                    top: size.height*0.35,
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
                    top: size.height*0.36,
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
                    top: size.height*0.36,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),
              Positioned(
                top: size.height*0.9,
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
                          
                          letterE = 'assets/icons/e.svg';
                        },
                        data:
                        "assets/icons/e.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterE == 'assets/icons/e.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/e.svg',
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
                            'assets/icons/e.svg',
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
                      SizedBox( width: size.width*0.1,),
                      Draggable<String>(
                        onDragCompleted: (){
                          
                          letterV = 'assets/icons/v.svg';
                        },
                        data:
                        "assets/icons/v.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterV == 'assets/icons/v.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/v.svg',
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
                            'assets/icons/v.svg',
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
                top: size.height*0.8,
                left: size.width*0.32,
                child: Visibility(
                  visible: Visible,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /////////////////////
                      /// Draggable
                      Draggable<String>(
                        onDragCompleted: (){
                          
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
                          
                          letterI = 'assets/icons/i.svg';
                        },
                        data:
                        "assets/icons/i.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterI == 'assets/icons/i.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/i.svg',
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
                            'assets/icons/i.svg',
                            height: 50,
                            width: 50,
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 50,
                          height: 50,),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: size.height*0.632,
                left:size.width*0.2,
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
                    DragTarget<String>(
                      onAccept: (value) {
                        setState(() {
                          drag4 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(

                          width: 50,
                          height: 50,

                          alignment: Alignment.center,
                          child: drag4 != null
                              ? SvgPicture.asset(

                            drag4,
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
                          drag5 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(


                          width: 50,
                          height: 50,

                          alignment: Alignment.center,
                          child: drag5 != null
                              ? SvgPicture.asset(

                            drag5,
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
