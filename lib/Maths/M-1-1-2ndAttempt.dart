import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/BarreProgres.dart';
import 'package:somthn/Maths/BienvenueMath.dart';
import 'package:somthn/Maths/I-M-1-1.dart';
import 'package:somthn/Maths/M-1-2.dart';
import 'package:somthn/Maths/boxDialogMath1.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/button0.dart';
import 'package:somthn/Buttons/button1.dart';
import 'package:somthn/Buttons/button2.dart';
import 'package:somthn/Buttons/button3.dart';
import 'package:somthn/Buttons/button4.dart';
import 'package:somthn/Buttons/button5.dart';
import 'package:somthn/Buttons/button6.dart';
import 'package:somthn/Buttons/button7.dart';
import 'package:somthn/Buttons/button8.dart';
import 'package:somthn/Buttons/button9.dart';
import 'package:somthn/Buttons/buttonContinuer.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/Buttons/buttonQ.dart';
import 'package:somthn/Buttons/buttonReset.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'I-M-1-1.dart';
import '../Services/Login.dart';
import 'M-1.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class M_1_1_2nd extends StatefulWidget {
  const M_1_1_2nd({Key key}) : super(key: key);

  @override
  _M_1_1_2ndState createState() => _M_1_1_2ndState();
}

class _M_1_1_2ndState extends State<M_1_1_2nd> {
  var player = AudioCache();
  var player2 = AudioPlayer ();

