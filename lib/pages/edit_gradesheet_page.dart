import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
//internal imports
import '../models/grade_sheet.dart';
import '../models/grade_sheets.dart';
import '../widgets/editable_grade_item.dart';
import '../widgets/editable_pilot_qual_item.dart';
import '../widgets/date_picker.dart';
import '../widgets/editable_ad_qual.dart';
import '../widgets/editable_day_night_item.dart';
import '../widgets/editable_grade_radios.dart';
import '../widgets/editable_sortie_type.dart';

class EditGradeSheetPage extends StatefulWidget {
  const EditGradeSheetPage({Key? key, required this.gradeSheet})
      : super(key: key);

  final GradeSheet gradeSheet;

  @override
  State<EditGradeSheetPage> createState() => _EditGradeSheetPageState();
}

class _EditGradeSheetPageState extends State<EditGradeSheetPage> {
  final _formKey = GlobalKey<FormState>();

  late GradeSheet _gradeSheet;

  @override
  void initState() {
    _gradeSheet = widget.gradeSheet;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Edit Grade Sheet    instructor: ${_gradeSheet.instructor}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //adds the grade sheet TODO: ensure good values
          context.read<GradeSheets>().update(_gradeSheet);
          Navigator.pop(context);
        },
        tooltip: 'Save',
        child: const Text("Save"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: ExpansionTile(
                  title: const Text("Overall"),
                  initiallyExpanded: true,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: widget.gradeSheet.student,
                              decoration: const InputDecoration(
                                  labelText: "Student",
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0)),
                              onChanged: (value) {
                                setState(() {
                                  _gradeSheet.student = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              initialValue:
                                  widget.gradeSheet.missionNum.toString(),
                              decoration: const InputDecoration(
                                labelText: "Mission Number",
                                contentPadding:
                                    const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              ),
                              onChanged: (value) => setState(() {
                                // tryparse needed because of empty string else error
                                _gradeSheet.missionNum =
                                    int.tryParse(value) ?? 0;
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue:
                                  widget.gradeSheet.sortieNumber.toString(),
                              decoration: const InputDecoration(
                                  labelText: "Sortie Number",
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0)),
                              onChanged: (value) => setState(() {
                                _gradeSheet.sortieNumber = int.parse(value);
                              }),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          // consider some sort of time picker here
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: _gradeSheet.length,
                              decoration: const InputDecoration(
                                  labelText: "Length",
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0)),
                              onChanged: (value) => setState(() {
                                _gradeSheet.length = value;
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: widget.gradeSheet.weather,
                              decoration: const InputDecoration(
                                  labelText: "Weather",
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0)),
                              onChanged: (value) => setState(() {
                                _gradeSheet.weather = value;
                              }),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: widget.gradeSheet.profile,
                              decoration: const InputDecoration(
                                  labelText: "Profile",
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0)),
                              onChanged: (value) => setState(
                                () {
                                  _gradeSheet.profile = value;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    EditableGradeRadios(
                      name: "Overall Grade",
                      grade: _gradeSheet.overall,
                      onChanged: (value) {
                        setState(
                          () {
                            _gradeSheet.overall = value;
                          },
                        );
                      },
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: widget.gradeSheet.overallComments,
                              decoration: const InputDecoration(
                                  labelText: "Overall Comments",
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0)),
                              onChanged: (value) => setState(
                                () {
                                  _gradeSheet.overallComments = value;
                                },
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: widget.gradeSheet.recommendations,
                              decoration: const InputDecoration(
                                  labelText: "Recommendations",
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0)),
                              onChanged: (value) => setState(() {
                                _gradeSheet.recommendations = value;
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: EditableDayNightItem(
                            dayNight: _gradeSheet.dayNight,
                            onChanged: (value) {
                              setState(() {
                                _gradeSheet.dayNight = value;
                              });
                            },
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: DatePicker(
                              date: widget.gradeSheet.startTime,
                              onChanged: (value) => setState(() {
                                    _gradeSheet.startTime = value;
                                  })),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: EditablePilotQualItem(
                            pilotQual: _gradeSheet.pilotQual,
                            onChanged: (value) => setState(() {
                              _gradeSheet.pilotQual = value;
                            }),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: DatePicker(
                              date: widget.gradeSheet.startTime,
                              onChanged: (value) => setState(() {
                                    _gradeSheet.startTime = value;
                                  })),
                        ),
                      ],
                    ),
                    EditablePilotQualItem(
                      pilotQual: _gradeSheet.pilotQual,
                      onChanged: (value) => setState(() {
                        _gradeSheet.pilotQual = value;
                      }),
                    ),
                    EditableADQual(
                      adQual: _gradeSheet.adQual,
                      onChanged: (value) => setState(() {
                        _gradeSheet.adQual = value;
                      }),
                    ),
                    EditableSortieType(
                      sortieType: _gradeSheet.sortieType,
                      onChanged: (value) => setState(() {
                        _gradeSheet.sortieType = value;
                      }),
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  title: const Text("Grade Items"),
                  children: _gradeSheet.grades
                      .map((item) => EditableGradeItem(
                            gradeItem: item,
                            onChanged: (value) {
                              setState(() {
                                final grades = _gradeSheet.grades;
                                _gradeSheet.grades[grades.indexOf(item)] =
                                    value;
                              });
                            },
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
