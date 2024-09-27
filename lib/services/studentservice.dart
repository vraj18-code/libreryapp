import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentService{
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future register(String name,String email,String pwd,String mobile) async {
    try{
      UserCredential credentials =await auth.createUserWithEmailAndPassword(email: email, password: pwd);
      if(credentials.user != null){
        await credentials.user!.updateDisplayName(name);

        await firestore.collection("students").add({
          "nm":name,
          "email":email,
          "pwd":pwd,
          "mobile":mobile,
        });
      }

      return credentials.user;
    }catch(e){
      print(e);
    }

  }

  Future login(String email,String pwd)async{
    try{
      UserCredential credentials = await auth.signInWithEmailAndPassword(email: email, password: pwd);
      return credentials.user;
    }catch(e){
      print(e);
    }
  }


}