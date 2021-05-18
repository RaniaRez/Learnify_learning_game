import '../Services/auth.dart';
import 'package:somthn/WelcomePages/ClassUser.dart';

Future<void> googleSignUp() async {
  print("s'inscrire");
  User user=await signInWithGoogle();
  print(user.uid);
  print("hhh");
}
