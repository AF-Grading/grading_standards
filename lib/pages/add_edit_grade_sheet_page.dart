import 'package:app_prototype/models/grading_criterion.dart';
import 'package:app_prototype/widgets/spaced_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/application_state.dart';
import '../models/grade_enums.dart';
import '../models/grade_sheet.dart';
import '../models/grade_sheets.dart';
import '../models/user.dart';
import '../models/user_setting.dart';
import '../models/users.dart';
import '../widgets/date_picker.dart';
import '../widgets/form_fields/day_night_form_field.dart';
import '../widgets/search_users_form_field.dart';
import '../widgets/form_fields/sortie_type_form_field.dart';
import '../widgets/form_fields/weather_form_field.dart';
import '../models/current_user.dart';
import '/models/cts_list.dart';
import '/pages/grade_sheet_page.dart';
import '/widgets/grade_radio_form_field.dart';

class AddEditGradeSheetPage extends StatefulWidget {
  const AddEditGradeSheetPage(
      {Key? key,
      this.gradeSheet,
      required this.gradingCriteria,
      required this.users})
      : super(key: key);

  final GradeSheet? gradeSheet;
  final List<GradingCriterion> gradingCriteria;
  final List<UserSetting> users;
  //final User? instructor;
  @override
  State<AddEditGradeSheetPage> createState() => _AddEditGradeSheetPageState();
}

