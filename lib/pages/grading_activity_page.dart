import 'package:app_prototype/review_grades.dart';
import 'package:app_prototype/views/flight_view.dart';
import 'package:flutter/material.dart';

import '../models/grade_sheet.dart';

class GradingActivity extends StatefulWidget {
  const GradingActivity({Key? key, required this.gradeSheets})
      : super(key: key);

  final List<GradeSheet> gradeSheets;

  @override
  State<GradingActivity> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GradingActivity> {
  final Stopwatch _stopwatch = Stopwatch();

  @override
  void initState() {
    _stopwatch.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: widget.gradeSheets.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              "Proficiency Standards Table Popup | Proficiency Grade Description Popup | Duration: ${_stopwatch.elapsedMilliseconds}"),
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
            );
          }).toList(),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ReviewGrades()));
          },
          tooltip: 'Increment',
          child: const Text("Review"),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
