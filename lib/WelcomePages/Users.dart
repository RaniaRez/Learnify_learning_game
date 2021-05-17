import 'package:flutter/material.dart';
import 'package:somthn/Buttons/SinscrireButton.dart';
import 'package:somthn/Buttons/seConnecterButton.dart';
import 'package:somthn/WelcomePages/ChoixDomaines.dart';
import 'package:somthn/Buttons/ClassementButton.dart';
import 'package:somthn/WelcomePages/ChooseAvatar.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/WelcomePages/Userinfo.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'ClassUser.dart';
import '../Buttons/buttonGoTo.dart';
import '../Buttons/buttonStatistique.dart';
import '../Buttons/buttonUserSettings.dart';
//for backend
import '../Services/auth.dart';


List<User> Utilisateurs = [
];
class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
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
                    print("HELL YEAH");
                  },)
              ),

              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: (){
                    print("HELL YEAH");
                    Navigator.pop(context);
                  },)
              ),
              Positioned(
                  top: size.height*0.05,
                  left: size.width*0.4,
                  child: ClassementButton(onPressed: null,),
              ),
              Positioned(
                  top: size.height*0.25,
                  left: size.width*0.2,
                  height: size.height*0.3,
                  width: size.width*0.6,
                  child: ButtonSeConnecter(onPressed: (){
                    show();
                    print('connect');
                  })),
              Positioned(
                  top: size.height*0.45,
                  left: size.width*0.2,
                  height: size.height*0.3,
                  width: size.width*0.6,
                  child: SinscrireButton(onPressed: () async{
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChooseAvatar()),);
                    print('register');
                    User user=await  signInWithGoogle();
                    print(user.uid);
                    print("hh");
                  })
              ),
              Positioned(
                top: size.height*0.8,
                left:size.width*0.75,
                child: Visibility(
                  child: GoToButton(onPressed: (){
                    print("HELL YEAH");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChoixDomaine()),);
                  },),
                  visible: _isVisible,
                ),


              ),
               Positioned(
                 top: size.height*0.805,
                 left: size.width*0.390,
                 child: Visibility(
                  child: UserSettingsButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Userinfo()));
                    print("HELL YEAH");
                  } ),
                 visible: _isVisible,
                 ),
               ),
              Positioned(
                top: size.height*0.8,
                right:size.width*0.75,
                child: Visibility(
                  child: StatistiqueButton(onPressed: null,),
                  visible: _isVisible,
                ),
              ),
                        ],
                          ),
      ),
                      );

  }
}


