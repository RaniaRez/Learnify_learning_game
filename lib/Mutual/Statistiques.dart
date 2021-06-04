
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import '../WelcomePages/Home.dart';
import '../Services/Login.dart';



class Stats extends StatefulWidget {


  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    String name = 'Nada';
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
                child: SettingsButton(onPressed: (){
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
                  print("HELL YEAH");
                  Navigator.pop(
                    context,
                  );
                },)
            ),
            Positioned(
              top: size.height*0.047,
              left: size.width*0.39,
              child: HomeButton(
                onPressed: (){
                  print("HELL YEAH");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),);

                },
              ),
            ),
            Positioned(
                height: size.height*0.55,
                width:size.width*0.6,
                top: size.height*0.03,
                left: size.width*0.1,
                child: SvgPicture.asset('assets/icons/bulle3e.svg')

            ),
            Positioned(
              top: size.height*0.76,
              left:size.width*0.05,
              child: SvgPicture.asset('assets/icons/scorefinaltx.svg'),

            ),
            Positioned(
                top: size.height*0.23,
                left:size.width*0.25,
                child: FittedBox(
              child: Text(
                'Salut $name \n voyons tes\nstatistique',
                    style: TextStyle(
                      fontFamily: 'Skranji-Bold',
                      color: Colors.brown[800],
                      fontSize: 24,
                    )
              ),
            )),
            Positioned(
              top:size.height*0.63,
              right:size.width*0.05,
              child: Container(
                height: 70,
                  width: 70,
                  child: GoToButton(onPressed: (){
                    print('math');
                  },)),
            ),
            Positioned(
              top:size.height*0.73,
              right:size.width*0.05,
              child: Container(
                  height: 70,
                  width: 70,
                  child: GoToButton(onPressed: (){
                    print('scorefinal');
                  },)),
            ),
            Positioned(
                top: size.height*0.46,
                left:size.width*0.04,
                child: SvgPicture.asset('assets/icons/Frtx.svg')

            ),
            Positioned(
                top: size.height*0.66,
                left:size.width*0.05,
                child: SvgPicture.asset('assets/icons/Mathtx.svg')

            ),
            Positioned(
              top:size.height*0.44,
              right:size.width*0.05,
              child: Container(
                  height: 70,
                  width: 70,
                  child: GoToButton(onPressed: (){
                    print('fr');
                  },)),
            ),
            Positioned(
                top: size.height*0.56,
                left:size.width*0.05,
                child: SvgPicture.asset('assets/icons/Geotx.svg')
            ),

            Positioned(
              top:size.height*0.53,
              right:size.width*0.05,
              child: Container(
                  height: 70,
                  width: 70,
                  child: GoToButton(onPressed: (){
                    print('geo');
                  },)),
            ),
            if (user.avatar=="Pink")
              Visibility(

                child: Positioned(
                  top: size.height*0.27,
                  left:size.width*0.73,
                  height: size.height*0.25,
                  width: size.width*0.25,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Purple")
              Visibility(

                child: Positioned(
                  top: size.height*0.255,
                  left:size.width*0.7,
                  height: size.height*0.3,
                  width: size.width*0.3,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Orange")
              Visibility(
                child: Positioned(
                  top: size.height*0.285,
                  left:size.width*0.73,
                  height: size.height*0.25,
                  width: size.width*0.25,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Blue")
              Visibility(

                child: Positioned(
                  top: size.height*0.275,
                  left:size.width*0.73,
                  height: size.height*0.25,
                  width: size.width*0.25,
                  child:BlueAvatarIcon(onPressed: null,),
                ),
              ),
          ],
        ),
      ),

    );

  }
}


