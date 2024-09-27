import 'package:flutter/material.dart';
import 'package:libraryapp/components/AppBarComponent.dart';
import 'package:libraryapp/components/DashboardCard.dart';
import 'package:libraryapp/components/DrawerComponent.dart';

import '../services/dashboardservice.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {

  int tbooks = 0;
  int tstudents = 0;
  int tpending = 0;
  int tissued = 0;
  int treturned = 0;

  DashboardService dashboardService = DashboardService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showValues();

  }

  showValues()async {
    int books = await dashboardService.getCount("books");
    int student = await dashboardService.getCount("students");
    int returned = await dashboardService.getReturned("bookrequests");
    int issued = await dashboardService.getIssued("bookrequests");


    setState(() {
      tbooks = books;
      tstudents = student;
      treturned = returned;
      tissued = issued;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarComponent("Dashboard"),

      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DashboardCard(Icons.book,"Total Books",tbooks,Colors.black54,Color(0xff424242)),
              DashboardCard(Icons.book,"Total Student",tstudents,Color(0xffc74d48),Color(0xffff6a67)),
              DashboardCard(Icons.book,"Returned Requests",treturned,Color(0xff397b6d),Color(0xff4ea997)),
              DashboardCard(Icons.book,"Issued Requests",tissued,Color(0xff5911a6),Colors.deepPurple,),
            ],
          ),
        ),
      ),
    );
  }
}