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
import 'package:somthn/Francais/F-3-4-2nd.dart';
import 'package:somthn/Francais/F-3-5.dart';
import 'package:somthn/Francais/boxDialog3.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/myicons.dart';
import '../Services/Login.dart';
import 'BienvenueFr.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'F-3.dart';

class F_3_4 extends StatefulWidget {
  const F_3_4({Key key}) : super(key: key);

  @override
  _F_3_4State createState() => _F_3_4State();
}

class _F_3_4State extends State<F_3_4> {

  var player = AudioCache();
  var player2 = AudioPlayer ();

  bool Visible = true;
  String letterH;
  String letterE;
  String letterU;
  String letterR;
  String letterEE;
  String letterUU;
  String letterX;
  String drag1;
  String drag2;
  String drag3;
  String drag4;
  String drag5;
  String drag6;
  String drag7;

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
                  SettingsButton(onPressed: (){
                    player2?.stop();

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },)
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: (){
                    player2?.stop();

                    showDialog(context: context,
                        builder: (BuildContext context){
                          return customDialog3();
                        }
                    );
                  },)
              ),
              Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(ThreeBars)),

              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(FourBars),
                ),
              ),

              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.47,
                  left: size.width*0.75,
                  child: GoToButton(onPressed: () async {
                    if((drag1=="assets/icons/h.svg")&&(drag2=="assets/icons/e.svg")&&(drag3=="assets/icons/u.svg")&&(drag4=="assets/icons/r.svg")&&(drag5=="assets/icons/e.svg")&&(drag6=="assets/icons/u.svg")&&(drag7=="assets/icons/x.svg")){
                      scoreF.niv3+=2;
                      player2 =  await player.play('audio/mathsBravo.wav');


                      setState(() {
                        Visible=false;
                      });}else if ((drag1==null)&&(drag2==null)&&(drag3==null)&&(drag4==null)&&(drag5==null)&&(drag6==null)&&(drag7==null)){}
                    else{
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => F_3_4_2nd()));
                    }

                  },),
                ),
              ),
              Positioned(
                top: size.height*0.532,
                height: size.height*0.2,
                width: size.width,
                child: Visibility(
                  child: SvgPicture.asset("assets/icons/XLbutton.svg"),
                ),
              ),
              Positioned(
                top: size.height*0.15,
                left: size.width*0.2,
                height: size.width*0.5,
                width: size.width*0.5,
                child:SvgPicture.asset('assets/icons/bulleHeureux.svg'),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.48,
                  right: size.width*0.77,
                  child: ButtonReset(
                      onPressed: () {
                        setState(() {
                          letterH="";
                          letterE="";
                          letterU="";
                          letterR="";
                          letterEE="";
                          letterUU="";
                          letterX="";
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
                    child: ButtonContinuer(onPressed: (){
                      player2?.stop();

                      print('HADA SCORE');
                      print(scoreF.niv3);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => F_3_5()));},)
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
                          
                          letterU = 'assets/icons/u.svg';
                        },
                        data:
                        "assets/icons/u.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterU == 'assets/icons/u.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/u.svg',
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
                            'assets/icons/u.svg',
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
                          
                          letterX = 'assets/icons/x.svg';
                        },
                        data:
                        "assets/icons/x.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterX == 'assets/icons/x.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/x.svg',
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
                            'assets/icons/x.svg',
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
                          
                          letterH = 'assets/icons/h.svg';
                        },
                        data:
                        "assets/icons/h.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterH == 'assets/icons/h.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/h.svg',
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
                            'assets/icons/h.svg',
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
                          
                          letterUU = 'assets/icons/u.svg';
                        },
                        data:
                        "assets/icons/u.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterUU == 'assets/icons/u.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/u.svg',
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
                            'assets/icons/u.svg',
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
                          
                          letterEE = 'assets/icons/e.svg';
                        },
                        data:
                        "assets/icons/e.svg",
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: letterEE == 'assets/icons/e.svg'
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
                left: size.width*0.08,
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
              )
            ]
        ),
      ),
    );
  }

}
