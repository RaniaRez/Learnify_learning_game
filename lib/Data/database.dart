import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future<void> updateUserData(bool exist ,String name, String avatar, int finalScore) async {
    return await userCollection.document(uid).setData({
      'exist' : exist ,
      'name': name,
      'avatar':avatar,
      'finalScore':finalScore,
    });
  }

}

