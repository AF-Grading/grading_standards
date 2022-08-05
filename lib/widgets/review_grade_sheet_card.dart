import 'package:app_prototype/widgets/overall_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import '../models/grade_enums.dart';
import '../models/grade_sheet.dart';
import '../models/user.dart';
import '../models/user_setting.dart';
import 'grade_item_tile2.dart';
import 'grades_card.dart';
import 'slivers/sliver_title_bar.dart';

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
        //SliverTitleBar("Grades"),
        Column(
          children: [
            for (GradeItem item in gradeSheet.grades)
              GradeItemTile2(
                gradeItem: item,
                onChanged: (gradeItem) {
                  context
                      .read<CurrentFlight>()
                      .updateByGradeItem(gradeSheet.studentId, gradeItem);
                },
                hasErrors: (_) => {},
              )
          ], /* ((item) => GradeItemTile2(
                    gradeItem: item,
                    onChanged: (gradeItem) {
                      setState(() {
                        final index = _selectedGrades.indexOf(item);
                        _selectedGrades
                            .replaceRange(index, index + 1, [gradeItem]);
                      });
                      context
                          .read<CurrentFlight>()
                          .updateByGradeItem(widget.student.email, gradeItem);
                    },
                    hasErrors: (error) {
                      setState(() {
                        _gradesError = error;
                      });
                    }))
                .toList()) */
        )
      ],
    );
  }
}
