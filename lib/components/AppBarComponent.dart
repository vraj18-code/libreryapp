import 'package:flutter/material.dart';
class AppBarComponent extends StatelessWidget implements PreferredSizeWidget{
  String? title;
  AppBarComponent(this.title) ;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      toolbarHeight: 120,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      elevation: 0,
      backgroundColor: Colors.deepPurpleAccent,
      title: Text("$title",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(120);
}
