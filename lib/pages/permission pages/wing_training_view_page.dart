import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/CurrentUser.dart';
import '../../views/individual_reports_view.dart';
import '../../views/new_flight_view.dart';
import '../../views/training_shop_view.dart';
import '../my_grade_sheets_page.dart';
import '../reference_materials_page.dart';
import '../settings_page.dart';

class WingTrainingViewPage extends StatefulWidget {
  @override
  _WingTrainingViewPageState createState() => _WingTrainingViewPageState();
}

class _WingTrainingViewPageState extends State<WingTrainingViewPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Wing Training"),
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
            TrainingShopView(),
          ],
        ),
      ),
    );
  }
}
