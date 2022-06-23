import 'package:app_prototype/models/grade_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import 'grade_radio_form_field.dart';

class GradesCard extends StatelessWidget {
  const GradesCard({Key? key, required this.gradeSheet}) : super(key: key);

  final GradeSheet gradeSheet;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: const Text("Grade Items"),
        children: gradeSheet.grades
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
                            gradeSheet.student,
                            GradeItem(
                                name: item.name,
                                comments: item.comments,
                                grade: grade),
                          ),
                ),
                subtitle: TextFormField(
                  initialValue: item.comments,
                  decoration: const InputDecoration(
                    labelText: "Comments",
                  ),
                  onChanged: (comment) {
                    context.read<CurrentFlight>().updateByGradeItem(
                          gradeSheet.student,
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
    );
  }
}
