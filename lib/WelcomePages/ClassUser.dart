class User {
 String username;
 String avatar;
 String Password;
 bool New =true;
 SetAvatar(String a){
  this.avatar = a;
 }
 SetUsername(String u){
  this.username = u;
 }
 SetPassword(String p){
  this.Password = p;
 }
 SetOld(){
  this.New=false;
 }
}