import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Francais/testNiv/TestNivFrQ1.dart';
//import 'package:somthn/Francais/F-1.dart';
import 'package:somthn/Geographie/TestNiv/BienvenueTest.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonContinuer.dart';
import 'package:somthn/myicons.dart';
import '../../Buttons/settingsButton.dart';
import '../../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../../Services/Login.dart';
import 'package:somthn/Francais/testNiv/TestNivFrQ2.dart';
import 'TestGeo.dart';
import 'TestGeo3.dart';
import '../BienvenueGeo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'SetNiveaux.dart';
import 'TestGeo1.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';



class TestGeo2 extends StatefulWidget {
  const TestGeo2({Key key}) : super(key: key);

  @override
  _TestGeo2State createState() => _TestGeo2State();
}

class _TestGeo2State extends State<TestGeo2> {
  var player = AudioCache();
  var player2 = AudioPlayer ();
  bool Visible = true;
  bool correct = false;
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
                        image: AssetImage("images/geo_BG.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: size.height*0.05,
                  left:size.width*0.75,
                  child:
                  SettingsButton(onPressed: (){
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestNiveau()));
                  },)
              ),
              if (user.avatar=="Pink")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.4,
                    left: size.width*0.65,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.4,
                    left: size.width*0.6,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.4,
                    left: size.width*0.65,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.4,
                    left: size.width*0.65,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),
              Positioned(
                top: size.height*0.17,
                left: size.width*0.1,
                height: size.width*0.5,
                width: size.width*0.6,
                child:SvgPicture.asset('assets/icons/BulleTestGeo2.svg'),
              ),

              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.5,
                  left: size.width*0.05,
                  height: size.height*0.15,
                  width: size.width*0.53,
                  child: IconButton(
                      onPressed: ()async{
                        setState(() {
                          Visible=false;
                          correct=true;
                          testG.q2=true ;
                        });
                        player2 =  await player.play('audio/winning.mp3');
                        print('int');
                      },
                      icon: SvgPicture.asset('assets/icons/Bahia.svg')),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.6,
                  right: size.width*0.05,
                  height: size.height*0.15,
                  width: size.width*0.55,
                  child: IconButton(
                    onPressed: () async{
                      setState(() {
                        Visible = false;
                      });
                      player2 =  await player.play('audio/losing.wav');
                    },
                    icon: SvgPicture.asset('assets/icons/Mahroussa.svg'),
                  ),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.8,
                  right: size.width*0.05,
                  height: size.height*0.15,
                  width: size.width*0.55,
                  child: IconButton(
                    onPressed: () async{
                      setState(() {
                        Visible = false;
                      });
                      player2 =  await player.play('audio/losing.wav');
                    },
                    icon: SvgPicture.asset('assets/icons/Beida.svg'),
                  ),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.7,
                  left: size.width*0.05,
                  height: size.height*0.15,
                  width: size.width*0.55,
                  child: IconButton(
                      onPressed: ()async{
                        setState(() {
                          Visible=false;
                        });
                        player2 =  await player.play('audio/losing.wav');
                        print('exc');
                      },
                      icon: SvgPicture.asset('assets/icons/Bahdja.svg')),
                ),
              ),
              if (correct)
                Visibility(
                  visible: !Visible,
                  child: Positioned(
                    top: size.height*0.53,
                    left: size.width*0.24,
                    height: size.height*0.15,
                    width: size.width*0.52,
                    child: IconButton(
                        onPressed: (){
                          setState(() {
                            Visible=false;
                            correct=true;
                          });
                          print('int');
                        },
                        icon: SvgPicture.asset('assets/icons/Bahia.svg')),
                  ),
                ),
              if (correct)
                Stack(
                  children: <Widget>[
                    Visibility(
                      visible: !Visible,
                      child: Positioned(
                          left: size.width*0.45,
                          top:size.height*0.45,
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
              Visibility(
                visible: !Visible,
                child: Positioned(
                    top: size.height*0.8,
                    left: 0.0,
                    height: size.height*0.2,
                    width: size.width*0.5,
                    child: ButtonContinuer(onPressed: (){

                      //test.q1=true ;
                      /* print(scoreF.niv1);
                      print(scoreF.niv2);
                      print(scoreF.niv3);
                      setNiv(test,scoreF);
                      Firestore.instance.collection('users').document(user.uid).collection('domains').document('maths').updateData(
                          {
                            'testFait': scoreF.testFait ,
                            'niv1': scoreF.niv1 ,
                            'niv2': scoreF.niv2 ,
                            'niv3': scoreF.niv3 ,
                          }
                      );*/

                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestGeo3()));//
                      print('Continuer');},)
                ),
              ),
              if (!correct)
                Stack(
                  children:[
                    Visibility(
                      visible: !Visible,
                      child: Positioned(
                          left: size.width*0.45,
                          top:size.height*0.6,
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