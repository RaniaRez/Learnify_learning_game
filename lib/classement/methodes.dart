import 'package:cloud_firestore/cloud_firestore.dart';
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


