import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/BarreProgres.dart';
import 'package:somthn/Maths/I-M-2-1.dart';
import 'package:somthn/Maths/M-1-5-2ndAttempt.dart';
import 'package:somthn/Maths/M-2-2.dart';
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




class M_2_1_2nd_Four extends StatefulWidget {
  const M_2_1_2nd_Four({Key key}) : super(key: key);

  @override
  _M_2_1_2nd_FourState createState() => _M_2_1_2nd_FourState();
}
class _M_2_1_2nd_FourState extends State<M_2_1_2nd_Four> {
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
              if (user.avatar=="Pink")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.485,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:Image.asset('images/MadPink.gif'),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.46,
                    left: size.width*0.69,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:Image.asset('images/MadPurple.gif'),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.48,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child: Image.asset('images/MadOrange.gif'),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.485,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:Image.asset('images/MadBlue.gif'),
                  ),
                ),
              Positioned(
                top: size.height*0.2,
                left: size.width*0.2,
                height: size.width*0.6,
                width: size.width*0.6,
                child:SvgPicture.asset('assets/icons/M-2-Q-1-2.svg'),
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
                    top: size.height*0.82,
                    left: size.width*0.1,
                    height: size.width*0.2,
                    width: size.width*0.33,
                    child: QButton(onPressed: null,)
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.83,
                  left: size.width*0.18,
                  child: IconButton(
                    iconSize: 50,
                    onPressed: (){
                      print('frdv');
                      setState(() {
                        oneClicked = false;
                        twoClicked = false;
                        threeClicked = true;
                        fourClicked = false;
                      });},
                    icon: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '126',
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
                          MaterialPageRoute(builder: (context) => M_2_2()));
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
              ),
              Positioned(
                left: size.width*0.065,
                top:size.height*0.6,
                height: size.height*0.25,
                width:size.width*0.4,
                child: Visibility(
                    visible: (oneClicked&&Visible),
                    child: IconButton(
                        onPressed: (){
                          if (oneClicked)  {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => I_M_2_1_()));
                            print('Wrong');
                          }
                          print('1');
                        },
                        icon: SvgPicture.asset(quotes))
                ),
              ),
              Positioned(
                left: size.width*0.06,
                top:size.height*0.74,
                height: size.height*0.25,
                width:size.width*0.4,
                child: Visibility(
                    visible: (threeClicked&&Visible),
                    child: IconButton(
                        onPressed: (){
                          if (threeClicked)  {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => I_M_2_1_()));
                            print('Wrong');
                          }
                          print('3');
                        },
                        icon: SvgPicture.asset(quotes))
                ),
              ),
              Positioned(
                left: size.width*0.44,
                top:size.height*0.67,
                height: size.height*0.25,
                width:size.width*0.4,
                child: Visibility(
                    visible: (twoClicked && Visible),
                    child: IconButton(
                        onPressed: (){
                          if (twoClicked){
                            setState(() {
                              Visible = false;
                            });

                            print('Correct');
                          }
                          print('2');
                        },
                        icon: SvgPicture.asset(quotes))
                ),
              ),
            ],
          ),
        ));
  }

}

