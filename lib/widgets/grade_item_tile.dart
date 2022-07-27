import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cts_list.dart';
import '../models/current_flight.dart';
import '../models/grade_sheet.dart';
import '../models/user_setting.dart';
import 'grade_radio_form_field.dart';
import 'passing_score_text_field.dart';

class GradeItemTile extends StatelessWidget {
  const GradeItemTile({
    Key? key,
    required this.gradeItem,
    required this.student,
    required this.hasErrors,
  }) : super(key: key);

  final GradeItem gradeItem;
  final UserSetting student;
  final ValueChanged<bool> hasErrors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  gradeItem.name,
                  style: TextStyle(fontSize: 16),
                  maxLines: 2,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                var ctsItem = ctsItems
                    .firstWhere((ctsItem) => gradeItem.name == ctsItem.name);
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(ctsItem.name),
                    content: Text(ctsItem.standards),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () =>
                              Navigator.pop(context, 'Back to grading'),
                          child: const Text("Back to grading"))
                    ],
                  ),
                );
              },
              child: Icon(
                Icons.info_outline,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PassingScoreTextField(
                ctsItem: ctsItems
                    .firstWhere((ctsItem) => gradeItem.name == ctsItem.name),
                student: student,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GradeRadiosFormField(
            initialValue: gradeItem.grade,
            validator: (value) {
              if (value == null) {
                return "Please select a value";
              } else {
                hasErrors(false);
                return null;
              }
            },
            onChanged: (grade) =>
                context.read<CurrentFlight>().updateByGradeItem(
                      student.email,
                      GradeItem(
                          name: gradeItem.name,
                          //comments: item.comments,
                          grade: grade),
                    ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextFormField(
            initialValue: gradeItem.comments,
            decoration: const InputDecoration(
              hintText: "Comments",
            ),
            style: TextStyle(fontSize: 14),
            onChanged: (comment) {
              context.read<CurrentFlight>().updateByGradeItem(
                    student.email,
                    GradeItem(
                      name: gradeItem.name,
                      comments: comment,
                      //grade: item.grade,
                    ),
                  );
            },
          ),
        ),
      ]),
    );
  }
}
