import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:somthn/WelcomePages/ClassUser.dart';
import '../Data/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  User userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(currentUser.uid == user.uid);
    return userFromFirebaseUser(user);

  }


  void signOutGoogle() async {
    await googleSignIn.signOut();
  }

