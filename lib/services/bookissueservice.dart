import 'package:cloud_firestore/cloud_firestore.dart';

class BookIssueService{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Future bookissuerequest(String? uid,String? displayname,String? email,String? nm,String? author,int? price,String issuestatus,String returnstatus)async{

      firestore.collection("bookrequests").add({
        "uid":uid,
        "displayname":displayname,
        "nm":nm,
        "email":email,
        "author":author,
        "price":price,
        "issuestatus":issuestatus,
        "returnstatus":returnstatus,
      });
    }

    Future bookreturnrequest(String? id)async{
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      try{
        await firestore.collection("bookrequests").doc(id).update({"returnstatus":"Pending","issuestatus":""});
      }catch(e){
        print(e);
      }
    }



    Future acceptissuerequest(String? id)async{
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      try{
        await firestore.collection("bookrequests").doc(id).update({"issuestatus":"Issued"});
      }catch(e){
        print(e);
      }
    }

    Future acceptreturnrequest(String? id)async{
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      try{
        await firestore.collection("bookrequests").doc(id).update({"returnstatus":"Returned"});
      }catch(e){
        print(e);
      }
    }







    Future rejectissuerequest(String? id)async{
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      try{

        await firestore.collection("bookrequests").doc(id).update({"issuestatus":"Not Issued"});
      }catch(e){
        print(e);
      }
    }

    Future rejectreturnedrequest(String? id)async{
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      try{

        await firestore.collection("bookrequests").doc(id).update({"returnstatus":"Not Returned"});
      }catch(e){
        print(e);
      }
    }
}