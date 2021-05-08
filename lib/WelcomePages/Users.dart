import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/WelcomePages/ChoixDomaines.dart';
import 'package:somthn/WelcomePages/ChooseAvatar.dart';
import 'package:somthn/Buttons/ClassementButton.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/WelcomePages/Userinfo.dart';
import '../myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'ClassUser.dart';
import '../Buttons/PlusButton.dart';
import '../Buttons/buttonGoTo.dart';
import '../Buttons/buttonStatistique.dart';
import '../Buttons/buttonUserSettings.dart';

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
                top:210,
                bottom:10,
                left:20,
               right:20,

                child: ListView.builder(
                    itemCount: Utilisateurs.length,
                    itemBuilder: (context, index) {
                      return MaterialButton(
                        onPressed: null,
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                child: SvgPicture.asset(button100),
                        ),
                          Positioned(
                            top:20,
                            left:28,
                           child: InkWell(
                              onTap:(){
                                show();
                                print("HELL YEAH");
                              },
                              child: SizedBox(
                                height: 50,
                                width: 200,
                                child: Container(

                                    child:Center(
                                      child: Text(
                                        Utilisateurs[index].username,
                                        style:TextStyle(
                                          fontSize: 40,
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

                            ),
],
                                ),
                              ),


                              );
                    } ),
                              ),
            if (Utilisateurs.length<4)
            Positioned(
              top:570,
                right: 160.00,
                child: Visibility(
                  visible: !_isVisible,
                  child: PlusButton(onPressed: () {
                  print("HELL YEAH");
                   Navigator.push(
                       context,
                  MaterialPageRoute(builder: (context) => ChooseAvatar()),);
                   }
                  ),
                )),
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


