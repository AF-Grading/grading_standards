import 'package:app_prototype/models/grade_sheet.dart';
import 'package:flutter/material.dart';

import '../models/grade_enums.dart';
import '../widgets/editable_grade_item.dart';
import '../widgets/editable_grade_radios.dart';

class FlightView extends StatefulWidget {
  const FlightView(
      {Key? key, required this.gradeSheet, required this.selectedParams})
      : super(key: key);

  final GradeSheet gradeSheet;
  final Map<String, bool> selectedParams;

  @override
  State<FlightView> createState() => _FlightViewState();
}

class _FlightViewState extends State<FlightView> {
  String _overallComments = "";
  Grade _overall = Grade.noGrade;
  String _recommendation = "";
  String _profile = "";
  late GradeSheet _gradeSheet;
  late List<GradeItem> _selectedGrades;
  late List<GradeItem> _unselectedGrades;

  @override
  void initState() {
    _gradeSheet = widget.gradeSheet;
    _selectedGrades = _gradeSheet.grades
        .where((gradeItem) => widget.selectedParams[gradeItem.name]!)
        .toList();

    _unselectedGrades = _gradeSheet.grades
        .where((gradeItem) => !widget.selectedParams[gradeItem.name]!)
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: ExpansionTile(
              initiallyExpanded: true,
              title: const Text("Overall"),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Overall Comments",
                    ),
                    onChanged: (value) => setState(() {
                      _overallComments = value;
                    }),
                  ),
                ),
                EditableGradeRadios(
                  name: "Overall Grade",
                  grade: _overall,
                  onChanged: (value) {
                    setState(
                      () {
                        _overall = value;
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Recommendation/Next",
                          ),
                          onChanged: (value) => setState(() {
                            _recommendation = value;
                          }),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Profile",
                          ),
                          onChanged: (value) => setState(() {
                            _profile = value;
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: ExpansionTile(
              initiallyExpanded: true,
              title: const Text("Grade Items"),
              children: _selectedGrades
                  .map((item) => EditableGradeItem(
                        gradeItem: item,
                        onChanged: (value) {
                          setState(() {
                            final grades = _selectedGrades;
                            _selectedGrades[grades.indexOf(item)] = value;
                          });
                        },
                      ))
                  .toList(),
            ),
          ),
          Card(
            child: ExpansionTile(
              initiallyExpanded: false,
              title: const Text("Unused Grades"),
              children: _unselectedGrades
                  .map((item) => EditableGradeItem(
                        gradeItem: item,
                        onChanged: (value) {
                          setState(() {
                            final grades = _unselectedGrades;
                            _unselectedGrades[grades.indexOf(item)] = value;
                          });
                        },
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
