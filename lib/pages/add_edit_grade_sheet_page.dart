import 'package:app_prototype/models/CurrentUser.dart';
import 'package:app_prototype/models/cts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/grade_enums.dart';
import '../models/grade_sheet.dart';
import '../models/user.dart';
import '../models/users.dart';
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

  User? _student;
  User? _instructor;
  int? _missionNum;
  late List<GradeItem> _grades;
  Grade? _overall;
  //final AdQual adQual;
  //final PilotQual pilotQual;
  Weather? _weather;
  DayNight? _dayNight;
  SortieType? _sortieType;
  DateTime? _startTime;
  DateTime? _endTime;
  int? _sortieNumber; // 1-20
  String? _profile; //unsure what this means
  String? _overallComments;
  String? _recommendations;

  @override
  void initState() {
    _isEditing = widget.gradeSheet != null ? true : false;
    _instructor = widget.gradeSheet?.instructor;
    _student = widget.gradeSheet?.student;
    _missionNum = widget.gradeSheet?.missionNum;
    _grades = widget.gradeSheet?.grades != null
        ? widget.gradeSheet!.grades
        : baseGradeItems;
    _overall = widget.gradeSheet?.overall;
    _weather = widget.gradeSheet?.weather;
    _dayNight = widget.gradeSheet?.dayNight;
    _sortieType = widget.gradeSheet?.sortieType;
    _profile = widget.gradeSheet?.profile;
    _overallComments = widget.gradeSheet?.overallComments;
    _recommendations = widget.gradeSheet?.recommendations;
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
                  title: const Text("Overall"),
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
                              if (value!.isEmpty) {
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
                    //context.watch<CurrentUser>().user.permission.index > 2
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
                              if (value!.isEmpty) {
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
                                initialValue: _missionNum.toString(),
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
                                onChanged: (value) => setState(() {
                                      _missionNum == int.tryParse(value) ?? 0;
                                    })),
                          ),
                          Expanded(
                            child: TextFormField(
                                initialValue: _sortieNumber != null
                                    ? _sortieNumber.toString()
                                    : "",
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
                                onChanged: (value) => setState(() {
                                      _sortieNumber = int.tryParse(value) ?? 0;
                                    })),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          initialValue: _profile,
                          decoration: const InputDecoration(
                            labelText: "Sortie Profile",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a value";
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() {
                                _profile = value;
                              })),
                    ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  title: Text("Grade Items"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
