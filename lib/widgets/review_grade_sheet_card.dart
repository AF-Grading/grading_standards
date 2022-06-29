import 'package:app_prototype/widgets/overall_card.dart';
import 'package:flutter/material.dart';

import '../models/grade_sheet.dart';
import 'grades_card.dart';

class ReviewGradeSheetCard extends StatelessWidget {
  const ReviewGradeSheetCard({Key? key, required this.gradeSheet})
      : super(key: key);

  final GradeSheet gradeSheet;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(gradeSheet.student.name),
        initiallyExpanded: true,
        children: [
          OverallCard(
            gradeSheet: gradeSheet,
            // TODO Implement?
            hasErrors: (_) {},
          ),
          GradesCard(
            student: gradeSheet.student,
            grades: gradeSheet.grades,
          ),
        ],
      ),
    );
  }
}
