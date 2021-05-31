
import 'package:flutter/material.dart';
import 'package:somthn/WelcomePages/Vite.dart';
import 'package:somthn/WelcomePages/Voila.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/ButtonAllons-y.dart';
import '../Bulles/BulleIcon.dart';
import 'Users.dart';
import 'Settings.dart';
//for backend
import '../Services/Login.dart';
import '../Services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Maths/Niveau1Passé.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /*AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;
  String filePath = 'music.mp3';

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;

  /// Optional
  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          value: (timeProgress / 1000).floorToDouble(),
          max: (audioDuration / 1000).floorToDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  @override
  void initState() {
    super.initState();

    /// Compulsory
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });

    /// Optional
    audioPlayer.onAudioPositionChanged.listen((Duration p) async {
      setState(() {
        timeProgress = p.inMilliseconds;
      });
    });
  }

  /// Compulsory
  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
    super.dispose();
  }

  /// Compulsory
  playMusic() async {
    await audioCache.play(filePath);
  }

  /// Compulsory
  pauseMusic() async {
    await audioPlayer.pause();
  }
*/

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
                        image: AssetImage("images/forestbackground.jpg"),
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
                        //MaterialPageRoute(builder: (context) => Niveau1Pass()));
                    print("settings");
                  },)
              ),


              Positioned(
                  top: size.height*0.55,
                  right : size.height*0.1,
                  height: size.height*0.6,
                  width: size.width*0.6,
                  child: ButtonAllonsy(onPressed: () async {
                    await googleLogin();
                    print("khraconnecter");
                    print(user.uid);
                    print("user exists2");
                    String documentID= user.uid;
                    var d= await Firestore.instance.collection('users').document(documentID).get();
                    print("user exists1");
                    if (d.exists ){
                      user.username=d.data["name"];
                      user.avatar=d.data["avatar"];
                      user.score=d.data["score"];
                      print("user exists");
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Voila()));
                    }

                    else {
                      print("does not exist ");
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Vite()));
                    }
                    print("user exists3");
                    print("allons-y");
                  } )),


              Positioned(
                top: size.height*0.001,
                right: size.width*0.2,
                child: Container(
                  height: size.height*0.6,
                  width: size.width*0.8,
                  child: Image.asset('images/OWL.gif'),
                ),
              ),
              Positioned(
                top: size.height*0.2,
                left: size.width*0.3 ,
                height: size.height*0.6,
                width: size.width*0.7,
                child:BulleIcon(onPressed: (){}),
              ),
            ]
        ),
      ),
    );

  }
}
