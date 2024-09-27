import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/bookissuemodel.dart';


class BookHistoryCard extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  BookIssueModel bookIssueModel;

  BookHistoryCard(this.bookIssueModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child:  Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)
          ),
          elevation: 0.8,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(FontAwesomeIcons.book,size: 140,color: Color(0xff424242),),
                Expanded(child:
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${bookIssueModel.nm}",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                      ),
                      Text("Written By:${bookIssueModel.author}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),

                      SizedBox(height: 50.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("₹${bookIssueModel.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0
                            ),
                          ),

                          Text("${bookIssueModel.issuestatus}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                color: Colors.deepPurpleAccent
                            ),
                          ),
                          // ElevatedButton(onPressed: (){
                          //   // BookIssueService().bookissuerequest(auth.currentUser!.uid,auth.currentUser!.displayName , auth.currentUser!.email, book.nm, book.author, book.price, "Pending");
                          // },
                          //   child: Text("Issue Book",style: TextStyle(color: Colors.white),),
                          // ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          )
      ),
    );
  }
}