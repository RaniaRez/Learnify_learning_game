import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Bulles/BullenomIcon.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Buttons/buttonNom.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import '../Buttons/buttonGoTo.dart';
import 'Home.dart';
import 'Settings.dart';
import '../Branches/BranchIconSimple.dart';
import 'Creermdp.dart';
import 'ChooseAvatar.dart';



class Entrernom extends StatefulWidget {
  @override
  _EntrernomState createState() => _EntrernomState();
}

class _EntrernomState extends State<Entrernom> {
  @override
  bool _Visible=true;
  bool _GoTo = false;
  TextEditingController Username = TextEditingController();
  double top = 270;

  void show() {
    setState(() {
      _Visible = !_Visible;
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
      visible:_Visible,
      child: Positioned(
      top: 170.0,
      left: 100.0 ,
      height: 300.0,
      width: 300.0,
      child:BullenomIcon(),
      ),

    ),
          Visibility(
            visible: _Visible,
            child: Positioned(
              top : 270,
              left: 145.5,
              right: 70.5,
              bottom: 10.0,
              child: SizedBox(
                height: 50,
                width: 50,
                child: Text(
                  'Entrer ton nom',
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
              right:110,
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
                        'Ton nom...',
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
            ),
              ],
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
                controller: Username,
                onEditingComplete: (){
                  print("done");
                  if(Username.text.isEmpty){
                    setState(() {
                      _GoTo = false;
                    });
                  } else {
                    setState(() {
                      New.SetUsername(Username.text);
                      _GoTo = true;
                    });
                  }
                  FocusScope.of(context).requestFocus(FocusNode());
                },

                decoration :InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    hintText:  'Ton nom ...',

                  hintStyle:TextStyle(
                    fontSize:25,
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
              visible: _GoTo,
              child: Positioned(
                top: 700.0,
                left: 300.00,

                child: GoToButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Creermdp()));

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
