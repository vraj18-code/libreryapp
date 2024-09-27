import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/AppBarComponent.dart';
import '../components/BookReturnedCard.dart';
import '../components/DrawerComponent.dart';
import '../models/bookissuemodel.dart';


class AdminViewReturnedRequest extends StatefulWidget {
  const AdminViewReturnedRequest({Key? key}) : super(key: key);

  @override
  State<AdminViewReturnedRequest> createState() => _AdminViewReturnedRequestState();
}

class _AdminViewReturnedRequestState extends State<AdminViewReturnedRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        drawer: DrawerComponent(),
        appBar: AppBarComponent("Book Returned Requests"),

        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("bookrequests").where("returnstatus",isEqualTo: "Pending").snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context,index){

                    if(snapshot.hasData){
                      if(snapshot.data?.docs.length>0){
                        BookIssueModel bookIssueModel = BookIssueModel.fromJson(snapshot.data?.docs[index]);
                        return BookReturnedCard(bookIssueModel);
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
