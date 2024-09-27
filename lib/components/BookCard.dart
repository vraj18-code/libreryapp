import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/bookmodel.dart';
import '../services/bookservice.dart';

class BookCard extends StatelessWidget {

  BookModel book;
  BookCard(this.book);

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
                      // Text("${book.}",style: TextStyle(
                      //   fontWeight: FontWeight.bold,
                      //   fontSize: 24.0,
                      // ),
                      // ),
                      Text("${book.nm}",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                      ),
                      Text("Written By:${book.author}"),
                      SizedBox(height: 30.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("₹${book.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0
                            ),
                          ),
                          IconButton(onPressed: (){
                              BookService().deleteBook(book?.id);
                          }, icon: Icon(Icons.delete,size: 30,),)
                          // ElevatedButton(onPressed: (){},
                          //   child: Text("Edit",style: TextStyle(color: Colors.white),),
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