class _AddEditGradeSheetPageState extends State<AddEditGradeSheetPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  late bool _isEditing;
  bool _dateError = false;

  UserSetting? _student; //= widget.gradeSheet?.studentId;
  UserSetting? _instructor; // = widget.gradeSheet?.instructorId;
  final List<GradeItem> _grades = [];
  late Grade? _overall = widget.gradeSheet?.overall;
  late Weather? _weather = widget.gradeSheet?.weather;
  late DayNight? _dayNight = widget.gradeSheet?.dayNight;
  late SortieType? _sortieType = widget.gradeSheet?.sortieType;
  late DateTime? _startTime = widget.gradeSheet?.startTime ?? DateTime.now();
  late DateTime? _endTime = widget.gradeSheet?.endTime ?? DateTime.now();
  late final TextEditingController _overallC =
      TextEditingController(text: widget.gradeSheet?.overallComments);
  late final TextEditingController _missionN =
      TextEditingController(text: widget.gradeSheet?.missionNum);
  late final TextEditingController _sortiePro =
      TextEditingController(text: widget.gradeSheet?.profile);
  late final TextEditingController _reccs =
      TextEditingController(text: widget.gradeSheet?.recommendations);

  @override
  void initState() {
    _isEditing = widget.gradeSheet != null ? true : false;

    if (widget.gradeSheet?.grades != null) {
      for (GradeItem item in widget.gradeSheet!.grades) {
        _grades.add(item);
      }
    } else {
      for (GradingCriterion item in widget.gradingCriteria) {
        _grades.add(GradeItem(name: item.criterion, grade: Grade.noGrade));
      }
    }

    if (_isEditing) {
      _student = widget.users.firstWhere(
          (element) => element.email == widget.gradeSheet!.studentId);
      _instructor = widget.users.firstWhere(
          (element) => element.email == widget.gradeSheet!.instructorId);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double spaceBetween = 150;

    return Form(
      key: _key,
      child: Scaffold(
        appBar:
            AppBar(title: _isEditing ? const Text("Edit") : const Text("Add")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: const Text("General"),
                  children: [
                    _student != null
                        ? SpacedItem(
                            name: _student!.name,
                            child: !_isEditing
                                ? ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _student = null;
                                      });
                                    },
                                    child: const Text("Reselect"))
                                : Container())
                        : SearchUsersFormField(
                            title: "Student Name",
                            //labelText: "Student Name: ",
                            users: widget.users,
                            validator: (value) {
                              if (value != null) {
                                return "Please select a student from dropdown";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (student) {
                              setState(() {
                                _student = widget.users.firstWhere(
                                    (user) => user.email == student);
                              });
                            },
                          ),
                    _instructor != null
                        ? SpacedItem(
                            name: _instructor!.name,
                            child: !_isEditing
                                ? ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _instructor = null;
                                      });
                                    },
                                    child: const Text("Reselect"))
                                : Container())
                        : SearchUsersFormField(
                            title: "Instructor Name",
                            //labelText: "Instructor Name: ",
                            users: widget.users,
                            validator: (value) {
                              if (value != null) {
                                return "Please select an instructor from dropdown";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (instructor) {
                              setState(() {
                                _instructor = widget.users.firstWhere(
                                    (user) => user.email == instructor);
                              });
                            },
                          ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
                      child: GradeRadiosFormField(
                        initialValue: _overall,
                        validator: (value) {
                          if (value == null) {
                            return "Please select a value";
                          }
                          return null;
                        },
                        onChanged: (value) => setState(() {
                          _overall = value;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _overallC,
                        decoration: const InputDecoration(
                          labelText: "Overall Comments",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter comments";
                          }
                          return null;
                        },
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: spaceBetween,
                                child: Text("Weather: "),
                              ),
                              WeatherFormField(
                                  initialValue: _weather,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Please select a value";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _weather = value;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: spaceBetween,
                                child: Text("Time of Day: "),
                              ),
                              DayNightFormField(
                                  initialValue: _dayNight,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Please select a value";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _dayNight = value;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: spaceBetween,
                                  child: Text("Sortie Type: ")),
                              SortieTypeFormField(
                                  initialValue: _sortieType,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Please select a value";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _sortieType = value;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    /* Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _missionN,
                              decoration: const InputDecoration(
                                labelText: "Mission Number",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a number";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ), */
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _sortiePro,
                        decoration: const InputDecoration(
                          labelText: "Flight Information (No sortie profile)",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a value";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _reccs,
                        decoration: const InputDecoration(
                          labelText: "Recommendations",
                        ),
                      ),
                    ),
                    DatePicker(
                        date: _startTime ?? DateTime.now(),
                        onChanged: (value) => setState(() {
                              _startTime = value;
                            })),
                    DatePicker(
                        date: _endTime,
                        onChanged: (value) => setState(() {
                              _endTime = value;
                            })),
                    _endTime != null && _startTime != null
                        ? _endTime!.difference(_startTime!).inSeconds > 0
                            ? Text(
                                "Duration: ${_endTime!.difference(_startTime!).toString()}",
                              )
                            : Text(
                                "Duration: ${_endTime!.difference(_startTime!).toString()}",
                                style: const TextStyle(color: Colors.red))
                        : Text(
                            "Duration: ",
                            style: _dateError
                                ? const TextStyle(color: Colors.red)
                                : null,
                          ),
                  ],
                ),
              ),
              // TODO if all the grades are no grade, disallow continuing
              Card(
                child: ExpansionTile(
                  title: const Text("Grade Items"),
                  initiallyExpanded: true,
                  children: _grades
                      .map(
                        (item) => Card(
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      var ctsItem = ctsItems.firstWhere(
                                          (ctsItem) =>
                                              item.name == ctsItem.name);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: Text(ctsItem.name),
                                          content: Text(ctsItem.standards),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Back to grading'),
                                                child: const Text(
                                                    "Back to grading"))
                                          ],
                                        ),
                                      );
                                    },
                                    child: Text(item.name),
                                  ),
                                ),
                              ),
                              GradeRadiosFormField(
                                  initialValue: item.grade,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Please select a value";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (grade) => setState(() {
                                        item.grade = grade;
                                      })),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  initialValue: item.comments,
                                  decoration: const InputDecoration(
                                    labelText: "Comments",
                                  ),
                                  onChanged: (comment) {
                                    setState(() {
                                      item.comments = comment;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_key.currentState!.validate()) {
              if (_endTime == null ||
                  _startTime == null ||
                  _endTime!.difference(_startTime!).inSeconds <= 0) {
                setState(() {
                  _dateError = true;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Date Must be Greater than 0"),
                  ),
                );
              } else {
                GradeSheet gradeSheet = GradeSheet(
                  id: _isEditing ? widget.gradeSheet!.id : null,
                  instructorId: _instructor!.email,
                  studentId: _student!.email,
                  missionNum: "",
                  //_missionN.text, //_missionNum != null ? _missionNum! : 0,
                  grades: _grades,
                  overall: _overall!,
                  weather: _weather!,
                  dayNight: _dayNight!,
                  sortieType: _sortieType!,
                  startTime: _startTime!,
                  endTime: _endTime!,
                  profile: _sortiePro.text,
                  overallComments: _overallC.text, //_overallComments!,
                  recommendations: _reccs.text,
                );

                String id = context.read<GradeSheets>().updateById(gradeSheet);

                _isEditing
                    ? context
                        .read<ApplicationState>()
                        .editGradeSheet(gradeSheet)
                    : context
                        .read<ApplicationState>()
                        .addGradeSheet(gradeSheet);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Grade Sheet Added"),
                  ),
                );
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GradeSheetPage(
                      gradeSheet: context
                          .read<GradeSheets>()
                          .gradeSheets
                          .firstWhere((sheet) => sheet.id == id),
                    ),
                  ),
                );
              }
            }
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
