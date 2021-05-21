import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
//import '../Data/database.dart';
//import '../WelcomePages/ClassUser.dart';
import '../Data/DataUser.dart';
//import 'package:cloud_firestore/src/query.dart';

//import '../classement/methodes.dart';
//import '../Data/DataUser.dart';

 Future<List<DataUser>> classement() async {

   QuerySnapshot q = await Firestore.instance.collection('users').getDocuments();
   return q.documents.map(
           (doc) =>
           DataUser(
             doc.documentID,
             doc.data['name'],
             doc.data['avatar'],
             doc.data['finalScore'],
           )
   ).toList();

 }

/*List<DataUser> list= new List<DataUser>.empty(growable: true);
list = await classement();
list.sort((a, b) => b.score.compareTo(a.score));

print(list[0].score);
print(list[1].score);
print(list[2].score);
print("kemelna");*/


