import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
//import '../Data/database.dart';
import '../Data/DataUser.dart';




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

/**/


