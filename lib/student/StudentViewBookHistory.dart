import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/AppBarComponent.dart';
import '../components/DrawerComponent.dart';
import '../components/BookHistoryCard.dart';
import '../models/bookissuemodel.dart';
import '../models/bookmodel.dart';

class StudentViewBookHistory extends StatefulWidget {
  StudentViewBookHistory({Key? key}) : super(key: key);

  @override
  State<StudentViewBookHistory> createState() => _StudentViewBookHistoryState();
}

class _StudentViewBookHistoryState extends State<StudentViewBookHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        drawer: DrawerComponent(),
        appBar: AppBarComponent("Books History"),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("bookrequests").where("issuestatus",isNotEqualTo: "Pending").snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    if (snapshot.hasData) {
                      BookIssueModel bookIssueModel =
                          BookIssueModel.fromJson(snapshot.data?.docs[index]);
                      if (snapshot.data?.docs.length > 0) {
                        return BookHistoryCard(bookIssueModel);
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
