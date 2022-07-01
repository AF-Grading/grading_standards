import 'package:app_prototype/pages/training_shop_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/CurrentUser.dart';
import '../../models/grade_sheets.dart';
import '../../views/individual_reports_view.dart';
import '../../views/new_flight_view.dart';
import '../../views/training_shop_view.dart';
import '../my_grade_sheets_page.dart';
import '../reference_materials_page.dart';
import '../settings_page.dart';

class InstructorViewPage extends StatefulWidget {
  @override
  _InstructorViewPageState createState() => _InstructorViewPageState();
}

class _InstructorViewPageState extends State<InstructorViewPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              "Welcome, Instructor " + context.read<CurrentUser>().user.name),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'New Flight'),
              Tab(text: 'Individual Reports'),
              Tab(
                text: 'Squadron Performance',
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                context.watch<CurrentUser>().user.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('My Grade Sheets'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyGradeSheetsPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Reference Materials'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReferenceMaterialsPages()),
                );
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            NewFlightView(),
            IndividualReportsView(),
            // need to change the individual report view to only views
            // of the students that this specifis instructor have graded
            // or view of the people that is in this instructors squadron
            
            TrainingShopPage(
              gradeSheets: context.watch<GradeSheets>().gradeSheets,
              squad: context.read<CurrentUser>().user.squad,
            ),
          ],
        ),
      ),
    );
  }
}
