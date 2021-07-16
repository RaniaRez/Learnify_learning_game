import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:somthn/WelcomePages/Vite.dart';
import 'package:somthn/WelcomePages/Voila.dart';
import '../Services/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async {
    await googleLogin();
    print(user.uid);
    String documentID= user.uid;
    var d= await Firestore.instance.collection('users').document(documentID).get();
    if (d.exists ){
      print('exii');
      user.username=d.data["name"];
      user.avatar=d.data["avatar"];
      user.score=d.data["score"];
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Voila()));
    }

    else {
      print('exiistish');

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Vite()));
    }


}

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/forestbackground.jpg"),
                      fit: BoxFit.cover)),
        child: Center(
          child: SpinKitThreeBounce(
            color: Color(0xFF445640),
            size: 50.0,
          ),
        ),
            ),
    );
  }
}