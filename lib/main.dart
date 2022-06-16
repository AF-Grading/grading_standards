import 'package:app_prototype/pages/grading_activity_page.dart';
import 'package:app_prototype/views/individual_reports_view.dart';
import 'package:app_prototype/pages/my_grade_sheets_page.dart';
import 'package:app_prototype/pages/reference_materials_page.dart';
import 'package:app_prototype/pages/settings_page.dart';
import 'package:app_prototype/views/training_shop_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/grade_sheets.dart';
import 'views/new_grade_sheet_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => GradeSheets(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Grading Standards!!!!!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              Tab(text: 'New Grade Sheet'),
              Tab(text: 'Individual Reports'),
              Tab(text: 'Training Shop'),
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
                  MaterialPageRoute(builder: (context) => MyGradeSheetsPage()),
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
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            NewGradeSheetView(),
            IndividualReportsView(),
            TrainingShopView(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          // maybe we can change the animation for how the pages swap when we click the button
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GradingActivity()));
          },
          tooltip: 'Increment',
          child: const Text("Start"),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
