import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Geographie/boxDialogGeo1.dart';

import 'package:somthn/Buttons/BacksButton.dart';
import 'package:somthn/Geographie/N1Q3.dart';

import 'package:somthn/Buttons/buttonContinuer.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/Buttons/buttonReset.dart';
import 'package:somthn/Buttons/settingsButton.dart';
import 'package:somthn/Francais/F-1-5.dart';
import 'package:somthn/Francais/F-1.dart';
import 'package:somthn/Geographie/N1.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/myicons.dart';
import '../Services/Login.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'BienvenueGeo.dart';

class N1Q2T2 extends StatefulWidget {
  const N1Q2T2({Key key}) : super(key: key);

  @override
  _N1Q2T2State createState() => _N1Q2T2State();
}

class _N1Q2T2State extends State<N1Q2T2> {
  var player = AudioCache();
  var player2 = AudioPlayer ();

  AudioPlayer advancedPlayer;


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
  String letterA;
  String letterL;
  String letterG;
  String letterE;
  String letterR;
  String letterI;
  String letterE1;
  String drag1;
  String drag2;
  String drag3;
  String drag4;
  String drag5;
  String drag6;
  String drag7;
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
                        image: AssetImage("images/geo_BG.jpg"),
                        fit: BoxFit.cover)),),
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
                  },)
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: ()async {
                    int result = await advancedPlayer?.pause();
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return customDialogGeo1();
                        }
                    );
                    player2?.stop();

                  },)
              ),
              Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(barreProgress)),

              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(TwoBars),
                ),
              ),

              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.47,
                  left: size.width*0.75,
                  child: GoToButton(onPressed: () async {
                    player2?.stop();

                  if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                    if((drag1=="assets/icons/a.svg")&&(drag2=="assets/icons/l.svg")&&(drag3=="assets/icons/gb.svg")&&(drag4=="assets/icons/e.svg")&&(drag5=="assets/icons/r.svg")&&(drag6=="assets/icons/i.svg")&&(drag7=="assets/icons/e.svg")){
                      player2 =  await player.play('audio/mathsBravo.wav');
                      setState(() {
                        correct = true;
                        Visible=false;
                        scoreG.niv1++;
                      });}else if ((drag1==null)&&(drag2==null)&&(drag3==null)&&(drag4==null)&&(drag5==null)&&(drag6==null)&&(drag7==null)){}
                    else{
                      player2 =  await player.play('audio/losing.wav');
                      setState(() {
                        Visible=false;
                        correct = false;
                      });}

                  },),
                ),
              ),
              Positioned(
                top: size.height*0.535,
                left:size.width*0.05,
                height: size.height*0.2,
                width: size.width*0.9,

                child: Visibility(
                  child: SvgPicture.asset("assets/icons/bigButton.svg"),
                ),
              ),
              Positioned(
                top: size.height*0.15,
                left: size.width*0.1,
                height: size.width*0.6,
                width: size.width*0.6,
                child:SvgPicture.asset('assets/icons/BulleN1Q2T2.svg'),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.48,
                  right: size.width*0.77,
                  child: ButtonReset(
                      onPressed: () {
                        setState(() {
                          letterA="";
                          letterL="";
                          letterG="";
                          letterE="";
                          letterR="";
                          letterI="";
                          letterE1="";
                          drag1=null;
                          drag2=null;
                          drag3=null;
                          drag4=null;
                          drag5=null;
                          drag6=null;
                          drag7=null;
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
                      if (advancedPlayer!=null){

                  int result = await advancedPlayer?.pause();}
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => N1Q3()));},)
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

                          letterA = 'assets/icons/a.svg';
                        },
                        data:
                        "assets/icons/a.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterA == 'assets/icons/a.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/a.svg',
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
                            'assets/icons/a.svg',
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

                          letterG = 'assets/icons/gb.svg';
                        },
                        data:
                        "assets/icons/gb.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterG == 'assets/icons/gb.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/gb.svg',
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
                            'assets/icons/gb.svg',
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
                top: size.height*0.9,
                left: size.width*0.1,
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
                      SizedBox( width: size.width*0.1,),
                      Draggable<String>(
                        onDragCompleted: (){

                          letterR = 'assets/icons/r.svg';
                        },
                        data:
                        "assets/icons/r.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterR == 'assets/icons/r.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/r.svg',
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
                            'assets/icons/r.svg',
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

                          letterE1 = 'assets/icons/e.svg';
                        },
                        data:
                        "assets/icons/e.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterE1 == 'assets/icons/e.svg'
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
                      ////////////////////////
                    ],
                  ),
                ),

              ),
              Positioned(
                top: size.height*0.6,
                left: size.width*0.07,
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
                    ), DragTarget<String>(
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
                    DragTarget<String>(
                      onAccept: (value) {
                        setState(() {
                          drag6 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(
                          width: 50,
                          height: 50,

                          alignment: Alignment.center,
                          child: drag6 != null
                              ? SvgPicture.asset(

                            drag6,
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
                          drag7 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(
                          width: 50,
                          height: 50,

                          alignment: Alignment.center,
                          child: drag7 != null
                              ? SvgPicture.asset(

                            drag7,
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
