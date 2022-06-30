import 'package:app_prototype/views/individual_reports_view.dart';
import 'package:app_prototype/pages/my_grade_sheets_page.dart';
import 'package:app_prototype/pages/reference_materials_page.dart';
import 'package:app_prototype/pages/settings_page.dart';
import 'package:app_prototype/views/new_flight_view.dart';
import 'package:app_prototype/views/training_shop_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import 'current_flight_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _controller;
  int _index = 0;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() => setState(() {
          _index = _controller.index;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.watch<CurrentFlight>().newKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            controller: _controller,
            tabs: const [
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
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ]),
        ),
        body: TabBarView(
          controller: _controller,
          children: const [
            //NewGradeSheetView(),
            NewFlightView(),
            IndividualReportsView(),
            TrainingShopView(),
          ],
        ),
        floatingActionButton: _index == 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        String? message =
                            context.read<CurrentFlight>().subtract();
                        if (message != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                            ),
                          );
                        }
                      },
                      tooltip: "Subtract Student",
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                        tooltip: "Add Student",
                        onPressed: () {
                          String? message = context.read<CurrentFlight>().add();
                          if (message != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                              ),
                            );
                          }
                        },
                        child: const Icon(Icons.add)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      // TODO if already pressed, instead have a resume flight button
                      tooltip: "Start Flight",
                      child: const Icon(Icons.airplanemode_active),
                      onPressed: () {
                        if (context
                            .read<CurrentFlight>()
                            .newKey
                            .currentState!
                            .validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CurrentFlightPage(),
                            ),
                          );
                          // TODO if in a flight, dont do this
                          context.read<CurrentFlight>().start();
                        }
                      },
                    ),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
