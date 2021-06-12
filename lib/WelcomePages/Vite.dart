import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Branches/BranchIconSimple.dart';
import 'package:somthn/Buttons/ClassementButton.dart';
import 'package:somthn/WelcomePages/ChooseAvatar.dart';
import 'package:somthn/WelcomePages/Home.dart';
import 'package:somthn/classement/Classement.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'ClassUser.dart';
import '../Buttons/buttonGoTo.dart';
import '../Buttons/buttonStatistique.dart';
import '../Data/DataUser.dart';
import '../classement/methodes.dart';
import '../classement/Classement.dart';




List<User> Utilisateurs = [];
class Vite extends StatefulWidget {
  @override
  _ViteState createState() => _ViteState();
}

class _ViteState extends State<Vite> {
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
                child: SettingsButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },)
            ),

            Positioned(
                top: size.height*0.05,
                right:size.width*0.75,
                child: BacksButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()));
                },)
            ),
            Positioned(
              top: size.height*0.05,
              left: size.width*0.4,
              child: ClassementButton(onPressed: ()  async {
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
                child:SvgPicture.asset('assets/icons/bulleVite.svg'),

            ),
             Positioned(
                height: size.height*0.2,
                width: size.width*0.35,
                top:size.height*0.5,
                right:size.width*0.65,
                child:BranchIconSimple(),
              ),
                Positioned(
                  top: size.height*0.38,
                  right: size.width*0.7 ,
                  height: size.height*0.32,
                  width: size.width*0.32,

                  child:PurpleAvatarIcon(onPressed: null,),
                ),



            Positioned(
                top: size.height*0.8,
                left:size.width*0.75,

                child: GoToButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChooseAvatar()));
                },
                ),



              ),
          ],
        ),
      ),
    );
  }
}


