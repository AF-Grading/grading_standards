import 'package:app_prototype/widgets/overall_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import '../models/grade_enums.dart';
import '../models/grade_sheet.dart';
import '../models/user.dart';
import '../models/user_setting.dart';
import 'grades_card.dart';

class ReviewGradeSheetCard extends StatelessWidget {
  const ReviewGradeSheetCard({Key? key, required this.gradeSheet})
      : super(key: key);

  final GradeSheet gradeSheet;

  @override
  Widget build(BuildContext context) {
    return Column(
      //title: Text(gradeSheet.studentId),
      //initiallyExpanded: true,
      children: [
        OverallCard(
          gradeSheet: gradeSheet,
          // TODO Implement?
          hasErrors: (_) {},
        ),
        GradesCard(
          title: "Graded Items",
          student: context.read<List<UserSetting>>().firstWhere(
              (user) => user.email == gradeSheet.studentId,
              orElse: () => UserSetting(
                  name: "f",
                  rank: Rank.capt,
                  squad: "squad",
                  email: "email",
                  adQual: AdQual.acad,
                  pilotQual: PilotQual.fpc)),
          grades: gradeSheet.grades
              .where((item) => item.grade != Grade.noGrade)
              .toList(),
          hasErrors: (_) {},
        ),
        /*GradesCard(
          title: "Ungraded",
          initiallyExpanded: false,
          student: context
              .watch<List<UserSetting>>()
              .firstWhere((user) => user.email == gradeSheet.studentId),
          grades: gradeSheet.grades
              .where((item) => item.grade == Grade.noGrade)
              .toList(),
          hasErrors: (_) {},
        ),*/
      ],
    );
  }
}
