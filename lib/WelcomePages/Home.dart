
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:somthn/WelcomePages/Vite.dart';
import 'package:somthn/WelcomePages/Voila.dart';
import 'package:somthn/WelcomePages/custom_dialog_box.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/ButtonAllons-y.dart';
import '../Bulles/BulleIcon.dart';
import 'Settings.dart';
import '../Services/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
/*import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:somthn/music.dart';*/





class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {

  AudioPlayer advancedPlayer;


  /*AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer();
    _assetsAudioPlayer.open(
      AssetsAudio(
        asset: "music.mp3",
        folder: "assets/audio/",
      ),
    );
    _assetsAudioPlayer.playOrPause();
  }

  @override
  void dispose() {
    _assetsAudioPlayer = null;
    super.dispose();
  }*/

  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().loop("audio/music.mp3");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }
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
                  top: size.height*0.55,
                  right : size.height*0.1,
                  height: size.height*0.6,
                  width: size.width*0.6,
                  child: ButtonAllonsy(onPressed: () async {
                    int result = await advancedPlayer.pause();

                    await googleLogin();
                    print(user.uid);
                    String documentID= user.uid;
                    var d= await Firestore.instance.collection('users').document(documentID).get();
                    if (d.exists ){
                      user.username=d.data["name"];
                      user.avatar=d.data["avatar"];
                      user.score=d.data["score"];
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Voila()));
                    }

                    else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Vite()));
                    }
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
              Positioned(
                  top: size.height*0.05,
                  left:size.width*0.75,
                  child:
                  SettingsButton(onPressed: () {
                    print('s');
                    // advancedPlayer = await Settings();

                    //  Navigator.push(
                    //    context,
                    //   MaterialPageRoute(builder: (context) => Settings(value: advancedPlayer )));
                  },)
              ),
            ]
        ),
      ),
    );

  }
}
