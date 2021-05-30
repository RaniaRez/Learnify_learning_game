import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/Maths/BienvenueMath.dart';
import 'package:somthn/Maths/M-2.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Mutual/Stars.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import '../WelcomePages/Home.dart';
import '../WelcomePages/ChooseAvatar.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../Services/Login.dart';
import '../Services/SignUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'BienvenueMath.dart';
import 'M-1.dart';

class Niveau1Pass extends StatefulWidget {
  @override
  _Niveau1PassState createState() => _Niveau1PassState();
}

class _Niveau1PassState extends State<Niveau1Pass> {
  @override




  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    /*print("khra2");
    print(scoreM.niv1);
    print("khra2");
    Firestore.instance.collection('users').document(user.uid).collection('domains').document('maths').updateData({'niv1':scoreM.niv1});*/
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Math1() ));
                },)
            ),
            Positioned(
              top: size.height*0.047,
              left: size.width*0.39,
              child: HomeButton(
                onPressed: (){
                  //print("zbel2");
                  print("HELL YEAH8");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),);

                },
              ),
            ),
            Positioned(
              top: size.height*0.65,
              right: size.width*0.45,
              child:StarIcon(),
            ),
            if (user.avatar=="Pink")
              Visibility(

                child: Positioned(
                  top: size.height*0.48,
                  right: size.width*0.58,
                  height: size.height*0.3,
                  width: size.width*0.3,
                  child:Transform.rotate(
                      angle: 6,
                      child: PinkAvatarIcon(onPressed: null,)),
                ),
              ),
            if (user.avatar=="Purple")
              Visibility(

                child: Positioned(
                  top: size.height*0.46,
                  right: size.width*0.56,
                  height: size.height*0.35,
                  width: size.width*0.35,
                  child:Transform.rotate(
                      angle: 6,
                      child: PurpleAvatarIcon(onPressed: null,)),
                ),
              ),
            if (user.avatar=="Orange")
              Visibility(

                child: Positioned(
                  top: size.height*0.49,
                  right: size.width*0.58,
                  height: size.height*0.3,
                  width: size.width*0.3,
                  child: Transform.rotate(
                    angle: 6,
                      child: OrangeAvatarIcon(onPressed: null,)),
                ),
              ),
            if (user.avatar=="Blue")
            Positioned(
              top: size.height*0.48,
              right: size.width*0.58,
              height: size.height*0.3,
              width: size.width*0.3,
                  child: Transform.rotate
                    (
                     angle:6,
                      child: BlueAvatarIcon(onPressed: null,)),
                ),


            Positioned(
              top: size.height*0.2,
              right: size.width*0.2,
              height: size.height*0.4,
              width: size.width*0.6,
              child:SvgPicture.asset(bulleNiveauPasse),
            ),

            Positioned(
              top: size.height*0.83,
              left: size.width*0.7 ,
              child: GoToButton(onPressed: (){
                print(scoreM.niv1);
                print('khra');
                //Firestore.instance.collection('users').document(user.uid).collection('domains').document('maths').updateData({'niv1':scoreM.niv1});
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Math2()));
                }),
            ),

          ],
        ),
      ),
    );
  }
}
