import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Utils/messages.dart';
import '../models/bookmodel.dart';
import '../services/bookissueservice.dart';
class IssuedCard extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  BookModel book;
  IssuedCard(this.book);

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
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(FontAwesomeIcons.book,size: 100,color: Color(0xff424242),),
                Expanded(child:
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${book.nm}",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      ),
                      Text("Written By:${book.author}"),
                      SizedBox(height: 35.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("₹${book.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0
                            ),
                          ),
                          ElevatedButton(onPressed: (){
                            BookIssueService().bookissuerequest(auth.currentUser!.uid,auth.currentUser!.displayName , auth.currentUser!.email, book.nm, book.author, book.price, "Pending","");
                            success(context,"Thank You for Book Issue Request", Colors.green);
                          },
                            child: Text("Issue Book",style: TextStyle(color: Colors.white),),
                          ),
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
