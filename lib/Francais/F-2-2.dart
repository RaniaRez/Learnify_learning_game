import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/BarreProgres.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/Francais/F-2-3.dart';
import 'package:somthn/Francais/F-2.dart';
import 'package:somthn/Francais/boxDialog2.dart';
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
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'BienvenueFr.dart';

class F_2_2 extends StatefulWidget {
  const F_2_2({Key key}) : super(key: key);

  @override
  _F_2_2State createState() => _F_2_2State();
}

class _F_2_2State extends State<F_2_2> {
  var player = AudioCache();
  var player2 = AudioPlayer ();
  bool Visible = true;
  bool correct = false;
  String optimiste;
  String gentil;
  String poli;
  String drag1;
  String drag2;
  String drag3;
  @override
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
                        image: AssetImage("images/frBG.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: size.height*0.05,
                  left:size.width*0.75,
                  child:
                  SettingsButton(onPressed: (){
                    player2?.stop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("HELL YEAH");
                  },)
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: (){
                    player2?.stop();
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
                child: BarreProgres(),
              ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(TwoBars),
                ),
              ),
              Positioned(
                top: size.height*0.27,
               left: size.width*0.04,
               child: Row(
                 children: <Widget>[

                      Bounce(
                        infinite:true,
                        child: IconButton(
                           iconSize: 64,
                           icon: SvgPicture.asset('assets/icons/QuestionMark.svg'),
                           onPressed: () {
                             player2?.stop();
                             setState(() {
                               drag1=null;
                               drag2=null;
                               drag3=null;
                               poli="";
                               gentil="";
                               optimiste="";
                               correct=false;
                               Visible= true;

                             });
                             print('QuestionMark');
                           }
                     ),
                      ),

                   SizedBox(width: size.width*0.5,),
                   GoToButton(onPressed: ()async {
                     player2?.stop();
                     if(
                     (drag1=='assets/icons/optimiste.svg')&&(drag2=='assets/icons/poli.svg')&&(drag3=='assets/icons/gentil.svg')
                     ){
                       player2 =  await player.play('audio/mathsBravo.wav');

                       scoreF.niv1+=2;
                       setState(() {
                         Visible=false;
                         correct=true;
                       });

                     }else{
                       player2 =  await player.play('audio/losing.wav');
                       setState(() {
                         Visible=false;
                       });
                     }
                     print('goto');
                   })

                 ],

               )
              ),
             
              if (user.avatar=="Pink")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.16,
                    left: size.width*0.71,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.15,
                    left: size.width*0.66,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon( onPressed: null,
                    ),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.17,
                    left: size.width*0.71,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.16,
                    left: size.width*0.71,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),
              Positioned(
                  top: size.height*0.4,
                  left:size.width*0.05,
                  child: Row(
                    children: <Widget>[
                      Draggable<String>(
                        onDragCompleted: (){
                          print('gfds');
                          optimiste = 'assets/icons/optimiste.svg';
                        },
                        data:
                        "assets/icons/optimiste.svg",
                        child: Container(
                          width: 118,
                          height: 45,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: optimiste == 'assets/icons/optimiste.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/optimiste.svg',
                            width: 118,
                            height: 45,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          width: 118,
                          height: 45,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/optimiste.svg',
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 118,
                          height: 45,),
                      ),
                      SizedBox(width:10,),
                      Draggable<String>(
                        onDragCompleted: (){
                          print('gfds');
                          gentil = 'assets/icons/gentil.svg';
                        },
                        data:
                        "assets/icons/gentil.svg",
                        child: Container(
                          width: 118,
                          height: 45,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: gentil == 'assets/icons/gentil.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/gentil.svg',
                            width: 118,
                            height: 45,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          width: 118,
                          height: 45,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/gentil.svg',
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 118,
                          height: 45,),
                      ),
                      SizedBox(width:10,),
                      Draggable<String>(
                        onDragCompleted: (){
                          print('gfds');
                          poli = 'assets/icons/poli.svg';
                        },
                        data:
                        "assets/icons/poli.svg",
                        child: Container(
                          width: 118,
                          height: 45,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: poli == 'assets/icons/poli.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/poli.svg',
                            width: 118,
                            height: 45,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          width: 118,
                          height: 45,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/poli.svg',
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 118,
                          height: 45,),
                      ),

                    ],
                  )

              ),
              Positioned(
                top: size.height*0.54,
                  right: size.width*0.065,
                  child: Column(
                children: <Widget>[
                  SvgPicture.asset('assets/icons/dragtarget.svg'),
                  SizedBox(height:size.height*0.014),
                  SvgPicture.asset('assets/icons/dragtarget.svg'),
                  SizedBox(height:size.height*0.011),
                  SvgPicture.asset('assets/icons/dragtarget.svg'),

                ],
              )),
              Positioned(
                  top: size.height*0.54,
                  left: size.width*0.065,
                  child: Column(
                    children: <Widget>[
                      SvgPicture.asset('assets/icons/pessimiste.svg'),
                      SizedBox(height:size.height*0.014),
                      SvgPicture.asset('assets/icons/impoli.svg'),
                      SizedBox(height:size.height*0.011),
                      SvgPicture.asset('assets/icons/mechant.svg'),

                    ],
                  )),

              Positioned(
                top: size.height*0.555,
                  right: size.width*0.09,
                  child: Column(
                    children: <Widget>[
                      DragTarget<String>(
                        onAccept: (value) {
                          setState(() {
                            drag1 = value;
                          });
                        },
                        builder: (_, candidateData, rejectedData) {
                          return Container(
                            width: 118,
                            height: 45,

                            alignment: Alignment.center,
                            child: drag1 != null
                                ? SvgPicture.asset(

                              drag1,
                              width: 118,
                              height: 45,
                            )
                                : Container(),
                          );
                        },
                      ),
                      SizedBox(
                        height: size.height*0.045,
                      ),
                      DragTarget<String>(
                        onAccept: (value) {
                          setState(() {
                            drag2 = value;
                          });
                        },
                        builder: (_, candidateData, rejectedData) {
                          return Container(
                            width: 118,
                            height: 45,

                            alignment: Alignment.center,
                            child: drag2 != null
                                ? SvgPicture.asset(

                              drag2,
                              width: 118,
                              height: 45,
                            )
                                : Container(),
                          );
                        },
                      ),
                      SizedBox(
                        height: size.height*0.045,
                      ),
                      DragTarget<String>(
                        onAccept: (value) {
                          setState(() {
                            drag3 = value;
                          });
                        },
                        builder: (_, candidateData, rejectedData) {
                          return Container(
                            width: 118,
                            height: 45,

                            alignment: Alignment.center,
                            child: drag3 != null
                                ? SvgPicture.asset(

                              drag3,
                              width: 118,
                              height: 45,
                            )
                                : Container(),
                          );
                        },
                      ),

                    ],
                  )
              ),
              Visibility(
                visible: !Visible&&correct,
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(Right),
                ),
              ),
              Visibility(
                visible: !Visible&&!correct,
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(Wrong),
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
                      Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => new F_2_3()));
                      print('Continuer');
                    },)
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
                visible: !Visible&&correct,
                child: Positioned(
                    height: size.width*0.45,
                    width: size.width*0.45,
                    left: size.width*0.29,
                    top:size.height*0.2,
                    child: SvgPicture.asset(bulleBravo)
                ),
              )
            ],
          ),
        ));
  }

}
