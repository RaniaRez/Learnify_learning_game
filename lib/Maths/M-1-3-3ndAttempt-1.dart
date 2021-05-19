import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Maths/M-1-2-2ndAttempt.dart';
import 'package:somthn/Maths/M-1-4.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Bulles/bulleQuest.dart';
import 'package:somthn/Buttons/button0.dart';
import 'package:somthn/Buttons/button1.dart';
import 'package:somthn/Buttons/button2.dart';
import 'package:somthn/Buttons/button3.dart';
import 'package:somthn/Buttons/button4.dart';
import 'package:somthn/Buttons/button5.dart';
import 'package:somthn/Buttons/button6.dart';
import 'package:somthn/Buttons/button7.dart';
import 'package:somthn/Buttons/button8.dart';
import 'package:somthn/Buttons/button9.dart';
import 'package:somthn/Buttons/buttonContinuer.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/Buttons/buttonQ.dart';
import 'package:somthn/Buttons/buttonReset.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
//import '../WelcomePages/ChooseAvatar.dart';
import '../Services/Login.dart';
import '../Services/SignUp.dart';


class M_1_3_3rd_1 extends StatefulWidget {
  const M_1_3_3rd_1({Key key}) : super(key: key);

  @override
  _M_1_3_3rd_1State createState() => _M_1_3_3rd_1State();
}

