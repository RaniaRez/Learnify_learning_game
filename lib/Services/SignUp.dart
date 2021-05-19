import '../Services/auth.dart';
import 'package:somthn/WelcomePages/ClassUser.dart';
//import '../WelcomePages/Users.dart';
import '../Services/Login.dart';


Future<void> googleSignUp() async {
  print("s'inscrire");
  User user=await signInWithGoogle();
  print(user.uid);
  print("hhh");
}
