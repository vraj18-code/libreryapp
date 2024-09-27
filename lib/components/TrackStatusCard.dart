import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/bookissuemodel.dart';

class TrackStatusCard extends StatelessWidget {
  BookIssueModel bookIssueModel;

  TrackStatusCard(this.bookIssueModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 0.8,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.book,
                  size: 120,
                  color: Color(0xff424242),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${bookIssueModel.nm}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      Text("Written By:${bookIssueModel.author}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      bookIssueModel.issuestatus != "" ? RichText(
                        text: TextSpan(
                          text: 'Issue Status:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff424242),
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: "${bookIssueModel?.issuestatus}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ],
                        ),
                      ) : RichText(
                        text: TextSpan(
                          text: 'Return Status:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff424242),
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: "${bookIssueModel?.returnstatus}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹${bookIssueModel.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          )),
    );
    ;
  }
}
