//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import '../Services/auth.dart';
import 'package:somthn/WelcomePages/ClassUser.dart';

User user;
Future<void> googleLogin() async {
  print("se connecter");
  user=await signInWithGoogle();
  print(user.uid);
  print("hh");
}

