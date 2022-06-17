import 'dart:async';

import 'package:app_prototype/review_grades.dart';
import 'package:app_prototype/views/flight_view.dart';
import 'package:flutter/material.dart';

import '../models/grade_sheet.dart';

class GradingActivity extends StatefulWidget {
  const GradingActivity(
      {Key? key, required this.gradeSheets, required this.selectedParams})
      : super(key: key);

  final List<GradeSheet> gradeSheets;
  final Map<String, bool> selectedParams;

  @override
  State<GradingActivity> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GradingActivity> {
  final Stopwatch _stopwatch = Stopwatch()..start();
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
  }

  @override
  Widget build(BuildContext context) {
    return widget.gradeSheets.length == 1
        ? Scaffold(
            appBar: AppBar(
              title: Text(
                  "Proficienct Standards | Grade Desc | Duration: ${_time}"),
            ),
            body: FlightView(
              gradeSheet: widget.gradeSheets.first,
              selectedParams: widget.selectedParams,
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
            length: widget.gradeSheets.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                    "Proficiency Standards Table Popup | Proficiency Grade Description Popup | Duration: ${_time}"),
                bottom: TabBar(
                  tabs: widget.gradeSheets.map((gradeSheet) {
                    return Tab(text: gradeSheet.student);
                  }).toList(),
                ),
              ),

              body: TabBarView(
                children: widget.gradeSheets.map((gradeSheet) {
                  return FlightView(
                    gradeSheet: gradeSheet,
                    selectedParams: widget.selectedParams,
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
