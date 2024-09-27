import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel{
  String? id;
  String? nm;
  String? author;
  int? pages;
  int? price;
  String? publisher;

  BookModel({this.id,this.nm,this.author,this.pages,this.price,this.publisher});

  factory BookModel.fromJson(DocumentSnapshot snapshot){
    return BookModel(
      id : snapshot.id,
      nm: snapshot["nm"],
      author: snapshot["author"],
      pages: snapshot["pages"],
      price : snapshot["price"],
      publisher : snapshot["publisher"],
    );
  }
}