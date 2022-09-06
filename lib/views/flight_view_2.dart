import 'package:app_prototype/models/current_flight.dart';
import 'package:app_prototype/models/grade_sheet.dart';
import 'package:app_prototype/models/grading_parameter.dart';
import 'package:app_prototype/widgets/grade_item_tile2.dart';
import 'package:app_prototype/widgets/grade_radio_form_field.dart';
import 'package:app_prototype/widgets/spaced_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade_enums.dart';
import '../models/user_setting.dart';
import '../widgets/grade_item_tile.dart';
import '../widgets/grades_card.dart';
import '../widgets/slivers/sliver_title_bar.dart';

class FlightView2 extends StatefulWidget {
  const FlightView2(
      {Key? key,
      required this.gradeSheet,
      required this.params,
      required this.student,
      required this.hasErrors})
      : super(key: key);

  final ValueChanged<bool> hasErrors;
  final GradeSheet gradeSheet;
  final GradingParameter params;
  final UserSetting student;

  @override
  State<FlightView2> createState() => _FlightView2State();
}

class _FlightView2State extends State<FlightView2>
    with AutomaticKeepAliveClientMixin {
  bool _overallError = false;
  bool _gradesError = false;

  final List<GradeItem> _selectedGrades = [];
  final List<GradeItem> _unselectedGrades = [];

  bool _expandUnselected = false;

  @override
  void initState() {
    for (Param param in widget.params.params) {
      if (param.isUsed) {
        _selectedGrades.add(GradeItem(name: param.gradingItem));
      } else {
        _unselectedGrades
            .add(GradeItem(name: param.gradingItem, grade: Grade.noGrade));
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverTitleBar(
          "Overall",
          hasErrors: _overallError,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SpacedItem(
                name: "Overall Comments",
                child: TextFormField(
                  minLines: 1,
                  maxLines: 10,
                  onChanged: (value) => context.read<CurrentFlight>().update(
                      widget.gradeSheet.copyWith(overallComments: value)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        widget.hasErrors(true);
                        _overallError = true;
                      });
                      return "Please type a comment";
                    }
                    setState(() {
                      widget.hasErrors(false);
                      _overallError = false;
                    });
                    context.read<CurrentFlight>().update(
                        widget.gradeSheet.copyWith(overallComments: value));
                    return null;
                  },
                ),
              ),
              SpacedItem(
                name: "Overall Grade",
                child: GradeRadiosFormField(
                  //initialValue: widget.gradeSheet.overall,
                  onChanged: (value) => context
                      .read<CurrentFlight>()
                      .update(widget.gradeSheet.copyWith(overall: value)),
                  validator: (value) {
                    if (value == null) {
                      setState(() {
                        widget.hasErrors(true);
                        _overallError = true;
                      });
                      return "Please type a comment";
                    }
                    setState(() {
                      widget.hasErrors(false);
                      _overallError = false;
                    });
                    context
                        .read<CurrentFlight>()
                        .update(widget.gradeSheet.copyWith(overall: value));
                    return null;
                  },
                ),
              ),
              SpacedItem(
                name: "Recommendations",
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      context.read<CurrentFlight>().update(
                          widget.gradeSheet.copyWith(recommendations: value));
                    }
                    return null;
                  },
                ),
              )
            ],
          ),
        ),
        SliverTitleBar("Grades", hasErrors: _gradesError),
        SliverToBoxAdapter(
          child: Column(
              children: _selectedGrades
                  .map((item) => GradeItemTile2(
                      student: widget.student,
                      gradeItem: item,
                      onChanged: (gradeItem) {
                        setState(() {
                          final index = _selectedGrades
                              .indexWhere((ie) => ie.name == item.name);
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
                  .toList()),
        ),
        _unselectedGrades.isNotEmpty
            ? SliverAppBar(
                backgroundColor: Theme.of(context).canvasColor,
                automaticallyImplyLeading: false,
                elevation: 0,
                pinned: true,
                title: GestureDetector(
                  onTap: () {
                    setState(() {
                      _expandUnselected = !_expandUnselected;
                    });
                  },
                  child: Text(
                    "Unselected Grades",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
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
                child: Column(
                    children: _unselectedGrades
                        .map((item) => GradeItemTile2(
                            student: widget.student,
                            gradeItem: item,
                            onChanged: (gradeItem) {
                              setState(() {
                                final index = _unselectedGrades
                                    .indexWhere((ie) => ie.name == item.name);
                                _unselectedGrades.replaceRange(
                                    index, index + 1, [gradeItem]);
                              });
                              context.read<CurrentFlight>().updateByGradeItem(
                                  widget.student.email, gradeItem);
                            },
                            hasErrors: (error) {
                              setState(() {
                                _gradesError = error;
                              });
                            }))
                        .toList()),
              )
            : SliverToBoxAdapter(),
        // Space for the Elevated Button
        SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
