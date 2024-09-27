import 'package:flutter/material.dart';

import '../Utils/messages.dart';
import '../components/AppBarComponent.dart';
import '../components/ButtonComponent.dart';
import '../components/DrawerComponent.dart';
import '../components/TextFieldComponent.dart';
import '../services/bookservice.dart';

class AdminAddBook extends StatefulWidget {
  const AdminAddBook({Key? key}) : super(key: key);

  @override
  State<AdminAddBook> createState() => _AdminAddBookState();
}

class _AdminAddBookState extends State<AdminAddBook> {
  TextEditingController nm = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController pages = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController publisher = TextEditingController();

  Future addBook() async {
    if(nm.text == "" || author.text == "" || pages.text == "" || price.text == "" || publisher.text ==""){
      error(context, "All fields are required", Colors.red);
    }
    try {
      await BookService().addBook(nm.text, author.text, int.parse(pages.text),
          int.parse(price.text), publisher.text);
         success(context, "Book Saved", Colors.green);
    } catch (e) {
      print(e);
    }

    nm.text = "";
    author.text = "";
    pages.text ="";
    price.text = "";
    publisher.text ="";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBarComponent("Add Book"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFieldComponent(nm, "Book Name:"),
              TextFieldComponent(author, "Author Name:"),
              TextFieldComponent(pages, "Pages:"),
              TextFieldComponent(price, "Price:"),
              TextFieldComponent(publisher, "Publisher:"),
              ButtonComponent(addBook, "Add Book")
            ],
          ),
        ),
      ),
    );
  }
}
