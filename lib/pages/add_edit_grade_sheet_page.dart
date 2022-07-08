import 'package:app_prototype/models/CurrentUser.dart';
import 'package:app_prototype/models/cts_list.dart';
import 'package:app_prototype/pages/grade_sheet_page.dart';
import 'package:app_prototype/widgets/grade_radio_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/grade_enums.dart';
import '../models/grade_sheet.dart';
import '../models/grade_sheets.dart';
import '../models/user.dart';
import '../models/users.dart';
import '../widgets/date_picker.dart';
import '../widgets/day_night_form_field.dart';
import '../widgets/search_users_form_field.dart';
import '../widgets/sortie_type_form_field.dart';
import '../widgets/weather_form_field.dart';

class AddEditGradeSheetPage extends StatefulWidget {
  const AddEditGradeSheetPage({Key? key, this.gradeSheet}) : super(key: key);

  final GradeSheet? gradeSheet;
  //final User? instructor;
  @override
  State<AddEditGradeSheetPage> createState() => _AddEditGradeSheetPageState();
}

class _AddEditGradeSheetPageState extends State<AddEditGradeSheetPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  late bool _isEditing;
  bool _dateError = false;

  late User? _student = widget.gradeSheet?.student;
  late User? _instructor = widget.gradeSheet?.instructor;
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
      TextEditingController(text: widget.gradeSheet?.missionNum.toString());
  late final TextEditingController _sortieNum =
      TextEditingController(text: widget.gradeSheet?.sortieNumber.toString());
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
      for (GradeItem item in baseGradeItems) {
        _grades.add(GradeItem(name: item.name, grade: Grade.noGrade));
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("Student:"),
                              Text(_student!.name),
                              !_isEditing
                                  ? ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _student = null;
                                        });
                                      },
                                      child: const Text("Reselect"))
                                  : Container()
                            ],
                          )
                        : SearchUsersFormField(
                            labelText: "Student Name",
                            users: context.watch<Users>().users,
                            validator: (value) {
                              if (value != null) {
                                return "Please select a student from dropdown";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (student) {
                              setState(() {
                                _student = context
                                    .read<Users>()
                                    .users
                                    .firstWhere((user) => user.name == student);
                              });
                            },
                          ),
                    _instructor != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text("Instructor: "),
                              Text(_instructor!.name),
                              // only certain permissions can select an instructor that isnt themselves
                              context.watch<CurrentUser>().permission.index > 2
                                  ? ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _instructor = null;
                                        });
                                      },
                                      child: const Text("Reselect"))
                                  : Container(),
                            ],
                          )
                        : SearchUsersFormField(
                            labelText: "Instructor Name",
                            users: context.watch<Users>().users,
                            validator: (value) {
                              if (value != null) {
                                return "Please select an instructor from dropdown";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (instructor) {
                              setState(() {
                                _instructor = context
                                    .read<Users>()
                                    .users
                                    .firstWhere(
                                        (user) => user.name == instructor);
                              });
                            },
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
                    GradeRadiosFormField(
                      initialValue: _overall,
                      validator: (value) {
                        if (value == null || value == Grade.noSelection) {
                          return "Please select a value";
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {
                        _overall = value;
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherFormField(
                            initialValue: _weather,
                            validator: (value) {
                              if (value == null ||
                                  value == Weather.noSelection) {
                                return "Please select a value";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _weather = value;
                              });
                            }),
                        DayNightFormField(
                            initialValue: _dayNight,
                            validator: (value) {
                              if (value == null ||
                                  value == DayNight.noSelection) {
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
                    SortieTypeFormField(
                        initialValue: _sortieType,
                        validator: (value) {
                          if (value == null ||
                              value == SortieType.noSelection) {
                            return "Please select a value";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _sortieType = value;
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _missionN,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
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
                          Expanded(
                            child: TextFormField(
                              controller: _sortieNum,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                labelText: "Sortie Number",
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    int.tryParse(value)! < 0 ||
                                    int.tryParse(value)! > 20) {
                                  return "Please enter a number, 0-20";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _sortiePro,
                        decoration: const InputDecoration(
                          labelText: "Sortie Profile",
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
                                    if (value == null ||
                                        value == Grade.noSelection) {
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
              )
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
                String id = context.read<GradeSheets>().updateById(
                      GradeSheet(
                        id: _isEditing ? widget.gradeSheet!.id : null,
                        instructor: _instructor!,
                        student: _student!,
                        missionNum: int.tryParse(_missionN.text) ??
                            0, //_missionNum != null ? _missionNum! : 0,
                        grades: _grades,
                        overall: _overall!,
                        weather: _weather!,
                        dayNight: _dayNight!,
                        sortieType: _sortieType!,
                        startTime: _startTime!,
                        endTime: _endTime!,
                        sortieNumber: int.tryParse(_sortieNum.text) ?? 0,
                        profile: _sortiePro.text,
                        overallComments: _overallC.text, //_overallComments!,
                        recommendations: _reccs.text,
                        length: _endTime!.difference(_startTime!).toString(),
                      ),
                    );
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
