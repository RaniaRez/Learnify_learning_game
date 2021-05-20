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
import '../Services/Login.dart';
import '../Data/database.dart';



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
                right:size.width*0.75,

                child: BacksButton(onPressed: (){
                  print("u clicked me");
                  Navigator.pop(context);
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
                    MaterialPageRoute(builder: (context) => Home()),);

                },
              ),
            ),
            Positioned(
                top: size.height*0.05,
                left:size.width*0.75,
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
                height: size.height*0.2,
                width: size.width*0.35,
                top:size.height*0.5,
                right:size.width*0.65,
                child:BranchIconSimple(),
              ),
            ),
            if (user.avatar=="Pink")
              Visibility(
              visible:_Visible ,
              child: Positioned(
                top: size.height*0.38,
                right: size.width*0.7 ,
                height: size.height*0.3,
                width: size.width*0.3,
                child:PinkAvatarIcon(onPressed: null,),
              ),
            ),
           if (user.avatar=="Purple")
              Visibility(
                visible:_Visible ,
                child: Positioned(
                  top: size.height*0.38,
                  right: size.width*0.7 ,
                  height: size.height*0.32,
                  width: size.width*0.32,

                  child:PurpleAvatarIcon(onPressed: null,),
                ),
              ),
            if (user.avatar=="Orange")
              Visibility(
                visible:_Visible ,
                child: Positioned(
                  top: size.height*0.39,
                  right: size.width*0.7 ,
                  height: size.height*0.3,
                  width: size.width*0.3,
                  child: OrangeAvatarIcon(onPressed: null,),
                ),
              ),
           if (user.avatar=="Blue")
              Visibility(
                visible:_Visible ,
                child: Positioned(
                  top: size.height*0.38,
                  right: size.width*0.7 ,
                  height: size.height*0.3,
                  width: size.width*0.3,
                  child:BlueAvatarIcon(onPressed: null,),
                ),
              ),

    Visibility(
        visible:_Visible,
        child: Positioned(
          top: size.height*0.05,
          left: size.width*0.3 ,
          height: size.height*0.7,
          width: size.width*0.7,
        child:BullenomIcon(),
        ),

    ),

            Visibility(
              visible:_Visible,
              child: Stack(
                children:<Widget>[
              Positioned(
                top: size.height*0.48,
                left: size.width*0.2 ,
                height: size.height*0.55,
                width: size.width*0.55,
                  child: ButtonNom(onPressed: (){
                    show();
                    print("HELL YEAH");
                  }
                  ),
              ),
              Positioned(
                top: size.height*0.73,
                left: size.width*0.27 ,
                child: InkWell(
                  onTap:(){
                    show();
                    print("HELL YEAH");
                  },

                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Ton nom...',
                            style:TextStyle(
                              fontSize: 27,
                              fontFamily: 'Skranji-Bold',
                              fontWeight: FontWeight.bold,
                              color:Colors.brown[700],
                            ),
                            textAlign: TextAlign.center,
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
                  top: size.height*0.28,
                  left: size.width*0.25 ,
                  height: size.height*0.55,
                  width: size.width*0.55,
                  child: ButtonNom(onPressed: (){
                    show();
                    print("HELL YEAH");
                  } )
              ),
            ),

            Visibility(
              visible:!_Visible,
              child: Positioned(
                  height: size.height*0.55,
                  width: size.width*0.55,
                  right: size.width*0.15,
                  top:size.height*0.52,
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
                      setState(()  {
                        user.SetUsername(Username.text);
                        _GoTo = true;
                        print("username");
                        print(user.username);
                        print("printed");
                        DatabaseService(uid: user.uid).updateUserData(false,user.username,user.avatar, 10);

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
                  top: size.height*0.8,
                  left:size.width*0.75,

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
      ),
    );

  }
}
