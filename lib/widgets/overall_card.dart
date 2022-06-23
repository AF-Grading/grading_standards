import 'package:app_prototype/models/grade_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import '../models/grade_enums.dart';
import 'grade_radio_form_field.dart';

class OverallCard extends StatelessWidget {
  const OverallCard({Key? key, required this.gradeSheet}) : super(key: key);

  final GradeSheet gradeSheet;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: const Text("Overall"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: gradeSheet.overallComments,
              decoration: const InputDecoration(
                labelText: "Overall Comments",
              ),
              onChanged: (overall) =>
                  context.read<CurrentFlight>().updateByStudent(
                      gradeSheet.student,
                      GradeSheet(
                        instructor: gradeSheet.instructor,
                        student: gradeSheet.student,
                        missionNum: gradeSheet.missionNum,
                        grades: gradeSheet.grades,
                        overall: gradeSheet.overall,
                        sortieType: gradeSheet.sortieType,
                        dayNight: gradeSheet.dayNight,
                        startTime: gradeSheet.startTime,
                        endTime: gradeSheet.endTime,
                        sortieNumber: gradeSheet.sortieNumber,
                        length: gradeSheet.length,
                        overallComments: overall,
                      )),
            ),
          ),
          ListTile(
            leading: const Text("Overall"),
            title: GradeRadiosFormField(
              initialValue: gradeSheet.overall,
              validator: (value) {
                if (value == null || value == Grade.noSelection) {
                  return "Please select a value";
                }
                return null;
              },
              onChanged: (overall) =>
                  context.read<CurrentFlight>().updateByStudent(
                      gradeSheet.student,
                      GradeSheet(
                        instructor: gradeSheet.instructor,
                        student: gradeSheet.student,
                        missionNum: gradeSheet.missionNum,
                        grades: gradeSheet.grades,
                        overall: overall,
                        sortieType: gradeSheet.sortieType,
                        dayNight: gradeSheet.dayNight,
                        startTime: gradeSheet.startTime,
                        endTime: gradeSheet.endTime,
                        sortieNumber: gradeSheet.sortieNumber,
                        length: gradeSheet.length,
                        overallComments: gradeSheet.overallComments,
                      )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: gradeSheet.recommendations,
                    decoration: const InputDecoration(
                      labelText: "Recommendation/Next",
                    ),
                    onChanged: (recc) =>
                        context.read<CurrentFlight>().updateByStudent(
                            gradeSheet.student,
                            GradeSheet(
                              instructor: gradeSheet.instructor,
                              student: gradeSheet.student,
                              missionNum: gradeSheet.missionNum,
                              grades: gradeSheet.grades,
                              overall: gradeSheet.overall,
                              sortieType: gradeSheet.sortieType,
                              dayNight: gradeSheet.dayNight,
                              startTime: gradeSheet.startTime,
                              endTime: gradeSheet.endTime,
                              sortieNumber: gradeSheet.sortieNumber,
                              length: gradeSheet.length,
                              overallComments: gradeSheet.overallComments,
                              recommendations: recc,
                            )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
