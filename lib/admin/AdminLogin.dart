import 'package:flutter/material.dart';
import 'package:libraryapp/components/TextFieldComponent.dart';

import '../Utils/messages.dart';
import '../components/ButtonComponent.dart';
import '../components/PasswordFieldComponent.dart';
import '../services/adminservice.dart';
import 'AdminDashboard.dart';
class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController unmcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();

  Future login() async {
      if(unmcontroller.text == "" || pwdcontroller.text == ""){
        error(context, "All Fields Are Required", Colors.red);
        return;
      }
      try{
        int l = await AdminService().login(unmcontroller.text, pwdcontroller.text);
        if(l == 1){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminDashboard()));
        }
        else{
          error(context, "Please Enter Credentials", Colors.red);
        }
      }catch(e){
        print(e);
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Library Management System"),),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: 160,
                  child: Image(image: AssetImage("images/yalee.png")),
                ),
                Text("Knowledge",textAlign: TextAlign.center,style: TextStyle(fontSize: 50,color:Colors.deepPurpleAccent,fontWeight: FontWeight.bold),),
                Text("House",textAlign: TextAlign.center,style: TextStyle(fontSize: 50,color:Colors.deepPurpleAccent,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                TextFieldComponent(unmcontroller, "Username"),
                PasswordFieldComponent(pwdcontroller, "Password"),
                ButtonComponent(login, "Login"),
                SizedBox(height: 20,),

              ],
            ),
          ),
        ),
      )
    );
  }
}