  AudioPlayer advancedPlayer;
  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/mathsMauvRep.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }
  bool oneD = false;
  bool oneU = false;
  bool twoD = false;
  bool twoU = false;
  bool threeD = false;
  bool threeU = false;
  bool fourD = false;
  bool fourU = false;
  bool fiveD = false;
  bool fiveU = false;
  bool sixD = false;
  bool sixU = false;
  bool sevenD = false;
  bool sevenU = false;
  bool eightD = false;
  bool eightU = false;
  bool nineD = false;
  bool nineU = false;
  bool zeroD = false;
  bool zeroU = false;
  bool First = false;
  bool all = false;
  bool Visible = true;
  @override
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
                        image: AssetImage("images/mathsBG.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: size.height*0.05,
                  left:size.width*0.75,
                  child:
                  SettingsButton(onPressed: () async {
                    player2?.stop();
                    if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("HELL YEAH");
                  },)
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: () async {
                    player2?.stop();
                    if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return customDialogMath1();
                        }
                    );
                  },)
              ),
              Positioned(
                bottom: size.height*0.88,
                left: size.width*0.275,
                child: SvgPicture.asset(EmptyBar),
              ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right:size.width*0.275,
                  child: BarreProgres(),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.6,
                  left: size.width*0.75,
                  child: GoToButton(onPressed: () async {
                    if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                    if (!Visible)  {player2 =  await player.play('audio/mathsBravo.wav');}

                    setState(()   {
                      if(!all){

                      }else if ((zeroU) && (nineD)){
                       // player2?.stop();
                        Visible = false;
                        print('Correct');
                        scoreM.niv1=scoreM.niv1+1;
                      }else {
                        player2?.stop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => I_M_1_1_())
                        );
                        print('Wrong');
                      }
                    });
                    print("HELL YEAH");

                  },),
                ),
              ),
              if (user.avatar=="Pink")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.485,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:Image.asset('images/MadPink.gif'),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.46,
                    left: size.width*0.69,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:Image.asset('images/MadPurple.gif'),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.48,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child: Image.asset('images/MadOrange.gif'),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.485,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:Image.asset('images/MadBlue.gif'),
                  ),
                ),

              Positioned(
                top: size.height*0.2,
                left: size.width*0.2,
                height: size.width*0.6,
                width: size.width*0.6,
                child:SvgPicture.asset('assets/icons/M-1-Q-1-2.svg'),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.61,
                  right: size.width*0.77,
                  child: ButtonReset(
                      onPressed: () {
                        setState(() {
                          oneD = false;
                          oneU = false;
                          twoD = false;
                          twoU = false;
                          threeD = false;
                          threeU = false;
                          fourD = false;
                          fourU = false;
                          fiveD = false;
                          fiveU = false;
                          sixD = false;
                          sixU = false;
                          sevenD = false;
                          sevenU = false;
                          eightD = false;
                          eightU = false;
                          nineD = false;
                          nineU = false;
                          zeroD = false;
                          zeroU = false;
                          First = false;
                          all = false;
                        });
                        print('reset');
                      }

                  ),
                ),
              ),
              Positioned(
                  top: size.height*0.61,
                  left: size.width*0.33,
                  height: size.width*0.2,
                  width: size.width*0.33,
                  child: QButton(onPressed: null,)
              ),
              Positioned(
                top: size.height*0.75,
                left: size.width*0.01,
                right: size.width*0.01,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                        visible: Visible,
                        child:Button_0(onPressed: (){
                          setState(() {
                            if(all){

                            }else if(First){
                              zeroU = true;
                              all = true;
                            }else {
                              zeroD = true;
                              First = true;
                            }
                          });
                        },)
                    ),
                    Visibility(
                        visible: Visible,
                        child:  Button_1(onPressed: (){
                          setState(() {
                            if(all){

                            }else if(First){
                              oneU = true;
                              all = true;
                            }else {
                              oneD = true;
                              First = true;
                            }
                          });
                        },)
                    ),
                    Visibility(
                        visible: Visible,
                        child: Button_2(onPressed: (){
                          setState(() {
                            if(all){

                            }else if(First){
                              twoU = true;
                              all = true;
                            }else {
                              twoD = true;
                              First = true;
                            }
                          });
                        },)
                    ),
                    Visibility(
                        visible: Visible,
                        child:Button_3(onPressed: (){
                          setState(() {
                            if(all){

                            }else if(First){
                              threeU = true;
                              all = true;
                            }else {
                              threeD = true;
                              First = true;
                            }
                          });
                        },)
                    ),
                    Visibility(
                        visible: Visible,
                        child: Button_4(onPressed: (){
                          setState(() {
                            if(all){

                            }else if(First){
                              fourU = true;
                              all = true;
                            }else {
                              fourD = true;
                              First = true;
                            }
                          });
                        },)
                    ),

                  ],
                ),
              ),
              Positioned(
                top: size.height*0.85,
                left: size.width*0.01,
                right: size.width*0.01,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                        visible: Visible,
                        child:
                        Button_5(onPressed: (){
                          setState(() {
                            if(all){

                            }else if(First){
                              fiveU = true;
                              all = true;
                            }else {
                              fiveD = true;
                              First = true;
                            }
                          });
                        },)
                    ),
                    Visibility(
                        visible: Visible,
                        child: Button_6(onPressed: (){
                          setState(() {
                            if(all){

                            }else if(First){
                              sixU = true;
                              all = true;
                            }else {
                              sixD = true;
                              First = true;
                            }
                          });
                        },)
                    ),
                    Visibility(
                        visible: Visible,
                        child: Button_7(onPressed: (){
                          setState(() {
                            if(all){

                            }else if(First){
                              sevenU = true;
                              all = true;
                            }else {
                              sevenD = true;
                              First = true;
                            }
                          });
                        },)
                    ),
                    Visibility(
                        visible: Visible,
                        child: Button_8(onPressed: (){
                          setState(() {
                            if(all){

                            }else if(First){
                              eightU = true;
                              all = true;
                            }else {
                              eightD = true;
                              First = true;
                            }
                          });
                        },)
                    ),
                    Visibility(
                        visible: Visible,
                        child:Button_9(onPressed: (){
                          setState(() {
                            if(all){

                            }else if(First){
                              nineU= true;
                              all = true;
                            }else {
                              nineD = true;
                              First = true;
                            }
                          });
                        },)
                    ),
                  ],
                ),
              ),
              //DebutAnswers
              Visibility(
                visible: zeroD,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.35,
                    child: Button_0(onPressed: null,)
                ),
              ),
              Visibility(
                visible: zeroU,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.48,
                    child: Button_0(onPressed: null,)
                ),
              ),
              Visibility(
                visible: oneD,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.35,
                    child: Button_1(onPressed: null,)
                ),
              ),
              Visibility(
                visible: oneU,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.48,
                    child: Button_1(onPressed: null,)
                ),
              ),
              Visibility(
                visible: twoD,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.35,
                    child: Button_2(onPressed: null,)
                ),
              ),
              Visibility(
                visible: twoU,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.48,
                    child: Button_2(onPressed: null,)
                ),
              ),
              Visibility(
                visible: threeD,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.35,
                    child: Button_3(onPressed: null,)
                ),
              ),
              Visibility(
                visible: threeU,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.48,
                    child: Button_3(onPressed: null,)
                ),
              ),
              Visibility(
                visible: fourD,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.35,
                    child: Button_4(onPressed: null,)
                ),
              ),
              Visibility(
                visible: fourU,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.48,
                    child: Button_4(onPressed: null,)
                ),
              ),
              Visibility(
                visible: fiveD,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.35,
                    child: Button_5(onPressed: null,)
                ),
              ),
              Visibility(
                visible: fiveU,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.48,
                    child: Button_5(onPressed: null,)
                ),
              ),
              Visibility(
                visible: sixD,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.35,
                    child: Button_6(onPressed: null,)
                ),
              ),
              Visibility(
                visible: sixU,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.48,
                    child: Button_6(onPressed: null,)
                ),
              ),
              Visibility(
                visible: sevenD,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.35,
                    child: Button_7(onPressed: null,)
                ),
              ),
              Visibility(
                visible: sevenU,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.48,
                    child: Button_7(onPressed: null,)
                ),
              ),
              Visibility(
                visible: eightD,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.35,
                    child: Button_8(onPressed: null,)
                ),
              ),
              Visibility(
                visible: eightU,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.48,
                    child: Button_8(onPressed: null,)
                ),
              ),
              Visibility(
                visible: nineD,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.35,
                    child: Button_9(onPressed: null,)
                ),
              ),
              Visibility(
                visible: nineU,
                child: Positioned(
                    top: size.height*0.618,
                    left: size.width*0.48,
                    child: Button_9(onPressed: null,)
                ),
              ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                    top: size.height*0.8,
                    left: 0.0,
                    height: size.height*0.2,
                    width: size.width*0.5,
                    child: ButtonContinuer(onPressed: () async {
                      player2?.stop();
                      if (advancedPlayer!=null){
                  int result = await advancedPlayer?.pause();}
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => M_1_2()));
                      print('Continuer');},)
                ),
              ),
              if (user.avatar=="Pink")
                Visibility(
                  visible: !Visible,
                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.1,
                    top:size.height*0.729,
                    child:Image.asset('images/HappyPink.gif'),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(
                  visible: !Visible,
                  child: Positioned(
                    height: size.width*0.35,
                    width: size.width*0.35,
                    left: size.width*0.1,
                    top:size.height*0.7,
                    child:Image.asset('images/HappyPurple.gif'),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: !Visible,
                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.1,
                    top:size.height*0.729,
                    child: Image.asset('images/HappyOrange.gif'),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(
                  visible: !Visible,
                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.1,
                    top:size.height*0.729,
                    child:Image.asset('images/HappyBlue.gif'),
                  ),
                ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                    height: size.width*0.45,
                    width: size.width*0.45,
                    left: size.width*0.4,
                    top:size.height*0.7,
                    child: SvgPicture.asset(bulleBravo)
                ),
              )
            ],
          ),
        ));
  }

}
