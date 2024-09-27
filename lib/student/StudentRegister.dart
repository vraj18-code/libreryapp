import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Utils/messages.dart';
import '../components/PasswordFieldComponent.dart';
import '../components/TextFieldComponent.dart';
import '../services/studentservice.dart';
import 'StudentLogin.dart';
class StudentRegister extends StatefulWidget {
  const StudentRegister({Key? key}) : super(key: key);

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();

  Future register() async {
    if(namecontroller.text == "" || emailcontroller.text == "" || pwdcontroller.text == "" || mobilecontroller.text == ""){
      error(context, "All Fields Are Required", Colors.red);
      return;
    }
    try{

      User user = await StudentService().register(namecontroller.text, emailcontroller.text, pwdcontroller.text,mobilecontroller.text);
      if(user != null){
        success(context,"Login Success", Colors.green);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentLogin()));
       }
      // else{
      //   error(context, "Please Enter Valid Credentials", Colors.red);
      // }

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
                Text("Knowledge",textAlign: TextAlign.center,style: TextStyle(fontSize: 45,color:Colors.deepPurpleAccent,fontWeight: FontWeight.bold),),
                Text("House",textAlign: TextAlign.center,style: TextStyle(fontSize: 45,color:Colors.deepPurpleAccent,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                TextFieldComponent(namecontroller, "Name"),
                TextFieldComponent(emailcontroller, "Email"),
                PasswordFieldComponent(pwdcontroller, "Password"),
               TextFieldComponent(mobilecontroller, "Mobile"),
                Container(
                  height: 60,
                  child: ElevatedButton(onPressed: register, child: Text("Register",style: TextStyle(fontSize: 17),),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),),
                ),
                SizedBox(height: 10,),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentLogin(),));
                }, child: Text("Already Have an account? Login",style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 20),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
