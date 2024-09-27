import 'package:flutter/material.dart';

import '../services/adminservice.dart';
class ButtonComponent extends StatelessWidget {

  ButtonComponent(this.callback,this.btntext);

  VoidCallback callback;
  String btntext;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60,
      child: ElevatedButton(onPressed:callback, child: Text(btntext,style: TextStyle(fontSize: 17),),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),),
    );
  }
}
