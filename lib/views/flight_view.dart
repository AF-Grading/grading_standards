import 'package:app_prototype/models/current_flight.dart';
import 'package:app_prototype/widgets/grades_card.dart';
import 'package:app_prototype/widgets/overall_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade_enums.dart';
import '../models/user_setting.dart';
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
    return CustomScrollView(
      //body: Column(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          // Removes the back button
          automaticallyImplyLeading: false,
          // Keeps the text at the Top of the screen
          pinned: true,
          elevation: 0,
          expandedHeight: 80,
          title: Text("Overall"),
        ),
        SliverToBoxAdapter(
          child: OverallCard(
              gradeSheet: widget.gradeSheet,
              hasErrors: (hasError) {
                setState(() {
                  widget.hasErrors(hasError);
                });
              }),
        ),
        SliverAppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          automaticallyImplyLeading: false,
          pinned: true,
          elevation: 0,
          expandedHeight: 80,
          title: Text("Grades"),
        ),
        SliverToBoxAdapter(
          child: GradesCard(
              student: context.watch<List<UserSetting>>().firstWhere(
                  (user) => user.email == widget.gradeSheet.studentId),
              grades: _selectedGrades,
              title: "Grades",
              hasErrors: (hasError) {
                setState(() {
                  widget.hasErrors(hasError);
                });
              }),
        ),
        _unselectedGrades.isNotEmpty
            ? SliverAppBar(
                backgroundColor: Theme.of(context).backgroundColor,
                automaticallyImplyLeading: false,
                elevation: 0,
                pinned: true,
                expandedHeight: 80,
                title: Text("Unselected Grades"),
              )
            : SliverToBoxAdapter(),
        SliverToBoxAdapter(
          child: GradesCard(
              student: context.watch<List<UserSetting>>().firstWhere(
                  (user) => user.email == widget.gradeSheet.studentId),
              grades: _unselectedGrades,
              title: "Unused Grades",
              initiallyExpanded: false,
              hasErrors: (hasError) {
                setState(() {
                  widget.hasErrors(hasError);
                });
              }),
        ),
        // Space for the Elevated Button
        SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
      ],
      //),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
