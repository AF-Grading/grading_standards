import 'package:app_prototype/widgets/date_picker.dart';
import 'package:app_prototype/widgets/editable_ad_qual.dart';
import 'package:app_prototype/widgets/editable_day_night_item.dart';
import 'package:app_prototype/widgets/editable_sortie_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//internal imports
import '../models/cts_list.dart';
import '../models/grade_sheet.dart';
import '../models/grade_sheets.dart';
import '../widgets/editable_grade_item.dart';
import '../widgets/editable_pilot_qual_item.dart';

class EditGradeSheetPage extends StatefulWidget {
  const EditGradeSheetPage(
      {Key? key, this.newSheet = false, required this.gradeSheet})
      : super(key: key);

  final bool newSheet;
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
        title: const Text("Edit Grade Sheet"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //adds the grade sheet TODO: ensure good values
          widget.newSheet
              ? context.read<GradeSheets>().add(_gradeSheet)
              : context.read<GradeSheets>().edit(_gradeSheet);
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
                //color: Colors.black12,
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
                              ),
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
                              initialValue:
                                  widget.gradeSheet.missionNum.toString(),
                              decoration: const InputDecoration(
                                labelText: "Mission Number",
                              ),
                              onSaved: (value) => widget.gradeSheet.missionNum =
                                  int.parse(value!),
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
                              ),
                              onSaved: (value) => widget
                                  .gradeSheet.sortieNumber = int.parse(value!),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          // consider some sort of time picker here
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              initialValue: widget.gradeSheet.length,
                              decoration: const InputDecoration(
                                labelText: "Length",
                              ),
                              onSaved: (value) =>
                                  widget.gradeSheet.length = value!,
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
                              ),
                              onSaved: (value) =>
                                  widget.gradeSheet.weather = value!,
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
                              ),
                              onSaved: (value) =>
                                  widget.gradeSheet.profile = value!,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const SizedBox(
                              width: 150, child: Text("Overall Grade")),
                          Flexible(
                            flex: 1,
                            //width: context.size. * .2,
                            child: ListTile(
                              title: const Text('NG'),
                              leading: Radio<Grade>(
                                value: Grade.noGrade,
                                groupValue: _gradeSheet.overall,
                                onChanged: (Grade? value) {
                                  setState(() {
                                    _gradeSheet.overall = value!;
                                    //_overall = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: ListTile(
                              title: const Text('0'),
                              leading: Radio<Grade>(
                                value: Grade.unsatisfactory,
                                groupValue: _gradeSheet.overall,
                                onChanged: (Grade? value) {
                                  setState(() {
                                    _gradeSheet.overall = value!;

                                    // _overall = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: ListTile(
                              title: const Text('1'),
                              leading: Radio<Grade>(
                                value: Grade.introductory,
                                groupValue: _gradeSheet.overall,
                                onChanged: (Grade? value) {
                                  setState(() {
                                    _gradeSheet.overall = value!;

                                    //_overall = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: ListTile(
                              title: const Text('2'),
                              leading: Radio<Grade>(
                                value: Grade.familiar,
                                groupValue: _gradeSheet.overall,
                                onChanged: (Grade? value) {
                                  setState(() {
                                    _gradeSheet.overall = value!;

                                    //_overall = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: ListTile(
                              title: const Text('3'),
                              leading: Radio<Grade>(
                                value: Grade.proficient,
                                groupValue: _gradeSheet.overall,
                                onChanged: (Grade? value) {
                                  setState(() {
                                    _gradeSheet.overall = value!;

                                    //_overall = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: ListTile(
                              title: const Text('4'),
                              dense: true,
                              leading: Radio<Grade>(
                                value: Grade.expert,
                                groupValue: _gradeSheet.overall,
                                onChanged: (Grade? value) {
                                  setState(() {
                                    _gradeSheet.overall = value!;

                                    //_overall = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
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
                              ),
                              onSaved: (value) =>
                                  widget.gradeSheet.overallComments = value!,
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
                              ),
                              onSaved: (value) =>
                                  widget.gradeSheet.recommendations = value!,
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
                              gradeSheet: widget.gradeSheet),
                        ),
                        Flexible(
                          flex: 1,
                          child: DatePicker(date: widget.gradeSheet.date),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: EditablePilotQualItem(
                                gradeSheet: widget.gradeSheet)),
                        Flexible(
                            flex: 1,
                            child: EditableADQual(
                                adQual: widget.gradeSheet.adQual))
                      ],
                    ),
                    EditableSortieType(
                        sortieType: widget.gradeSheet.sortieType),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  title: const Text("Grade Items"),
                  children: widget.gradeSheet.grades
                      .map((item) => EditableGradeItem(gradeItem: item))
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
