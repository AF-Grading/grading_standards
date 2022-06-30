import 'package:app_prototype/views/individual_reports_view.dart';
import 'package:app_prototype/pages/my_grade_sheets_page.dart';
import 'package:app_prototype/pages/reference_materials_page.dart';
import 'package:app_prototype/pages/settings_page.dart';
import 'package:app_prototype/views/new_flight_view.dart';
import 'package:app_prototype/views/training_shop_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'New Flight'),
              Tab(text: 'Individual Reports'),
              Tab(
                text: 'Training Shop',
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Grading Standards',
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
                  MaterialPageRoute(builder: (context) =>  SettingsPage()),
                );
              },
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            //NewGradeSheetView(),
            NewFlightView(),
            IndividualReportsView(),
            TrainingShopView(),
          ],
        ),
      ),
    );
  }
}
