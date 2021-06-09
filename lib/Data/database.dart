import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future<void> updateUserData(String name, String avatar, int finalScore , int score) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'avatar':avatar,
      'finalScore':finalScore,
      'score':score ,
    });
  }

}

