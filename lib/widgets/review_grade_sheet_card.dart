import 'package:app_prototype/widgets/overall_card.dart';
import 'package:flutter/material.dart';

import '../models/grade_enums.dart';
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
        title: Text(gradeSheet.studentId),
        initiallyExpanded: true,
        children: [
          OverallCard(
            gradeSheet: gradeSheet,
            // TODO Implement?
            hasErrors: (_) {},
          ),
          GradesCard(
            title: "Graded Items",
            student: gradeSheet.studentId,
            grades: gradeSheet.grades
                .where((item) => item.grade != Grade.noGrade)
                .toList(),
            hasErrors: (_) {},
          ),
          GradesCard(
            title: "Ungraded",
            initiallyExpanded: false,
            student: gradeSheet.studentId,
            grades: gradeSheet.grades
                .where((item) => item.grade == Grade.noGrade)
                .toList(),
            hasErrors: (_) {},
          ),
        ],
      ),
    );
  }
}
