import 'package:flutter/material.dart';
import 'package:somthn/Buttons/SinscrireButton.dart';
import 'package:somthn/Buttons/seConnecterButton.dart';
import 'package:somthn/Services/auth.dart';
import 'package:somthn/WelcomePages/ChoixDomaines.dart';
import 'package:somthn/Buttons/ClassementButton.dart';
import 'package:somthn/WelcomePages/ChooseAvatar.dart';
import 'package:somthn/classement/Classement.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/modification/Userinfo.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'ClassUser.dart';
import '../Buttons/buttonGoTo.dart';
import '../Buttons/buttonStatistique.dart';
import '../Buttons/buttonUserSettings.dart';
//for backend
import 'package:cloud_firestore/cloud_firestore.dart';
//import '../Services/auth.dart';
import '../Services/Login.dart';
import '../Services/SignUp.dart';
import '../Data/DataUser.dart';
import '../classement/methodes.dart';
import '../classement/Classement.dart';




List<User> Utilisateurs = [];
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
                  child: ClassementButton(onPressed: ()  async {
                    List<DataUser> list = new List<DataUser>.empty(growable: true);
                    list = await classement();
                    list.sort((a, b) => b.score.compareTo(a.score));
                    print(list[0].score);
                    print(list[1].score);
                    print(list[2].score);
                    print("kemelna");
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Classement(value : list )));
                  }),
              ),
              Positioned(
                  top: size.height*0.25,
                  left: size.width*0.2,
                  height: size.height*0.3,
                  width: size.width*0.6,
                  child: ButtonSeConnecter(onPressed: () async {
                    show();
                    print('connect');
                    await googleLogin();
                    print("khraconnecter");
                    print(user.uid);
                    /*DocumentReference q = await Firestore.instance.collection('users').document(user.uid);*/

                    /*Firestore.instance.collection('users').where(firestore.FieldPath.documentId(),'==',user.uid);*/



                  })),
              Positioned(
                  top: size.height*0.45,
                  left: size.width*0.2,
                  height: size.height*0.3,
                  width: size.width*0.6,
                  child: SinscrireButton(onPressed: () async{
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChooseAvatar()),);
                    await googleSignUp();
                    print("khra");
                    print(user.uid);
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
                  child: StatistiqueButton(onPressed:()  {}),
                  visible: _isVisible,
                ),
              ),
                        ],
                          ),
      ),
    );
  }
}


