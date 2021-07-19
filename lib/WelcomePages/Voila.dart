import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Branches/BranchIconSimple.dart';
import 'package:somthn/Statistics/Statistiques.dart';
import 'package:somthn/WelcomePages/ChoixDomaines.dart';
import 'package:somthn/Buttons/ClassementButton.dart';
import 'package:somthn/WelcomePages/Home.dart';
import 'package:somthn/classement/Classement.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import '../Buttons/buttonGoTo.dart';
import '../Buttons/buttonStatistique.dart';
import '../Data/DataUser.dart';
import '../classement/methodes.dart';
import '../classement/Classement.dart';
import '../Services/Login.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
class Voila extends StatefulWidget {
  @override
  _VoilaState createState() => _VoilaState();
}

class _VoilaState extends State<Voila> {

  AudioPlayer advancedPlayer;


  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {
    advancedPlayer = await AudioCache().play("audio/pret.wav");
    print("mdrr");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }

  @override
  bool _isVisible = false;

  void show() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
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
                child: SettingsButton(onPressed: () async {
                  await advancedPlayer?.pause();

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },)
            ),

            Positioned(
                top: size.height*0.05,
                right:size.width*0.75,
                child: BacksButton(onPressed: () async {
                  await advancedPlayer?.pause();

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()));
                },)
            ),
            Positioned(
              top: size.height*0.05,
              left: size.width*0.4,
              child: ClassementButton(onPressed: ()  async {
                int result = await advancedPlayer?.pause();

                List<DataUser> list = new List<DataUser>.empty(growable: true);
                list = await classement();
                list.sort((a, b) => b.score.compareTo(a.score));

                print(list[0].score);
                print(list[1].score);
                print(list[2].score);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Classement(value : list )));
              }),
            ),
            Positioned(
              top: size.height*0.25,
              left: size.width*0.2,
              height: size.height*0.35,
              width: size.width*0.7,
              child:SvgPicture.asset('assets/icons/bulleVoila.svg'),

            ),
            Positioned(
              top: size.height*0.8,
              left:size.width*0.75,
                child: GoToButton(onPressed: () async {
                  int result = await advancedPlayer?.pause();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChoixDomaine()),);
                },),
              ),

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
              top: size.height*0.8,
              right:size.width*0.75,
              child: StatistiqueButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Stats()));
              },),

            ),
          ],
        ),
      ),
    );
  }
}


