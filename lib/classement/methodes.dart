import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../Data/database.dart';
import '../WelcomePages/ClassUser.dart';
//import 'package:cloud_firestore/src/query.dart';


List<User> classement(){

int i=0;
List<User> lst =new List<User>(3);
 Firestore.instance.collection('users').getDocuments().then((QuerySnapshot q) => {
      q.documents.forEach((doc) {
        lst[i].username=doc["name"];
        lst[i].avatar=doc["avatar"];
        print("remplir");
        print(i);
        i++;
      })
 });

print("liste");
print(lst);
return lst ;


  /*final QuerySnapshot result =Firestore.instance
      .collection('users').get()*/



}