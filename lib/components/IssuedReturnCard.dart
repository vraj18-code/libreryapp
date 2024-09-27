import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/bookissuemodel.dart';
import '../services/bookissueservice.dart';
class IssuedReturnCard extends StatelessWidget {
  BookIssueModel bookIssueModel;
  IssuedReturnCard(this.bookIssueModel);

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Card(
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
              Icon(FontAwesomeIcons.book,size: 120,color: Color(0xff424242),),
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
                    Text("Written By:${bookIssueModel.author}"),
                    SizedBox(height: 40.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("₹${bookIssueModel.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0
                          ),
                        ),
                        ElevatedButton(onPressed: (){
                          BookIssueService().bookreturnrequest(bookIssueModel.id);
                        },
                          child: Text("Return",style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        )
    );
  }
}
