import 'package:cloud_firestore/cloud_firestore.dart';

class BookIssueModel{
  String? id;
  String? uid;
  String? displayname;
  String? email;
  String? nm;
  String? author;
  int? price;
  String? issuestatus;
  String? returnstatus;

  BookIssueModel({this.id,String? uid,this.displayname,this.email,this.nm,this.author,this.price,this.issuestatus,this.returnstatus});

  factory BookIssueModel.fromJson(DocumentSnapshot snapshot){
    return BookIssueModel(
      id:snapshot.id,
      uid:snapshot["uid"],
      displayname:snapshot["displayname"],
      email:snapshot["email"],
      nm:snapshot["nm"],
      author:snapshot["author"],
      price:snapshot["price"],
      issuestatus:snapshot["issuestatus"],
      returnstatus:snapshot["returnstatus"],
    );
  }
}