import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardService{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<int> getIssue(String collection,[String? issuestatus,String? returnstatus])async{
    QuerySnapshot snapshot;
    if(issuestatus == null){
      snapshot = await firestore.collection(collection).get();    }
    else{
      snapshot = await FirebaseFirestore.instance.collection("bookrequests").where("issuestatus", isEqualTo: "Issued").get();
    }
    return snapshot.docs.length;

  }
  Future<int> getIssued(String collection,[String? issuestatus])async{
    QuerySnapshot snapshot;
    if(issuestatus == "Pending"){
      snapshot = await firestore.collection(collection).get();
    }
    else{
      snapshot = await FirebaseFirestore.instance.collection("bookrequests").where("issuestatus",isEqualTo:"Pending").get();
    }

    return snapshot.docs.length;
  }
  Future<int> getReturned(String collection,[String? returnstatus])async{
    QuerySnapshot snapshot;
    if(returnstatus == ""){
      snapshot = await firestore.collection(collection).get();
    }
    else{
      snapshot = await FirebaseFirestore.instance.collection("bookrequests").where("returnstatus",isEqualTo:"Pending").get();
    }

    return snapshot.docs.length;
  }
  Future<int> getCount(String collection,[String? returnstatus])async{
    QuerySnapshot snapshot;
    if(returnstatus == null){
      snapshot = await firestore.collection(collection).get();
    }
    else{
      snapshot = await firestore.collection("bookrequests").where("returnstatus",isEqualTo:"Returned").get();
    }

    return snapshot.docs.length;
  }

}