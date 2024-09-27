import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/AppBarComponent.dart';
import '../components/BookCard.dart';
import '../components/DrawerComponent.dart';
import '../models/bookmodel.dart';


class AdminViewBooks extends StatefulWidget {
  const AdminViewBooks({Key? key}) : super(key: key);

  @override
  State<AdminViewBooks> createState() => _AdminViewBooksState();
}

class _AdminViewBooksState extends State<AdminViewBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        drawer: DrawerComponent(),
        appBar: AppBarComponent("View Books"),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("books").snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    if (snapshot.hasData) {
                      if (snapshot.data?.docs.length > 0) {
                        BookModel book =
                            BookModel.fromJson(snapshot.data?.docs[index]);
                        return BookCard(book);
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            );
          },
        ));
  }
}
