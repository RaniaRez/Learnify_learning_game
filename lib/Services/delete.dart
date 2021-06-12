import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:somthn/WelcomePages/ClassUser.dart';
import '../Data/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth.dart';
import 'Login.dart';
//import 'package:cloud_functions/cloud_functions.dart';

/*Future<void> delete() async  {
FirebaseUser user = await FirebaseAuth.instance.currentUser();
/*final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
final AuthCredential credential = GoogleAuthProvider.getCredential(
    idToken: googleSignInAuthentication.idToken,
    accessToken: googleSignInAuthentication.accessToken
);*/
  signOutGoogle();
googleLogin();

await user.delete();
await Firestore.instance.collection("users").document(user.uid).delete();
}*/

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();


/*  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
      .authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken
  );


  final FirebaseUser user = authResult.user;
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  final AuthResult authResult = await user.reauthenticateWithCredential(credential);


  await DatabaseService(uid: user.uid);  //called from database class
  await user.delete();*/

Future<void> delete() async  {
  try {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
        .authentication;
    FirebaseUser user = await _auth.currentUser();
    AuthCredential credentials =
    GoogleAuthProvider.getCredential(      idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    print(user);
    AuthResult result = await user.reauthenticateWithCredential(credentials);
    //await DatabaseService(uid: result.user.uid); // called from database class
    await Firestore.instance.collection("users").document(user.uid).delete();
    await result.user.delete();
    return true;
  } catch (e) {
    print(e.toString());
    return null;
  }
}