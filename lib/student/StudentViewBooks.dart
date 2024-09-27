import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/DrawerComponent.dart';
import '../components/IssuedCard.dart';
import '../models/bookmodel.dart';
class StudentViewBooks extends StatefulWidget {
  const StudentViewBooks({Key? key}) : super(key: key);

  @override
  State<StudentViewBooks> createState() => _StudentViewBooksState();
}

class _StudentViewBooksState extends State<StudentViewBooks> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      drawer: DrawerComponent(),
      appBar: AppBar(
        toolbarHeight: 120,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
        ),
        elevation: 0,
        backgroundColor:Colors.deepPurpleAccent,
        title: Text("All Books",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("books").snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context,index){
                    if(snapshot.hasData){
                      BookModel book = BookModel.fromJson(snapshot.data?.docs[index]);
                      if(snapshot.data?.docs.length>0){
                        return IssuedCard(book);
                      }
                    }
                    return Center(child: CircularProgressIndicator(),);
                  }),
            );
          },
        )
    );
  }
}
