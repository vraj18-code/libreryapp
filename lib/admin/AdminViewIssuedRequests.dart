import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/AppBarComponent.dart';
import '../components/BookIssuedCard.dart';
import '../components/DrawerComponent.dart';
import '../models/bookissuemodel.dart';


class AdminViewIssuedRequest extends StatefulWidget {
  const AdminViewIssuedRequest({Key? key}) : super(key: key);

  @override
  State<AdminViewIssuedRequest> createState() => _AdminViewIssuedRequestState();
}
class _AdminViewIssuedRequestState extends State<AdminViewIssuedRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        drawer: DrawerComponent(),
        appBar: AppBarComponent("Book Issued Requests"),

        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("bookrequests").where("issuestatus",isEqualTo: "Pending").snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context,index){

                    if(snapshot.hasData){
                      if(snapshot.data?.docs.length>0){
                        BookIssueModel bookIssueModel = BookIssueModel.fromJson(snapshot.data?.docs[index]);
                        return BookIssuedCard(bookIssueModel);
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
