import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cts_list.dart';
import '../models/user.dart';
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

  bool hasErrors = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: hasErrors
            ? Text("Student: ${widget.gradeSheet.studentId}",
                style: const TextStyle(color: Colors.red))
            : Text("Student: ${widget.gradeSheet.studentId}"),
        initiallyExpanded: true,
        children: [
          int.tryParse(widget.gradeSheet.studentId) == null
              ? ElevatedButton(
                  onPressed: () =>
                      context.read<CurrentFlight>().updateByStudent(
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
                  labelText: "Student Name",
                  //obtains list of users that filters out already used students
                  users: context.watch<CurrentFlight>().filteredUsers,
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
                          studentId:
                              context.read<Users>().userByName(student).email,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Preselect Grading Paramaters:"),
              const Text("Free Select"),
              Radio<GradingParams>(
                value: GradingParams.freeSelect,
                groupValue: _gradingParams,
                onChanged: (GradingParams? value) {
                  setState(() {
                    _gradingParams = value!;
                  });
                },
              ),
              const Text("All"),
              Radio<GradingParams>(
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
              const Text("Formation and Airdrop"),
              Radio<GradingParams>(
                value: GradingParams.formationAndAirdop,
                groupValue: _gradingParams,
                onChanged: (GradingParams? value) {
                  setState(() {
                    _gradingParams = value!;
                  });
                },
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
            ],
          ),
          SizedBox(
            height: 400,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 4,
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
      ),
    );
  }
}
