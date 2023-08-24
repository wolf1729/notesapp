import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../views/seenotepage.dart';

class userregistrationlogin{

  FirebaseAuth fauth = FirebaseAuth.instance;
  FirebaseFirestore data = FirebaseFirestore.instance;
  User? user;

  registration({required String regemail, required String regpassword}) async {
    try{
      UserCredential userregistration = await fauth.createUserWithEmailAndPassword(email: regemail, password: regpassword);
    }
    on FirebaseAuthException catch(error){
      if(error.code == "email-already-in-use"){
        print("already registered email");
      }else{
        print("firebase auth exception is, ${error.code}");
      }
    }
    catch(error){
      print("error occured, ${error}");
    }
  }

  loginuser({required String loginemail, required String loginpassword})async{
    await fauth.signInWithEmailAndPassword(email: loginemail, password: loginpassword);
  }

  adduserdetails({required String title, required String content, required String regemail, required String notes}) async {
    Map<String, String> map = {
      "title" : title,
      "content" : content,
    };

    try{
      await data.collection(regemail).doc(notes).set(map);
    }
    catch(error){
      print("error ocurred, ${error}");
    }
  }

  checkcurrentuser(){
    var user = fauth.currentUser;
    return user;
  }

  sendverificationemail(){
    var user = fauth.currentUser;
    user?.sendEmailVerification();
  }

  userlogout() async {
    await fauth.signOut();
  }

  getid()async{
    var user = await fauth.currentUser!.email;
    print(user);
    return user.toString();
  }

  deleteNote(DocumentReference noteRef) async {
    try {
      await noteRef.delete();
      print("Note deleted successfully!");
    } catch (e) {
      print("Error deleting note: $e");
    }
  }

  void navigateToDetailScreen(BuildContext context, String title, String content) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => seenotepage(title: title, content: content),
    ),
  );
}

}