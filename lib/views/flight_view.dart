import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import '../models/grade_enums.dart';
import '/models/grade_sheet.dart';
import '/widgets/grade_radio_form_field.dart';

class FlightView extends StatefulWidget {
  const FlightView({
    Key? key,
    required this.index,
    required this.gradeSheet,
  }) : super(key: key);

  final int index;
  final GradeSheet gradeSheet;

  @override
  State<FlightView> createState() => _FlightViewState();
}

class _FlightViewState extends State<FlightView> {
  late List<GradeItem> _selectedGrades;
  late List<GradeItem> _unselectedGrades;

  @override
  void initState() {
    _selectedGrades = widget.gradeSheet.grades
        .where((gradeItem) => gradeItem.grade == Grade.noSelection)
        .toList();

    _unselectedGrades = widget.gradeSheet.grades
        .where((gradeItem) => gradeItem.grade == Grade.noGrade)
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: context.read<CurrentFlight>().flightKeys[
            context.watch<CurrentFlight>().index(widget.gradeSheet.student)],
        child: Column(
          children: [
            Card(
              child: ExpansionTile(
                initiallyExpanded: true,
                title: const Text("Overall"),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Overall Comments",
                      ),
                      onChanged: (overall) =>
                          context.read<CurrentFlight>().updateByStudent(
                              widget.gradeSheet.student,
                              GradeSheet(
                                instructor: widget.gradeSheet.instructor,
                                student: widget.gradeSheet.student,
                                missionNum: widget.gradeSheet.missionNum,
                                grades: widget.gradeSheet.grades,
                                overall: widget.gradeSheet.overall,
                                sortieType: widget.gradeSheet.sortieType,
                                dayNight: widget.gradeSheet.dayNight,
                                startTime: widget.gradeSheet.startTime,
                                endTime: widget.gradeSheet.endTime,
                                sortieNumber: widget.gradeSheet.sortieNumber,
                                length: widget.gradeSheet.length,
                                overallComments:
                                    widget.gradeSheet.overallComments,
                              )),
                    ),
                  ),
                  ListTile(
                    leading: const Text("Overall"),
                    title: GradeRadiosFormField(
                      validator: (value) {
                        if (value == null) {
                          return "Please select a value";
                        }
                        return null;
                      },
                      onChanged: (overall) =>
                          context.read<CurrentFlight>().updateByStudent(
                              widget.gradeSheet.student,
                              GradeSheet(
                                instructor: widget.gradeSheet.instructor,
                                student: widget.gradeSheet.student,
                                missionNum: widget.gradeSheet.missionNum,
                                grades: widget.gradeSheet.grades,
                                overall: overall,
                                sortieType: widget.gradeSheet.sortieType,
                                dayNight: widget.gradeSheet.dayNight,
                                startTime: widget.gradeSheet.startTime,
                                endTime: widget.gradeSheet.endTime,
                                sortieNumber: widget.gradeSheet.sortieNumber,
                                length: widget.gradeSheet.length,
                                overallComments:
                                    widget.gradeSheet.overallComments,
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
                            decoration: const InputDecoration(
                              labelText: "Recommendation/Next",
                            ),
                            onChanged: (recc) =>
                                context.read<CurrentFlight>().updateByStudent(
                                    widget.gradeSheet.student,
                                    GradeSheet(
                                      instructor: widget.gradeSheet.instructor,
                                      student: widget.gradeSheet.student,
                                      missionNum: widget.gradeSheet.missionNum,
                                      grades: widget.gradeSheet.grades,
                                      overall: widget.gradeSheet.overall,
                                      sortieType: widget.gradeSheet.sortieType,
                                      dayNight: widget.gradeSheet.dayNight,
                                      startTime: widget.gradeSheet.startTime,
                                      endTime: widget.gradeSheet.endTime,
                                      sortieNumber:
                                          widget.gradeSheet.sortieNumber,
                                      length: widget.gradeSheet.length,
                                      overallComments:
                                          widget.gradeSheet.overallComments,
                                      recommendations: recc,
                                    )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: ExpansionTile(
                initiallyExpanded: true,
                title: const Text("Grade Items"),
                children: _selectedGrades
                    .map(
                      (item) => ListTile(
                        leading: Text(item.name),
                        title: GradeRadiosFormField(
                          validator: (value) {
                            if (value == null) {
                              return "Please select a value";
                            }
                            return null;
                          },
                          onChanged: (grade) =>
                              context.read<CurrentFlight>().updateByGradeItem(
                                    widget.gradeSheet.student,
                                    GradeItem(
                                        name: item.name,
                                        comments: item.comments,
                                        grade: grade),
                                  ),
                        ),
                        subtitle: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Comments",
                          ),
                          onChanged: (comment) {
                            context.read<CurrentFlight>().updateByGradeItem(
                                  widget.gradeSheet.student,
                                  GradeItem(
                                      name: item.name,
                                      comments: comment,
                                      grade: item.grade),
                                );
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Card(
              child: ExpansionTile(
                initiallyExpanded: false,
                title: const Text("Unused Grades"),
                children: _unselectedGrades
                    .map(
                      (item) => ListTile(
                        leading: Text(item.name),
                        title: GradeRadiosFormField(
                          initialValue: item.grade,
                          validator: (value) {
                            if (value == null) {
                              return "Please select a value";
                            }
                            return null;
                          },
                          onChanged: (grade) =>
                              context.read<CurrentFlight>().updateByGradeItem(
                                    widget.gradeSheet.student,
                                    GradeItem(
                                        name: item.name,
                                        comments: item.comments,
                                        grade: grade),
                                  ),
                        ),
                        subtitle: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Comments",
                          ),
                          onChanged: (comment) {
                            context.read<CurrentFlight>().updateByGradeItem(
                                  widget.gradeSheet.student,
                                  GradeItem(
                                      name: item.name,
                                      comments: comment,
                                      grade: item.grade),
                                );
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
