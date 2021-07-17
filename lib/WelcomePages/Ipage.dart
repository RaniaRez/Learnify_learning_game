import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Buttons/buttonNom.dart';
import 'package:somthn/WelcomePages/Voila.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'Home.dart';
import 'Settings.dart';
import '../Branches/BranchIconSimple.dart';
import '../Services/Login.dart';
import 'package:url_launcher/url_launcher.dart';




class Ipage extends StatefulWidget {
  @override
  _IpageState createState() => _IpageState();
}

class _IpageState extends State<Ipage> {
  @override
  bool _Visible=true;


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
                      MaterialPageRoute(builder: (context) => Voila()),);

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
                  child:SvgPicture.asset('assets/icons/bulleGuide.svg'),
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
                      child: ButtonNom(onPressed:null),

                      ),

                    Positioned(
                      top: size.height*0.73,
                      left: size.width*0.27 ,
                      child: InkWell(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '  Le guide ',
                            style:TextStyle(
                              fontSize: 27,
                              fontFamily: 'Skranji-Bold',
                              fontWeight: FontWeight.bold,
                              color:Colors.brown[700],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () => launch('https://learnify1.netlify.app/')



                    ),


),
                  ],
                ),

              ),
            ]
        ),
      ),
    );
  }
}
