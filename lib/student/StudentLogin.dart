import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Utils/messages.dart';
import '../components/ButtonComponent.dart';
import '../components/PasswordFieldComponent.dart';
import '../components/TextFieldComponent.dart';
import '../services/studentservice.dart';
import 'StudentRegister.dart';
import 'StudentViewBooks.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  State<StudentLogin> createState() => _MainScreenState();
}

class _MainScreenState extends State<StudentLogin> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();

  Future login() async {
    try {
      User? user = await StudentService()
          .login(emailcontroller.text, pwdcontroller.text);
      if (user != null) {
        success(context, "Login Successfull", Colors.green);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StudentViewBooks()));
      } else {
        error(context, "Please Enter Valid Credentials", Colors.red);
      }
    } catch (e) {
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
              Text(
                "Knowledge",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "House",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldComponent(emailcontroller,"Email"),
              PasswordFieldComponent(pwdcontroller,"Password"),
              ButtonComponent(login, "Login"),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentRegister()));
                  },
                  child: Text(
                    "Not have an account? Register",
                    style:
                        TextStyle(color: Colors.deepPurpleAccent, fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
