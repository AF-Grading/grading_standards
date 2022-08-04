import 'package:app_prototype/widgets/user_name_text_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cts_list.dart';
import '../models/user.dart';
import '../models/user_setting.dart';
import '../models/users.dart';
import '../views/new_grade_sheet_view.dart';
import '/models/current_flight.dart';
import '/models/grade_sheet.dart';
import 'search_users_form_field.dart';

class StudentParamSelectionCard extends StatefulWidget {
  const StudentParamSelectionCard({Key? key, required this.gradeSheet})
      : super(key: key);

  final GradeSheet gradeSheet;

  @override
  State<StudentParamSelectionCard> createState() =>
      _StudentParamSelectionCardState();
}

class _StudentParamSelectionCardState extends State<StudentParamSelectionCard> {
  GradingParams _gradingParams = GradingParams.all;
  final Map<String, bool> _selectedParams = {
    for (CTSItem item in ctsItems) item.name: true
  };

  final double spaceBetween = 150;
  bool hasErrors = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        int.tryParse(widget.gradeSheet.studentId) == null
            ? ElevatedButton(
                onPressed: () => context.read<CurrentFlight>().updateByStudent(
                    widget.gradeSheet.studentId,
                    GradeSheet(
                      instructorId: widget.gradeSheet.instructorId,
                      studentId: "0",
                      missionNum: widget.gradeSheet.missionNum,
                      grades: widget.gradeSheet.grades,
                      overall: widget.gradeSheet.overall,
                      sortieType: widget.gradeSheet.sortieType,
                      dayNight: widget.gradeSheet.dayNight,
                      startTime: widget.gradeSheet.startTime,
                      endTime: widget.gradeSheet.endTime,
                      weather: widget.gradeSheet.weather,
                    )),
                child: const Text("Select a different student"))
            : SearchUsersFormField(
                labelText: "Student Name: ",
                //obtains list of users that filters out already used students
                users: context
                    .watch<List<UserSetting>>()
                    .where((user) =>
                        context.watch<CurrentFlight>().gradeSheets.indexWhere(
                            (sheet) => sheet.studentId == user.email) ==
                        -1)
                    .toList(),
                validator: (value) {
                  // A bit of a bruteish method
                  if (widget.gradeSheet.studentId == "1" ||
                      widget.gradeSheet.studentId == "2" ||
                      widget.gradeSheet.studentId == "3" ||
                      widget.gradeSheet.studentId == "4" ||
                      widget.gradeSheet.studentId == "0") {
                    setState(() {
                      hasErrors = true;
                    });
                    return "Please select a student from dropdown";
                  } else {
                    setState(() {
                      hasErrors = false;
                    });
                    return null;
                  }
                },
                onSaved: (student) {
                  context.read<CurrentFlight>().updateByStudent(
                      widget.gradeSheet.studentId,
                      GradeSheet(
                        instructorId: widget.gradeSheet.instructorId,
                        studentId: context
                            .read<List<UserSetting>>()
                            .firstWhere((user) => user.email == student)
                            .email,
                        missionNum: widget.gradeSheet.missionNum,
                        grades: widget.gradeSheet.grades,
                        overall: widget.gradeSheet.overall,
                        sortieType: widget.gradeSheet.sortieType,
                        dayNight: widget.gradeSheet.dayNight,
                        startTime: widget.gradeSheet.startTime,
                        endTime: widget.gradeSheet.endTime,
                        weather: widget.gradeSheet.weather,
                      ));
                  setState(() {
                    hasErrors = false;
                  });
                },
              ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              children: MediaQuery.of(context).size.width > 900
                  ?
                  // build wide
                  [
                      Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: const Text("Preselect Grading Paramaters:")),
                      const Text("Free Select"),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Radio<GradingParams>(
                          value: GradingParams.freeSelect,
                          groupValue: _gradingParams,
                          onChanged: (GradingParams? value) {
                            setState(() {
                              _gradingParams = value!;
                            });
                          },
                        ),
                      ),
                      const Text("All"),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Radio<GradingParams>(
                          value: GradingParams.all,
                          groupValue: _gradingParams,
                          onChanged: (GradingParams? value) {
                            setState(() {
                              _gradingParams = value!;
                              // set all params to true
                              _selectedParams.forEach((key, value) {
                                _selectedParams[key] = true;
                              });
                            });
                            context.read<CurrentFlight>().updateParamsByStudent(
                                widget.gradeSheet.studentId, _selectedParams);
                          },
                        ),
                      ),
                      const Text("Formation and Airdrop"),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Radio<GradingParams>(
                          value: GradingParams.formationAndAirdop,
                          groupValue: _gradingParams,
                          onChanged: (GradingParams? value) {
                            setState(() {
                              _gradingParams = value!;
                              // set all params to false except airdrop
                              for (CTSItem item in ctsItems) {
                                if (item.isAirdrop) {
                                  _selectedParams[item.name] = true;
                                } else {
                                  _selectedParams[item.name] = false;
                                }
                              }
                            });
                          },
                        ),
                      ),
                      const Text("None"),
                      Radio<GradingParams>(
                        value: GradingParams.none,
                        groupValue: _gradingParams,
                        onChanged: (GradingParams? value) {
                          setState(() {
                            _gradingParams = value!;
                            // set all params to false
                            _selectedParams.forEach((key, value) {
                              _selectedParams[key] = false;
                            });
                          });
                          context.read<CurrentFlight>().updateParamsByStudent(
                              widget.gradeSheet.studentId, _selectedParams);
                        },
                      ),
                    ]
                  :
                  // build narrow
                  [
                      SizedBox(
                          width: spaceBetween,
                          child: Text("Grading Paramaters:")),
                      DropdownButton(
                        items: const [
                          DropdownMenuItem(
                            value: GradingParams.freeSelect,
                            child: Text("Free Select"),
                          ),
                          DropdownMenuItem(
                            value: GradingParams.all,
                            child: Text("All"),
                          ),
                          DropdownMenuItem(
                            value: GradingParams.formationAndAirdop,
                            child: Text("Formation and Airdrop"),
                          ),
                          DropdownMenuItem(
                            value: GradingParams.none,
                            child: Text("None"),
                          ),
                        ],
                        value: _gradingParams,
                        onChanged: (GradingParams? value) {
                          if (value == GradingParams.all) {
                            setState(() {
                              _gradingParams = value!;
                              // set all params to true
                              _selectedParams.forEach((key, value) {
                                _selectedParams[key] = true;
                              });
                            });
                          } else if (value ==
                              GradingParams.formationAndAirdop) {
                            setState(() {
                              _gradingParams = value!;
                              // set all params to false except airdrop
                              for (CTSItem item in ctsItems) {
                                if (item.isAirdrop) {
                                  _selectedParams[item.name] = true;
                                } else {
                                  _selectedParams[item.name] = false;
                                }
                              }
                            });
                          } else if (value == GradingParams.none) {
                            setState(() {
                              _gradingParams = value!;
                              // set all params to false
                              _selectedParams.forEach((key, value) {
                                _selectedParams[key] = false;
                              });
                            });
                          } else {
                            setState(() {
                              _gradingParams = value!;
                            });
                          }
                          context.read<CurrentFlight>().updateParamsByStudent(
                              widget.gradeSheet.studentId, _selectedParams);
                        },
                      ),
                    ]),
        ),
        SizedBox(
          height: 400,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
              childAspectRatio: MediaQuery.of(context).size.width > 600 ? 4 : 6,
            ),
            itemCount: ctsItems.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 200,
                height: 100,
                child: ListTile(
                  title: GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text(ctsItems[index].name),
                        content: Text(ctsItems[index].standards),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Back to grading'),
                              child: const Text("Back to grading"))
                        ],
                      ),
                    ),
                    child: Text(ctsItems[index].name),
                  ),
                  leading: Checkbox(
                    value: _selectedParams[ctsItems[index].name],
                    onChanged: (value) {
                      setState(() {
                        _selectedParams[ctsItems[index].name] = value!;
                        _gradingParams = GradingParams.freeSelect;
                      });
                      context.read<CurrentFlight>().updateParamsByStudent(
                          widget.gradeSheet.studentId, _selectedParams);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
