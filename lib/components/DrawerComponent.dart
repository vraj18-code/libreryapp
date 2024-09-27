import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../admin/AdminAddBook.dart';
import '../admin/AdminDashboard.dart';
import '../admin/AdminViewBooks.dart';
import '../admin/AdminViewIssuedRequests.dart';
import '../admin/AdminViewReturnedRequests.dart';
import '../mainscreen.dart';
import '../student/StudentTrackStatus.dart';
import '../student/StudentViewBooks.dart';
import '../student/StudentViewIssuedRequests.dart';
import 'MenuItemComponent.dart';
import 'TrackStatusCard.dart';
class DrawerComponent extends StatelessWidget {
   DrawerComponent({Key? key}) : super(key: key);
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return user != null ?  StudentDrawer():AdminDrawer() ;
  }
}
class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Admin",
              style: TextStyle(fontSize: 25),
            ),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Color(0xff4e058f),
            ),
            decoration: BoxDecoration(color: Colors.deepPurple),
          ),
          MenuItemComponent(Icons.home, "Dashboard", AdminDashboard(), Colors.teal),
          MenuItemComponent(Icons.add_card_rounded, "Add Book", AdminAddBook(), Colors.pink[300]!),
          MenuItemComponent(Icons.chrome_reader_mode_outlined, "View Books", AdminViewBooks(), Colors.lightBlue[400]!),
          MenuItemComponent(Icons.flight, "Issue request", AdminViewIssuedRequest(), Colors.green[400]!),
          MenuItemComponent(Icons.move_down, "Return request", AdminViewReturnedRequest(), Colors.orange[300]!),
          MenuItemComponent(Icons.logout, "Logout", MainScreen(), Colors.red[600]!),


        ],
      ),
    );
  }
}
class StudentDrawer extends StatelessWidget {
  const StudentDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Student",
              style: TextStyle(fontSize: 25),
            ),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Color(0xff4e058f),
            ),
            decoration: BoxDecoration(color: Colors.deepPurple),
          ),
          MenuItemComponent(Icons.home_outlined, "All Books", StudentViewBooks(), Colors.teal),
          MenuItemComponent(Icons.download_for_offline_outlined, "Issued Books", StudentViewIssuedRequests(), Colors.pink[300]!),
          // MenuItemComponent(Icons.add_card_rounded, "Pending Books", AdminDashboard(), Colors.pink[300]!),
         // MenuItemComponent(Icons.history, "Books History", StudentViewBookHistory(), Colors.lightBlue[400]!),
          MenuItemComponent(Icons.pending_outlined, "Track Status", StudentTrackStatus(), Colors.green[400]!),
          // MenuItemComponent(Icons.chrome_reader_mode_outlined, "View Books", AdminViewBooks(), Colors.lightBlue[400]!),
          // MenuItemComponent(Icons.flight, "Issue request", AdminViewIssuedRequest(), Colors.green[400]!),
          // MenuItemComponent(Icons.move_down, "Return request", AdminViewReturnedRequest(), Colors.orange[300]!),
          MenuItemComponent(Icons.logout, "Logout", MainScreen(), Colors.red[400]!),


        ],
      ),
    );
  }
}