class _M_1_3_3rd_1State extends State<M_1_3_3rd_1> {
  bool oneD = false;
  bool oneU = false;
  bool twoD = false;
  bool twoU = false;
  bool threeD = false;
  bool threeU = false;
  bool fourD = false;
  bool fourU = false;
  bool fiveD = false;
  bool fiveU = false;
  bool sixD = false;
  bool sixU = false;
  bool sevenD = false;
  bool sevenU = false;
  bool eightD = false;
  bool eightU = false;
  bool nineD = false;
  bool nineU = false;
  bool zeroD = false;
  bool zeroU = false;
  bool First = false;
  bool all = false;
  bool Visible = true;
  bool correct = false;
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
                child: SvgPicture.asset(TwoBars)),

            Visibility(
              visible: !Visible,
              child: Positioned(
                top: 70.00,
                right: 115.00,
                child: SvgPicture.asset(ThreeBars),
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                bottom: 220.0,
                left: 300.00,
                child: GoToButton(onPressed: (){
                  setState(() {
                    if ((twoU) && (eightD)){
                      Visible = false;
                      correct = true;
                      print('Correct');
                    }else{
                      Visible=false;
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => M_1_2_2nd()));
                      print('Wrong');
                    }
                  });
                  print("HELL YEAH");

                },),
              ),
            ),
            if (user.avatar=="Pink")
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: 480.0,
                  left: 280.0 ,
                  height: 130.0,
                  width: 130.0,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Purple")
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: 470.0,
                  left: 270.0 ,
                  height: 150.0,
                  width: 150.0,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Orange")
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: 480.0,
                  left: 285.0 ,
                  height: 130.0,
                  width: 130.0,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Blue")
              Visibility(
                visible: Visible,
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
              left: 10.5,
              right: 80.5,
              child: SizedBox(
                height: 150,
                width:150,
                child: Text(
                  'Double de 41 = ?',
                  style: TextStyle(
                    fontFamily: 'Skranji-bold',
                    fontSize: 22,
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
                bottom: 235.0,
                left: 10,
                child: ButtonReset(
                    onPressed: () {
                      setState(() {
                        oneD = false;
                        oneU = false;
                        twoD = false;
                        twoU = false;
                        threeD = false;
                        threeU = false;
                        fourD = false;
                        fourU = false;
                        fiveD = false;
                        fiveU = false;
                        sixD = false;
                        sixU = false;
                        sevenD = false;
                        sevenU = false;
                        eightD = false;
                        eightU = false;
                        nineD = false;
                        nineU = false;
                        zeroD = false;
                        zeroU = false;
                        First = false;
                        all = false;
                      });
                      print('reset');
                    }

                ),
              ),
            ),
            Positioned(
                bottom: 240.0,
                left: 125.0,
                width: 148,
                height: 77,
                child: QButton(onPressed: null,)
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 140,
                  left: 10,
                  child: Button_0(onPressed: (){
                    setState(() {
                      if(all){

                      }else if(First){
                        zeroU = true;
                        all = true;
                      }else {
                        zeroD = true;
                        First = true;
                      }
                    });
                  },)
              ),
            ),

            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 140,
                  left: 90,
                  child: Button_1(onPressed: (){
                    setState(() {
                      if(all){

                      }else if(First){
                        oneU = true;
                        all = true;
                      }else {
                        oneD = true;
                        First = true;
                      }
                    });
                  },)
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 140,
                  left: 170,
                  child: Button_2(onPressed: (){
                    setState(() {
                      if(all){

                      }else if(First){
                        twoU = true;
                        all = true;
                      }else {
                        twoD = true;
                        First = true;
                      }
                    });
                  },)
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 140,
                  left: 250,
                  child: Button_3(onPressed: (){
                    setState(() {
                      if(all){

                      }else if(First){
                        threeU = true;
                        all = true;
                      }else {
                        threeD = true;
                        First = true;
                      }
                    });
                  },)
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 140,
                  left: 330,
                  child: Button_4(onPressed: (){
                    setState(() {
                      if(all){

                      }else if(First){
                        fourU = true;
                        all = true;
                      }else {
                        fourD = true;
                        First = true;
                      }
                    });
                  },)
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 60,
                  left: 10,
                  child: Button_5(onPressed: (){
                    setState(() {
                      if(all){

                      }else if(First){
                        fiveU = true;
                        all = true;
                      }else {
                        fiveD = true;
                        First = true;
                      }
                    });
                  },)
              ),
            ),

            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 60,
                  left: 90,
                  child: Button_6(onPressed: (){
                    setState(() {
                      if(all){

                      }else if(First){
                        sixU = true;
                        all = true;
                      }else {
                        sixD = true;
                        First = true;
                      }
                    });
                  },)
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 60,
                  left: 170,
                  child: Button_7(onPressed: (){
                    setState(() {
                      if(all){

                      }else if(First){
                        sevenU = true;
                        all = true;
                      }else {
                        sevenD = true;
                        First = true;
                      }
                    });
                  },)
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 60,
                  left: 250,
                  child: Button_8(onPressed: (){
                    setState(() {
                      if(all){

                      }else if(First){
                        eightU = true;
                        all = true;
                      }else {
                        eightD = true;
                        First = true;
                      }
                    });
                  },)
              ),
            ),
            Visibility(
              visible: Visible,
              child: Positioned(
                  bottom: 60,
                  left: 330,
                  child: Button_9(onPressed: (){
                    setState(() {
                      if(all){

                      }else if(First){
                        nineU= true;
                        all = true;
                      }else {
                        nineD = true;
                        First = true;
                      }
                    });
                  },)
              ),
            ),
            //DebutAnswers
            Visibility(
              visible: zeroD,
              child: Positioned(
                  bottom: 245,
                  left: 140,
                  child: Button_0(onPressed: null,)
              ),
            ),
            Visibility(
              visible: zeroU,
              child: Positioned(
                  bottom: 245,
                  left: 192,
                  child: Button_0(onPressed: null,)
              ),
            ),
            Visibility(
              visible: oneD,
              child: Positioned(
                  bottom: 245,
                  left: 140,
                  child: Button_1(onPressed: null,)
              ),
            ),
            Visibility(
              visible: oneU,
              child: Positioned(
                  bottom: 245,
                  left: 192,
                  child: Button_1(onPressed: null,)
              ),
            ),
            Visibility(
              visible: twoD,
              child: Positioned(
                  bottom: 245,
                  left: 140,
                  child: Button_2(onPressed: null,)
              ),
            ),
            Visibility(
              visible: twoU,
              child: Positioned(
                  bottom: 245,
                  left: 192,
                  child: Button_2(onPressed: null,)
              ),
            ),
            Visibility(
              visible: threeD,
              child: Positioned(
                  bottom: 245,
                  left: 140,
                  child: Button_3(onPressed: null,)
              ),
            ),
            Visibility(
              visible: threeU,
              child: Positioned(
                  bottom: 245,
                  left: 192,
                  child: Button_3(onPressed: null,)
              ),
            ),
            Visibility(
              visible: fourD,
              child: Positioned(
                  bottom: 245,
                  left: 140,
                  child: Button_4(onPressed: null,)
              ),
            ),
            Visibility(
              visible: fourU,
              child: Positioned(
                  bottom: 245,
                  left: 192,
                  child: Button_4(onPressed: null,)
              ),
            ),
            Visibility(
              visible: fiveD,
              child: Positioned(
                  bottom: 245,
                  left: 140,
                  child: Button_5(onPressed: null,)
              ),
            ),
            Visibility(
              visible: fiveU,
              child: Positioned(
                  bottom: 245,
                  left: 192,
                  child: Button_5(onPressed: null,)
              ),
            ),
            Visibility(
              visible: sixD,
              child: Positioned(
                  bottom: 245,
                  left: 140,
                  child: Button_6(onPressed: null,)
              ),
            ),
            Visibility(
              visible: sixU,
              child: Positioned(
                  bottom: 245,
                  left: 192,
                  child: Button_6(onPressed: null,)
              ),
            ),
            Visibility(
              visible: sevenD,
              child: Positioned(
                  bottom: 245,
                  left: 140,
                  child: Button_7(onPressed: null,)
              ),
            ),
            Visibility(
              visible: sevenU,
              child: Positioned(
                  bottom: 245,
                  left: 192,
                  child: Button_7(onPressed: null,)
              ),
            ),
            Visibility(
              visible: eightD,
              child: Positioned(
                  bottom: 245,
                  left: 140,
                  child: Button_8(onPressed: null,)
              ),
            ),
            Visibility(
              visible: eightU,
              child: Positioned(
                  bottom: 245,
                  left: 192,
                  child: Button_8(onPressed: null,)
              ),
            ),
            Visibility(
              visible: nineD,
              child: Positioned(
                  bottom: 245,
                  left: 140,
                  child: Button_9(onPressed: null,)
              ),
            ),
            Visibility(
              visible: nineU,
              child: Positioned(
                  bottom: 245,
                  left: 192,
                  child: Button_9(onPressed: null,)
              ),
            ),
            Visibility(
              visible: !Visible,
              child: Positioned(
                  bottom: -30,
                  child: ButtonContinuer(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => M_1_4()));
                    print('Continuer');},)
              ),
            ),
            if (correct)
              Stack(
                children: <Widget>[
                  Visibility(
                    visible: !Visible,
                    child: Positioned(
                        bottom: 255,
                        left:50,
                        child: SvgPicture.asset(Right)
                    ),
                  ),
                  if (user.avatar=="Pink")
                    Visibility(
                      visible: !Visible,
                      child: Positioned(
                        bottom: 95,
                        right: 280.0 ,
                        height: 130.0,
                        width: 130.0,
                        child: Image.asset('images/HappyPink.gif'),
                      ),
                    ),
                  if (user.avatar=="Purple")
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
                  if (user.avatar=="Orange")
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
                  if (user.avatar=="Blue")
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
                ],
              ),
            if (!correct)
              Stack(
                children:[
                  Visibility(
                    visible: !Visible,
                    child: Positioned(
                        bottom: 255,
                        left:50,
                        child: SvgPicture.asset(Wrong)
                    ),
                  ),
                  if (user.avatar=="Pink")
                    Visibility(
                      visible: !Visible,
                      child: Positioned(
                        bottom: 95,
                        right: 280.0 ,
                        height: 130.0,
                        width: 130.0,
                        child: Image.asset('images/MadPink.gif'),
                      ),
                    ),
                  if (user.avatar=="Purple")
                    Visibility(
                      visible: !Visible,
                      child: Positioned(
                        bottom: 100,
                        right: 260.0 ,
                        height: 150.0,
                        width: 150.0,
                        child:Image.asset('images/MadPurple.gif'),
                      ),
                    ),
                  if (user.avatar=="Orange")
                    Visibility(
                      visible: !Visible,
                      child: Positioned(
                        bottom: 95,
                        right: 280.0 ,
                        height: 130.0,
                        width: 130.0,
                        child: Image.asset('images/MadOrange.gif'),
                      ),
                    ),
                  if (user.avatar=="Blue")
                    Visibility(
                      visible: !Visible,
                      child: Positioned(
                        bottom: 95,
                        right: 280.0 ,
                        height: 130.0,
                        width: 130.0,
                        child:Image.asset('images/MadBlue.gif'),
                      ),
                    ),
                ],
              ),
          ],
        ));
  }

}
