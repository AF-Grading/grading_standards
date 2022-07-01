import 'package:app_prototype/pages/permission%20pages/student_view_page.dart';
import 'package:app_prototype/views/individual_reports_view.dart';
import 'package:app_prototype/pages/my_grade_sheets_page.dart';
import 'package:app_prototype/pages/reference_materials_page.dart';
import 'package:app_prototype/pages/settings_page.dart';
import 'package:app_prototype/views/new_flight_view.dart';
import 'package:app_prototype/views/training_shop_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/CurrentUser.dart';
import '../models/current_flight.dart';
import '../models/grade_sheets.dart';
import 'current_flight_page.dart';
import 'training_shop_page.dart';

class HomePageOld extends StatefulWidget {
  HomePageOld({Key? key, required this.title, required this.permission})
      : super(key: key);

  final String title;
  final int permission;

  @override
  State<HomePageOld> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageOld> with TickerProviderStateMixin {
  late TabController _controller;
  int _index = 0;
  late int tabLength;

  @override
  void initState() {
    if (widget.permission == 0) {
      tabLength = 1;
    } else if (widget.permission == 1) {
      tabLength = 3;
    } else if (widget.permission > 1) {
      tabLength = 3;
    }

    _controller = TabController(length: tabLength, vsync: this);
    _controller.addListener(() => setState(() {
          _index = _controller.index;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.watch<CurrentFlight>().newKey,
      child: tabLength == 1
          ? StudentViewPage()
          : Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
                bottom: widget.permission == 1
                    ? TabBar(
                        controller: _controller,
                        tabs: const [
                          Tab(text: 'New Flight'),
                          Tab(text: 'Individual Reports'),
                          Tab(
                            text: 'Squadron View',
                          ),
                        ],
                      )
                    : TabBar(
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
                            builder: (context) =>
                                const ReferenceMaterialsPages()),
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
                children: widget.permission == 1
                    ? [
                        //NewGradeSheetView(),
                        NewFlightView(),
                        IndividualReportsView(),
                        TrainingShopPage(
                          gradeSheets: context.watch<GradeSheets>().gradeSheets,
                          squad: context.read<CurrentUser>().user.squad,
                        ),
                      ]
                    : const [
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
                                String? message =
                                    context.read<CurrentFlight>().add();
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
                                    builder: (context) =>
                                        const CurrentFlightPage(),
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
