import 'package:flutter/material.dart';

import '../models/grade_sheet.dart';

class ReviewGradeSheetCard extends StatelessWidget {
  const ReviewGradeSheetCard({Key? key, required this.gradeSheet})
      : super(key: key);

  final GradeSheet gradeSheet;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(gradeSheet.student),
      ),
    );
  }
}
