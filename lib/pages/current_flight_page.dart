import 'dart:async';

import 'package:app_prototype/review_grades.dart';
import 'package:app_prototype/views/flight_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import '../models/grade_sheet.dart';

class CurrentFlightPage extends StatefulWidget {
  const CurrentFlightPage({
    Key? key,
  }) : super(key: key);

  //final List<GradeSheet> gradeSheets;
  //final Map<String, bool> selectedParams;

  @override
  State<CurrentFlightPage> createState() => _CurrentFlightPageState();
}

class _CurrentFlightPageState extends State<CurrentFlightPage> {
  /*final Stopwatch _stopwatch = Stopwatch()..start();
  //int _time = 0;
  String _time = "0";

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    setState(() {
      _time = now.second.toString();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return context.watch<CurrentFlight>().gradeSheets.length == 1
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Proficienct Standards | Grade Desc"),
            ),
            body: FlightView(
              gradeSheet: context.watch<CurrentFlight>().gradeSheets.first,
              //selectedParams: widget.selectedParams,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReviewGrades()));
              },
              tooltip: 'Increment',
              child: const Text("Review"),
            ),
          )
        : DefaultTabController(
            initialIndex: 0,
            length: context.watch<CurrentFlight>().gradeSheets.length,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                    "Proficiency Standards Table Popup | Proficiency Grade Description Popup"),
                bottom: TabBar(
                  tabs: context
                      .watch<CurrentFlight>()
                      .gradeSheets
                      .map((gradeSheet) {
                    return Tab(text: gradeSheet.student);
                  }).toList(),
                ),
              ),

              body: TabBarView(
                children: context
                    .watch<CurrentFlight>()
                    .gradeSheets
                    .map((gradeSheet) {
                  return FlightView(
                    gradeSheet: gradeSheet,
                    //selectedParams: widget.selectedParams,
                  );
                }).toList(),
              ),

              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReviewGrades()));
                },
                tooltip: 'Increment',
                child: const Text("Review"),
              ), // This trailing comma makes auto-formatting nicer for build methods.
            ),
          );
  }
}
