import 'package:flutter/material.dart';
class PasswordFieldComponent extends StatelessWidget {
  TextEditingController controller;
  String hinttext;
  PasswordFieldComponent(this.controller,this.hinttext);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child:  TextField(
        obscureText: true,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            hintText: hinttext,
            hintStyle: TextStyle(fontSize: 20,color: Colors.deepPurpleAccent),
            focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurpleAccent,width: 2),
                borderRadius: BorderRadius.circular(14)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurpleAccent,width: 2),
                borderRadius: BorderRadius.circular(14)
            )
        ),
      ),
    );
  }
}
