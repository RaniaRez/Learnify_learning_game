import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/BarreProgres.dart';
import 'package:somthn/Maths/M-1-5-2ndAttempt.dart';
import 'package:somthn/Mutual/Niveau1Pass%C3%A9.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Bulles/bulleQuest.dart';
import 'package:somthn/Buttons/buttonContinuer.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/Buttons/buttonQ.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../WelcomePages/ChooseAvatar.dart';


class M_2_1 extends StatefulWidget {
  const M_2_1({Key key}) : super(key: key);

  @override
  _M_2_1State createState() => _M_2_1State();
}
class _M_2_1State extends State<M_2_1> {
  bool oneClicked = false;
  bool twoClicked = false;
  bool threeClicked = false;
  bool fourClicked = false;
  bool Visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/mathsBG.jpg"),
                      fit: BoxFit.cover)),
            ),
            Positioned(
                top: 50.00,
                left: 300.00,
                child:
                SettingsButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                  print("HELL YEAH");
                },)
            ),
            Positioned(
                top: 10.00,
                right: 250.00,
                child: BacksButton(onPressed: (){
                  Navigator.pop(context);
                },)
            ),

            Positioned(
                top: 70.00,
                right: 115.00,
                child: SvgPicture.asset(EmptyBar)),

            Visibility(
              visible: !Visible,
              child: Positioned(
                top: 70.00,
                right: 115.00,
                child: BarreProgres(),
              ),
            ),
           /* Visibility(
              visible: Visible,
              child: Positioned(
                bottom: 220.0,
                left: 300.00,
                child: GoToButton(onPressed: (){
                  setState(() {
                    if (twoClicked){
                      Visible = false;
                      print('Correct');
                    }else{
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => M_1_5_2nd()));
                      print('Wrong');
                    }
                  });
                  print("HELL YEAH");

                },),
              ),
            ),*/
            if (New.avatar=="Pink")
              Visibility(

                child: Positioned(
                  top: 480.0,
                  left: 280.0 ,
                  height: 130.0,
                  width: 130.0,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Purple")
              Visibility(

                child: Positioned(
                  top: 470.0,
                  left: 270.0 ,
                  height: 150.0,
                  width: 150.0,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Orange")
              Visibility(

                child: Positioned(
                  top: 480.0,
                  left: 285.0 ,
                  height: 130.0,
                  width: 130.0,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Blue")
              Visibility(

                child: Positioned(
                  top: 480.0,
                  left: 280.0 ,
                  height: 130.0,
                  width: 130.0,
                  child:BlueAvatarIcon(onPressed: null,),
                ),
              ),

            Positioned(
              top: 160.0,
              left: 40.0 ,
              height: 250,
              width: 250,
              child:BulleQuest(),
            ),
            Positioned(
              top : 260,
              left: 0.5,
              right: 80.5,
              child: SizedBox(
                height: 150,
                width:150,
                child: Text(
                  '28x5 = ?',
                  style: TextStyle(
                    fontFamily: 'Skranji-bold',
                    fontSize: 25,
                    color: Colors.brown[700],
                    fontWeight: FontWeight.bold,

                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 180.0,
                  left: 35.0,
                  width: 148,
                  height: 77,
                  child: QButton(onPressed:null,)
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                bottom: 187.0,
                left: 77.0,
                  child: IconButton(
                    iconSize: 50,
                    onPressed: (){
                      print('frdv');
                      setState(() {
                        oneClicked = true;
                        twoClicked = false;
                        threeClicked = false;
                        fourClicked = false;
                      });},
                    icon: Text(
                      '120',
                      style: TextStyle(
                        fontFamily: 'Skranji-bold',
                        fontSize: 25,
                        color: Colors.brown[700],
                        fontWeight: FontWeight.bold,

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 80.0,
                  left: 35.0,
                  width: 148,
                  height: 77,
                  child: QButton(onPressed: null,)
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                bottom: 86.0,
                right: 275.0,
                child: IconButton(
                  iconSize: 50,
                  onPressed: (){
                  setState(() {
                    twoClicked = true;
                    oneClicked = false;
                    threeClicked = false;
                    fourClicked = false;
                  });},
                  icon: Text(
                    '140',
                    style: TextStyle(
                      fontFamily: 'Skranji-bold',
                      fontSize: 25,
                      color: Colors.brown[700],
                      fontWeight: FontWeight.bold,

                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 150.0,
                  right: 35.0,
                  width: 148,
                  height: 77,
                  child: QButton(onPressed:null),
              ),
            ),

            Visibility(
              visible: Visible,
              child: Positioned(
                bottom: 157.0,
                left: 275.0,
                child: IconButton(
                  iconSize: 50,
                  onPressed: (){
                    setState(() {
                      threeClicked = true;
                      oneClicked = false;
                      twoClicked = false;
                      fourClicked = false;
                    });},
                  icon: Text(
                    '126',
                    style: TextStyle(
                      fontFamily: 'Skranji-bold',
                      fontSize: 25,
                      color: Colors.brown[700],
                      fontWeight: FontWeight.bold,

                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 50.0,
                  right: 35.0,
                  width: 148,
                  height: 77,
                  child: QButton(onPressed: null,)
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                bottom: 56.0,
                left: 275.0,
                child: IconButton(
                  iconSize: 50,
                  onPressed: (){
                    setState(() {
                      fourClicked = true;
                      oneClicked = false;
                      twoClicked = false;
                      threeClicked = false;
                    });},
                  icon: Text(
                    '146',
                    style: TextStyle(
                      fontFamily: 'Skranji-bold',
                      fontSize: 25,
                      color: Colors.brown[700],
                      fontWeight: FontWeight.bold,

                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !Visible,
              child: Positioned(
                  bottom: -30,
                  child: ButtonContinuer(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Niveau1Pass()));
                    print('Continuer');},)
              ),
            ),
            if (New.avatar=="Pink")
              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: 95,
                  right: 280.0 ,
                  height: 130.0,
                  width: 130.0,
                  child:Image.asset('images/HappyPink.gif'),
                ),
              ),
            if (New.avatar=="Purple")
              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: 100,
                  right: 260.0 ,
                  height: 150.0,
                  width: 150.0,
                  child:Image.asset('images/HappyPurple.gif'),
                ),
              ),
            if (New.avatar=="Orange")
              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: 95,
                  right: 280.0 ,
                  height: 130.0,
                  width: 130.0,
                  child: Image.asset('images/HappyOrange.gif'),
                ),
              ),
            if (New.avatar=="Blue")
              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: 95,
                  right: 280.0 ,
                  height: 130.0,
                  width: 130.0,
                  child:Image.asset('images/HappyBlue.gif'),
                ),
              ),
            Visibility(
              visible: !Visible,
              child: Positioned(
                  height: 200,
                  width: 200,
                  bottom: 60,
                  right: 60,
                  child: SvgPicture.asset(bulleBravo)
              ),
            )
          ],
        ));
  }

}
