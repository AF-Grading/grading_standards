import 'package:flutter/material.dart';

import 'grade_item_tile.dart';
import '/models/grade_sheet.dart';
import '/models/user_setting.dart';

class GradesCard extends StatelessWidget {
  const GradesCard({
    Key? key,
    //required this.gradeSheet,
    required this.student,
    required this.grades,
    required this.hasErrors,
    this.title,
    this.initiallyExpanded = true,
  }) : super(key: key);

  //final GradeSheet gradeSheet;
  final UserSetting student;
  final List<GradeItem> grades;
  final String? title;
  final bool initiallyExpanded;
  final ValueChanged<bool> hasErrors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: grades
          .map(
            (item) => GradeItemTile(
                gradeItem: item, student: student, hasErrors: hasErrors),
          )
          .toList(),
    );
  }
}
