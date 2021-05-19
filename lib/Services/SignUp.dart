import '../Services/auth.dart';
import 'package:somthn/WelcomePages/ClassUser.dart';
import '../Services/Login.dart';
//User user;
Future<void> googleSignUp() async {
  print("s'inscrire");
  user=await signInWithGoogle();
  print(user.uid);
  print("hhh");
}
