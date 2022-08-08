import 'package:app_prototype/models/grade_sheet.dart';
import 'package:app_prototype/widgets/spaced_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import '../models/grade_enums.dart';
import 'grade_radio_form_field.dart';

class OverallCard extends StatelessWidget {
  const OverallCard(
      {Key? key, required this.gradeSheet, required this.hasErrors})
      : super(key: key);

  final GradeSheet gradeSheet;
  final ValueChanged<bool> hasErrors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpacedItem(
          name: "Overall Comments",
          child: TextFormField(
            initialValue: gradeSheet.overallComments,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please select a value";
              } else {
                hasErrors(false);
                return null;
              }
            },
            onChanged: (overall) =>
                context.read<CurrentFlight>().updateByStudent(
                    gradeSheet.studentId,
                    GradeSheet(
                      weather: gradeSheet.weather,
                      instructorId: gradeSheet.instructorId,
                      studentId: gradeSheet.studentId,
                      missionNum: gradeSheet.missionNum,
                      grades: gradeSheet.grades,
                      overall: gradeSheet.overall,
                      sortieType: gradeSheet.sortieType,
                      dayNight: gradeSheet.dayNight,
                      startTime: gradeSheet.startTime,
                      endTime: gradeSheet.endTime,
                      overallComments: overall,
                    )),
          ),
        ),
        //ListTile(
        //leading: const Text("Overall"),
        SpacedItem(
          name: "Overall Grade",
          child: GradeRadiosFormField(
            initialValue: gradeSheet.overall,
            validator: (value) {
              if (value == null) {
                hasErrors(true);
                return "Please select a value";
              } else {
                hasErrors(false);
                return null;
              }
            },
            onChanged: (overall) =>
                context.read<CurrentFlight>().updateByStudent(
                    gradeSheet.studentId,
                    GradeSheet(
                      weather: gradeSheet.weather,
                      instructorId: gradeSheet.instructorId,
                      studentId: gradeSheet.studentId,
                      missionNum: gradeSheet.missionNum,
                      grades: gradeSheet.grades,
                      overall: overall,
                      sortieType: gradeSheet.sortieType,
                      dayNight: gradeSheet.dayNight,
                      startTime: gradeSheet.startTime,
                      endTime: gradeSheet.endTime,
                      overallComments: gradeSheet.overallComments,
                    )),
          ),
        ),
        // ),
        SpacedItem(
          name: "Recommendations",
          child: TextFormField(
            initialValue: gradeSheet.recommendations,
            onChanged: (recc) => context.read<CurrentFlight>().updateByStudent(
                gradeSheet.studentId,
                GradeSheet(
                  weather: gradeSheet.weather,
                  instructorId: gradeSheet.instructorId,
                  studentId: gradeSheet.studentId,
                  missionNum: gradeSheet.missionNum,
                  grades: gradeSheet.grades,
                  overall: gradeSheet.overall,
                  sortieType: gradeSheet.sortieType,
                  dayNight: gradeSheet.dayNight,
                  startTime: gradeSheet.startTime,
                  endTime: gradeSheet.endTime,
                  overallComments: gradeSheet.overallComments,
                  recommendations: recc,
                )),
          ),
        ),
      ],
    );
  }
}
