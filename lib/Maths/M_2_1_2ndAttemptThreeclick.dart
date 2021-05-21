import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/BarreProgres.dart';
import 'package:somthn/Maths/I-M-2-1.dart';
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
import '../Services/Login.dart';




class M_2_1_2nd_Three extends StatefulWidget {
  const M_2_1_2nd_Three({Key key}) : super(key: key);

  @override
  _M_2_1_2nd_ThreeState createState() => _M_2_1_2nd_ThreeState();
}
class _M_2_1_2nd_ThreeState extends State<M_2_1_2nd_Three> {
  bool oneClicked = false;
  bool twoClicked = false;
  bool threeClicked = false;
  bool fourClicked = false;
  bool Visible = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        child: Scaffold(
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
                  top: size.height*0.05,
                  right:size.width*0.75,

                  child: BacksButton(onPressed: (){
                    print("u clicked me");
                    Navigator.pop(context);
                  },)
              ),

              Positioned(
                  top:size.height*0.05,
                  left:size.width*0.75,
                  child: SettingsButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("settings");
                  },)
              ),

              Positioned(
                bottom: size.height*0.88,
                left: size.width*0.275,
                right: size.width*0.275,
                child: SvgPicture.asset(EmptyBar),
              ),

              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: BarreProgres(),
                ),
              ),
              Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.6,
                    left: size.width*0.75,
                    child: GoToButton(onPressed: (){
                      setState(() {
                        if (twoClicked){
                          Visible = false;
                          print('Correct');
                        }
                        if (oneClicked)  {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>I_M_2_1_ ()));
                          print('Wrong');
                        }
                        if (threeClicked)  {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => I_M_2_1_()));
                          print('Wrong');
                        }
                        if (fourClicked)  {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => I_M_2_1_()));
                          print('Wrong');
                        }


                      });
                      print("HELL YEAH");

                    },),
                  )),
              if (user.avatar=="Pink")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.5,
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
                    top: size.height*0.49,
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
                    top: size.height*0.5,
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
                    top: size.height*0.5,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),
              Positioned(
                top: size.height*0.2,
                left: size.width*0.2,
                height: size.width*0.6,
                width: size.width*0.6,
                child:BulleQuest(),
              ),
              Positioned(
                top: size.height*0.32,
                left: size.width*0.26,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    '2eme tentative \n 28*5= ?',
                    style:TextStyle(
                      fontSize: 25,
                      fontFamily: 'Skranji-Bold',
                      fontWeight: FontWeight.bold,
                      color:Colors.brown[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              ),
              Visibility(
                visible:!Visible,
                child: Positioned(
                    top: size.height*0.61,
                    left: size.width*0.33,
                    height: size.width*0.2,
                    width: size.width*0.33,
                    child: QButton(onPressed: null,)
                ),
              ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                  top: size.height*0.62,
                  left: size.width*0.42,
                  child: IconButton(
                    iconSize: 50,
                    onPressed: (){
                      print('frdv');
                      setState(() {
                        oneClicked = false;
                        twoClicked = true;
                        threeClicked = false;
                        fourClicked = false;
                      });},
                    icon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '140',
                        style:TextStyle(
                          fontSize: 30,
                          fontFamily: 'Skranji-Bold',
                          fontWeight: FontWeight.bold,
                          color:Colors.brown[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible:Visible,
                child: Positioned(
                    top: size.height*0.67,
                    left: size.width*0.1,
                    height: size.width*0.2,
                    width: size.width*0.33,
                    child: QButton(onPressed: null,)
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.68,
                  left: size.width*0.17,
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
                    icon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '120',
                        style:TextStyle(
                          fontSize: 30,
                          fontFamily: 'Skranji-Bold',
                          fontWeight: FontWeight.bold,
                          color:Colors.brown[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                    top: size.height*0.75,
                    left: size.width*0.48,
                    height: size.width*0.2,
                    width: size.width*0.33,
                    child: QButton(onPressed: null,)
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.76,
                  left: size.width*0.57,
                  child: IconButton(
                    iconSize: 50,
                    onPressed: (){
                      print('frdv');
                      setState(() {
                        oneClicked = false;
                        twoClicked = true;
                        threeClicked = false;
                        fourClicked = false;
                      });},
                    icon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '140',
                        style:TextStyle(
                          fontSize: 30,
                          fontFamily: 'Skranji-Bold',
                          fontWeight: FontWeight.bold,
                          color:Colors.brown[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                    top: size.height*0.89,
                    left: size.width*0.48,
                    height: size.width*0.2,
                    width: size.width*0.33,
                    child: QButton(onPressed: null,)
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.9,
                  left: size.width*0.56,
                  child: IconButton(
                    iconSize: 50,
                    onPressed: (){
                      print('frdv');
                      setState(() {
                        oneClicked = false;
                        twoClicked = false;
                        threeClicked = false;
                        fourClicked = true;
                      });},
                    icon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '146',
                        style:TextStyle(
                          fontSize: 30,
                          fontFamily: 'Skranji-Bold',
                          fontWeight: FontWeight.bold,
                          color:Colors.brown[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Niveau1Pass()));
                      print('Continuer');},)
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
            ],
          ),
        ));
  }

}

