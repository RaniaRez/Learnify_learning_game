import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Bulles/BullenomIcon.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Buttons/buttonNom.dart';
import 'package:somthn/WelcomePages/AllSet.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import '../Buttons/buttonGoTo.dart';
import 'Home.dart';
import 'Settings.dart';
import '../Branches/BranchIconSimple.dart';
import '../Services/Login.dart';
import '../Data/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Maths/ScoreMaths.dart';
import '../Francais/ScoreFr.dart';
import '../Geographie/ScoreGeo.dart';



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
                  Navigator.pop(context);
                },)
            ),
            Positioned(
              top: size.height*0.047,
              left: size.width*0.39,
              child: HomeButton(
                onPressed: (){
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
                  }
                  ),
              ),
              Positioned(
                top: size.height*0.73,
                left: size.width*0.27 ,
                child: InkWell(
                  onTap:(){
                    show();
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
                    if(Username.text.isEmpty){
                      setState(() {
                        _GoTo = false;
                      });
                    } else {
                      setState(()  {
                        user.SetUsername(Username.text);
                        _GoTo = true;
                        print(user.username);
                        DatabaseService(uid: user.uid).updateUserData(user.username,user.avatar, 0);
                        ScoreMaths scoreM=new ScoreMaths(false,-1,-1,-1);
                        Firestore.instance.collection('users').document(user.uid).collection('domains').document('maths').setData(
                          {
                            'testFait': scoreM.testFait ,
                            'niv1': scoreM.niv1 ,
                            'niv2': scoreM.niv2 ,
                            'niv3': scoreM.niv3 ,
                            'high1':0,
                            'high2':0,
                            'high3':0,
                          }
                        );
                        ScoreFr scoreF =new ScoreFr(false,-1,-1,-1);
                        Firestore.instance.collection('users').document(user.uid).collection('domains').document('francais').setData(
                            {
                              'testFait': scoreF.testFait ,
                              'niv1': scoreF.niv1 ,
                              'niv2': scoreF.niv2 ,
                              'niv3': scoreF.niv3 ,
                              'high1':0,
                              'high2':0,
                              'high3':0,
                            }
                        );
                        ScoreGeo scoreG =new ScoreGeo(false,-1,-1,-1);
                        Firestore.instance.collection('users').document(user.uid).collection('domains').document('geographie').setData(
                            {
                              'testFait': scoreG.testFait ,
                              'niv1': scoreG.niv1 ,
                              'niv2': scoreG.niv2 ,
                              'niv3': scoreG.niv3 ,
                              'high1':0,
                              'high2':0,
                              'high3':0,
                            }
                        );
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
                        MaterialPageRoute(builder: (context) => AllSet()));
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
