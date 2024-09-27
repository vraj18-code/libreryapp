import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItemComponent extends StatelessWidget {
  IconData icondata;
  String text;
  var screen;
  Color color;

  MenuItemComponent(this.icondata,this.text,this.screen,this.color);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icondata,color: color,size: 30,),
      title: Text("${text}",style: TextStyle(fontSize: 20),),
      onTap: () async {
        if(text == "Logout"){
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => screen));
          return;
        }
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => screen));
      },
    );
  }
}
