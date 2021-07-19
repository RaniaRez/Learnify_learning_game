import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/WelcomePages/ChoixDomaines.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/WelcomePages/Voila.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'Home.dart';
import 'Settings.dart';
import '../Branches/BranchIconSimple.dart';
import '../Services/Login.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';




class AllSet extends StatefulWidget {
  @override
  _AllSetState createState() => _AllSetState();
}

class _AllSetState extends State<AllSet> {

  AudioPlayer advancedPlayer;


  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/pret.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body:
      Container(
        height:size.height,
        width:size.width,
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
                  right:size.width*0.75,

                  child: BacksButton(onPressed: ()async {
                    int result = await advancedPlayer?.pause();
                    print("u clicked me");
                    Navigator.pop(context);
                  },)
              ),
              Positioned(
                top: size.height*0.047,
                left: size.width*0.39,

                child: HomeButton(
                  onPressed: () async {
                    int result = await advancedPlayer?.pause();

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Voila()),);

                  },
                ),
              ),
              Positioned(
                  top:size.height*0.05,
                  left:size.width*0.75,
                  child: SettingsButton(onPressed: () async {
                    int result = await advancedPlayer?.pause();

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("settings");
                  },)
              ),
              Positioned(
                  top: size.height*0.1,
                  left: size.width*0.25 ,
                  height: size.height*0.6,
                  width: size.width*0.7,
                  child: SvgPicture.asset('assets/icons/Attache.svg')),

              Visibility(

                child: Positioned(
                  top: size.height*0.62,
                  right: size.width*0.62 ,
                  child:BranchIconSimple(),
                ),
              ),
             if (user.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    top: size.height*0.45,
                    right: size.width*0.63 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    top: size.height*0.43,
                    right: size.width*0.63 ,
                    height: size.height*0.35,
                    width: size.width*0.35,

                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    top: size.height*0.46,
                    right: size.width*0.63 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
             if (user.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    top: size.height*0.45,
                    right: size.width*0.63 ,
                    height: size.height*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

              Positioned(
                top: size.height*0.83,
                left: size.width*0.7 ,
                child: GoToButton(onPressed: () async {
                  int result = await advancedPlayer?.pause();
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (BuildContext context) => ChoixDomaine()));
                  }),
              ),
            ]
        ),
      ),
    );

  }
}
