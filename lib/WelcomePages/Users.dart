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
import '../Modal/User.dart';

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
    return Scaffold(
      body:
      Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/forestbackground.jpg"),
                      fit: BoxFit.cover)),
            ),
            Positioned(
                top: 50.00,
                left: 300.00,
                child: SettingsButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                  print("HELL YEAH");
                },)
            ),

            Positioned(
                top: 6.00,
                right: 250.00,
                child: BacksButton(onPressed: (){
                  print("HELL YEAH");
                  Navigator.pop(context);
                },)
            ),
            Positioned(
                top: 51,
                left: 150,
                child: ClassementButton(onPressed: null,),
            ),
            Positioned(
                top: 250,
                left: 75,
                child: ButtonSeConnecter(onPressed: (){
                  show();
                  print('connect');
                })),
            Positioned(
              top: 400,
                left: 75,
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
              bottom: 60.0,
              left: 300.00,
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
              bottom: 60.0,
               right: 155.0,
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
              bottom: 60.0,
              right: 300.0,
              child: Visibility(
                child: StatistiqueButton(onPressed: null,),
                visible: _isVisible,
              ),
            ),
                      ],
                        ),
                      );

  }
}


