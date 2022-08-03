import 'package:app_prototype/models/user.dart';
import 'package:app_prototype/widgets/grades_card.dart';
import 'package:app_prototype/widgets/overall_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade_enums.dart';
import '../models/user_setting.dart';
import '/models/grade_sheet.dart';
import '/widgets/slivers/barrel.dart';

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
  bool _overallError = false;
  bool _gradesError = false;
  bool _expandUnselected = false;

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
        SliverTitleBar(
          "Overall",
          hasErrors: _overallError,
        ),
        SliverToBoxAdapter(
          child: OverallCard(
              gradeSheet: widget.gradeSheet,
              hasErrors: (hasError) {
                if (hasError)
                  setState(() {
                    _overallError = true;
                    widget.hasErrors(hasError);
                  });
                else
                  setState(() {
                    _overallError = false;
                    widget.hasErrors(hasError);
                  });
              }),
        ),
        SliverTitleBar("Grades", hasErrors: _gradesError),
        SliverToBoxAdapter(
          child: GradesCard(
              student: context.watch<List<UserSetting>>().firstWhere(
                  (user) => user.email == widget.gradeSheet.studentId,
                  orElse: () => UserSetting(
                      name: "f",
                      rank: Rank.capt,
                      squad: "squad",
                      email: "email",
                      adQual: AdQual.acad,
                      pilotQual: PilotQual.fpc)),
              grades: _selectedGrades,
              title: "Grades",
              hasErrors: (hasError) {
                if (hasError)
                  setState(() {
                    _gradesError = true;
                    widget.hasErrors(hasError);
                  });
                else
                  setState(() {
                    _gradesError = false;
                    widget.hasErrors(hasError);
                  });
              }),
        ),
        _unselectedGrades.isNotEmpty
            ? SliverAppBar(
                backgroundColor: Theme.of(context).canvasColor,
                automaticallyImplyLeading: false,
                elevation: 0,
                pinned: true,
                title: Text(
                  "Unselected Grades",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _expandUnselected = !_expandUnselected;
                        });
                      },
                      child: _expandUnselected
                          ? Icon(Icons.expand_less)
                          : Icon(Icons.expand_more),
                    ),
                  )
                ],
              )
            : SliverToBoxAdapter(),

        _expandUnselected
            ? SliverToBoxAdapter(
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
              )
            : SliverToBoxAdapter(),
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
