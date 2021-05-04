import 'package:flutter/material.dart';
import 'package:somthn/BienvenueTestNiveau.dart';
import 'package:somthn/ChoixDomaines.dart';
import 'package:somthn/HomeButton.dart';
import 'package:somthn/TestDeNiveau.dart';
import 'package:somthn/Userinfo.dart';
import 'package:somthn/Users.dart';
import 'package:somthn/buttonNom.dart';
import 'settingsButton.dart';
import 'BacksButton.dart';
import 'buttonGoTo.dart';
import 'Home.dart';
import 'Settings.dart';
import 'BranchIconSimple.dart';
import 'Bullesaisiemdp.dart';
import 'ChooseAvatar.dart';
import 'package:somthn/OrangeAvatarIcon.dart';
import 'package:somthn/PinkAvatarIcon.dart';
import 'package:somthn/PurpleAvatarIcon.dart';
import 'package:somthn/BlueAvatarIcon.dart';

class Ecriremdp extends StatefulWidget {
  @override
  _EcriremdpState createState() => _EcriremdpState();
}

class _EcriremdpState extends State<Ecriremdp> {
 
  @override
  bool _Visible=true;
  bool _Goto = false;
  String texte = "Entrer votre mot de passe";
  TextEditingController Password = TextEditingController();
  String buttonText = "Mot de passe...";
  double top = 270;
  void show() {
    setState(() {
      _Visible = !_Visible;
    });
  }
  Widget build(BuildContext context) {
    if (Password.text.isNotEmpty) buttonText= Password.text;
    else  buttonText = "Mot de passe...";
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
                top: 8.00,
                right: 250.00,
                child: BacksButton(onPressed: (){
                  print("u clicked me");
                  Navigator.pop(context);
                },)
            ),
            Positioned(
              top: -3.5,
              left: 100.0,
              child: HomeButton(
                onPressed: (){
                  print("HELL YEAH");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),);

                },
              ),
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
            Visibility(
              visible:_Visible ,
              child: Positioned(
                top: 320.0,
                right: 250.0 ,
                height: 300.0,
                width: 200.0,
                child:BranchIconSimple(),
              ),
            ),
            if (New.avatar=="Pink")
              Visibility(
                visible:_Visible ,
                child: Positioned(
                  top: 257.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child:PinkAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Purple")
              Visibility(
                visible:_Visible ,
                child: Positioned(
                  top: 257.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Orange")
              Visibility(
                visible:_Visible ,
                child: Positioned(
                  top: 257.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
            if (New.avatar=="Blue")
              Visibility(
                visible:_Visible ,
                child: Positioned(
                  top: 257.0,
                  right: 250.0 ,
                  height: 300.0,
                  width: 200.0,
                  child:BlueAvatarIcon(onPressed: null,),
                ),
              ),
            Visibility(
              visible: _Visible,
              child: Positioned(
                top : top,
                left: 145.5,
                right: 70.5,
                bottom: 10.0,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Text(
                    '$texte',
                    style: TextStyle(
                      fontFamily: 'Skranji-bold',
                      fontSize: 30,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,

                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Visibility(
              visible:_Visible,
              child: Stack(
                children:<Widget>[



                  Positioned(
                    bottom: 150.00,
                    left : 50.00,
                    right: 50.00,
                    child: ButtonNom(onPressed: (){
                      show();
                      print("HELL YEAH");
                    }
                    ),
                  ),
                  Positioned(
                    bottom:182,
                    right:105,
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
                              '$buttonText',
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
                      ),
                    ),
                  ),
                ],
              ),

            ),

            Visibility(
              visible: _Visible,
              child: Positioned(
                top: 170.0,
                left: 100.0 ,
                height: 300.0,
                width: 300.0,
                child:Bullesaisiemdp(),
              ),
            ),


            Visibility(
              visible:!_Visible,
              child: Positioned(
                  top: 400.00,
                  left : 50.00,
                  right: 50.00,
                  child: ButtonNom(onPressed: (){
                    show();
                    print("HELL YEAH");
                  } )
              ),
            ),
            Visibility(
              visible:!_Visible,
              child: Positioned(
                  top:427,
                  left:100,
                  right:100,

                  child:Container(
                      margin:EdgeInsets.symmetric(horizontal:20 ),
                      child:TextField(
                        obscureText: true,
                        controller: Password,
                        onEditingComplete: (){
                          if(Password.text.isNotEmpty) {
                            setState(() {
                              New.SetPassword(Password.text);
                              Utilisateurs.add(New);
                              _Goto = true;
                            });

                          }else{
                            setState(() {
                              _Goto = false;
                            });

                          }
                          FocusScope.of(context).requestFocus(FocusNode());
                        },

                        decoration :InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 0),
                            hintText:  'Mot de passe ...',

                            hintStyle:TextStyle(
                              fontSize:22,
                              fontFamily: 'Skranji-Bold',
                              fontWeight: FontWeight.bold,
                              color:Colors.brown[700],

                            )
                        ),
                        style:TextStyle(
                          fontSize: 25,
                          fontFamily: 'Skranji-Bold',
                          fontWeight: FontWeight.bold,
                          color:Colors.brown[700],

                        ),
                      )
                  )
              ),
            ),
                 Visibility(
                   visible: _Goto,
                   child: Positioned(
                    top: 700.0,
                    left: 300.00,
                    child: GoToButton(onPressed: (){
                      setState(() {
                        Utilisateurs.add(New);
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ChoixDomaine()));
                      print("HELL YEAH");
                    },
                    ),


                ),
                 ),


          ]
      ),
    );

  }
}
