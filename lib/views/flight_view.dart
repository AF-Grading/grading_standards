import 'package:app_prototype/widgets/grades_card.dart';
import 'package:app_prototype/widgets/overall_card.dart';
import 'package:flutter/material.dart';

import '../models/grade_enums.dart';
import '/models/grade_sheet.dart';

class FlightView extends StatefulWidget {
  const FlightView({
    Key? key,
    required this.index,
    required this.gradeSheet,
    required this.hasErrors,
  }) : super(key: key);

  final int index;
  final GradeSheet gradeSheet;
  final ValueChanged<bool> hasErrors;

  @override
  State<FlightView> createState() => _FlightViewState();
}

// KeepAlive mixin makes it so all tabs are validated
class _FlightViewState extends State<FlightView>
    with AutomaticKeepAliveClientMixin {
  late List<GradeItem> _selectedGrades;
  late List<GradeItem> _unselectedGrades;
  bool hasErrors = false;

  @override
  void initState() {
    _selectedGrades = widget.gradeSheet.grades
        .where((gradeItem) => gradeItem.grade != Grade.noGrade)
        .toList();

    _unselectedGrades = widget.gradeSheet.grades
        .where((gradeItem) => gradeItem.grade == Grade.noGrade)
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          OverallCard(
              gradeSheet: widget.gradeSheet,
              hasErrors: (hasError) {
                setState(() {
                  widget.hasErrors(hasError);
                });
              }),
          GradesCard(
              student: widget.gradeSheet.student,
              grades: _selectedGrades,
              title: "Grades",
              hasErrors: (hasError) {
                setState(() {
                  widget.hasErrors(hasError);
                });
              }),
          GradesCard(
              student: widget.gradeSheet.student,
              grades: _unselectedGrades,
              title: "Unused Grades",
              initiallyExpanded: false,
              hasErrors: (hasError) {
                setState(() {
                  widget.hasErrors(hasError);
                });
              }),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
