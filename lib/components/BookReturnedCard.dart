import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import '../models/bookissuemodel.dart';
import '../services/bookissueservice.dart';

class BookReturnedCard extends StatelessWidget {
  BookIssueModel? bookIssueModel;

  BookReturnedCard(this.bookIssueModel) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Card(
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
                      Text("${bookIssueModel?.nm}",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                      ),
                      Text("Written By:${bookIssueModel?.author}",style: TextStyle(fontSize: 17),),
                      RichText(
                        text: TextSpan(
                          text: 'Status:',
                          style: TextStyle(fontSize: 17,color:  Color(0xff424242)),
                          children: <TextSpan>[
                            TextSpan(text: "${bookIssueModel?.returnstatus}", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent)),

                          ],
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text("₹${bookIssueModel?.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0
                            ),
                          ),),

                          bookIssueModel?.returnstatus == "Pending"  || bookIssueModel?.returnstatus == "Not Returned"? IconButton(onPressed: (){
                            BookIssueService().acceptreturnrequest(bookIssueModel?.id);

                          }, icon: Icon(Icons.check_circle,size: 35,color: Colors.green,),):IconButton(onPressed: (){
                            BookIssueService().rejectreturnedrequest(bookIssueModel?.id);
                          }, icon: Icon(Icons.cancel,size: 35,color: Colors.red,)),

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
