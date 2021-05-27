class User {
 final String uid;
 bool New =true;
 String username;
 String avatar;
 int score;
 //String Password;

 User({this.uid});
 SetAvatar(String a){
  this.avatar = a;
 }
 SetUsername(String u){
  this.username = u;
 }
 /*SetPassword(String p){
  this.Password = p;
 }*/
 SetOld(){
  this.New=false;
 }
}