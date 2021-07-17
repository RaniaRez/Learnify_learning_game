
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Branches/BranchIconSimple.dart';
import 'package:somthn/WelcomePages/Voila.dart';
import 'package:somthn/modification/avatar.dart';
import 'package:somthn/modification/name.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonModifyAvatar.dart';
import 'package:somthn/Buttons/buttonModifyNom.dart';
import 'package:somthn/Buttons/buttonSuppProfile.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import '../WelcomePages/Home.dart';
import '../Services/Login.dart';
import '../Services/SignUp.dart';
import '../Services/delete.dart';



class Userinfo extends StatefulWidget {


  @override
  _UserinfoState createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
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
                    MaterialPageRoute(builder: (context) =>Voila()),);

                },
              ),
            ),
            Positioned(
              top: size.height*0.25,
              right:size.width*0.65,
              height: size.height*0.2,
              width: size.width*0.35,
                child:BranchIconSimple(),
              ),
            if (user.avatar=="Pink")
              Visibility(

                child: Positioned(
                  top: size.height*0.12,
                  right:size.width*0.65,
                  height: size.height*0.3,
                  width: size.width*0.3,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Purple")
              Visibility(

                child: Positioned(
                  top: size.height*0.11,
                  right:size.width*0.65,
                  height: size.height*0.35,
                  width: size.width*0.35,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Orange")
              Visibility(
                child: Positioned(
                  top: size.height*0.135,
                  right:size.width*0.65,
                  height: size.height*0.3,
                  width: size.width*0.3,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
           if (user.avatar=="Blue")
              Visibility(

                child: Positioned(
                  top: size.height*0.13,
                  right:size.width*0.65,
                  height: size.height*0.3,
                  width: size.width*0.3,
                  child:BlueAvatarIcon(onPressed: null,),
                ),
              ),

            Positioned(
              top: size.height*0.66,
              left:size.width*0.05,
              child: SvgPicture.asset(suppCompte),

            ),
            Positioned(
               top:size.height*0.61,
              right:size.width*0.05,
              child:ButtonSupp(
                onPressed: () async {
                  await delete();
                  print("SUPP");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),);
                  },
              ),
            ),
            Positioned(
              top: size.height*0.46,
              left:size.width*0.05,
              child: SvgPicture.asset(changerAvatar)

              ),
            Positioned(
              top:size.height*0.41,
              right:size.width*0.05,
              child: ButtonAvatar(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Avatar()),);
                  print("HELL YEAH");
                },
              ),
            ),
            Positioned(
              top: size.height*0.56,
              left:size.width*0.05,
           child: SvgPicture.asset(changerNom)
                ),

            Positioned(
              top:size.height*0.51,
              right:size.width*0.05,
              child: Container(

                child: ButtonModifyNom(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Name()),);

                    print("HELL YEAH");
                  },
                ),
              ),
            ),
],
            ),
      ),

          );

  }
}


