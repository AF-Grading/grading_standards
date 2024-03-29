import 'package:app_prototype/widgets/form_fields/sortie_type_form_field.dart';
import 'package:app_prototype/widgets/spaced_item.dart';
import 'package:app_prototype/widgets/student_param_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/cts_list.dart';
import '../models/grade_sheet.dart';
import '../models/user_setting.dart';
import '../widgets/search_users_form_field.dart';
import '../widgets/form_fields/weather_form_field.dart';
import '/models/current_flight.dart';
import '../widgets/form_fields/day_night_form_field.dart';
import '/widgets/slivers/barrel.dart';

class NewFlightView extends StatelessWidget {
  const NewFlightView({Key? key}) : super(key: key);

  final double spaceBetween = 150;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverTitleBar("General"),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: spaceBetween,
                      child: Text("Mission Number: "),
                    ),
                    Flexible(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a value";
                          }
                          return null;
                        },
                        onChanged: (value) =>
                            context.read<CurrentFlight>().missionNum = value,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: spaceBetween,
                      child: Text("Weather: "),
                    ),
                    WeatherFormField(validator: (value) {
                      if (value == null) {
                        return "Please select a value";
                      }
                      return null;
                    }, onChanged: (value) {
                      context.read<CurrentFlight>().weather = value;
                    }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: spaceBetween, child: Text("Sortie Type: ")),
                    SortieTypeFormField(validator: (value) {
                      if (value == null) {
                        return "Please select a value";
                      }
                      return null;
                    }, onChanged: (value) {
                      context.read<CurrentFlight>().sortieType = value;
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
                    DayNightFormField(validator: (value) {
                      if (value == null) {
                        return "Please select a value";
                      }
                      return null;
                    }, onChanged: (value) {
                      context.read<CurrentFlight>().dayNight = value;
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
                      child: Text("Sortie Profile: "),
                    ),
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Sortie Profile",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a value";
                          }
                          return null;
                        },
                        onChanged: (value) =>
                            context.read<CurrentFlight>().profile = value,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        for (GradeSheet gradeSheet
            in context.watch<CurrentFlight>().gradeSheets) ...[
          SliverTitleBar(
            gradeSheet.studentId == "1" ||
                    gradeSheet.studentId == "2" ||
                    gradeSheet.studentId == "3" ||
                    gradeSheet.studentId == "4" ||
                    gradeSheet.studentId == "0"
                ? "Student"
                : context
                    .watch<List<UserSetting>>()
                    .firstWhere((user) => user.email == gradeSheet.studentId)
                    .name,
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              int.tryParse(gradeSheet.studentId) == null
                  ? ElevatedButton(
                      onPressed: () =>
                          context.read<CurrentFlight>().updateByStudent(
                              gradeSheet.studentId,
                              GradeSheet(
                                instructorId: gradeSheet.instructorId,
                                studentId: "0",
                                missionNum: gradeSheet.missionNum,
                                grades: gradeSheet.grades,
                                overall: gradeSheet.overall,
                                sortieType: gradeSheet.sortieType,
                                dayNight: gradeSheet.dayNight,
                                startTime: gradeSheet.startTime,
                                endTime: gradeSheet.endTime,
                                weather: gradeSheet.weather,
                              )),
                      child: const Text("Select a different student"))
                  : SearchUsersFormField(
                      title: "Student Name",
                      //labelText: "Student Name: ",
                      //obtains list of users that filters out already used students
                      users: context
                          .watch<List<UserSetting>>()
                          .where((user) =>
                              context
                                  .watch<CurrentFlight>()
                                  .gradeSheets
                                  .indexWhere((sheet) =>
                                      sheet.studentId == user.email) ==
                              -1)
                          .toList(),
                      validator: (value) {
                        // A bit of a bruteish method
                        if (gradeSheet.studentId == "1" ||
                            gradeSheet.studentId == "2" ||
                            gradeSheet.studentId == "3" ||
                            gradeSheet.studentId == "4" ||
                            gradeSheet.studentId == "0") {
                          /*setState(() {
                      hasErrors = true;
                    });*/
                          return "Please select a student from dropdown";
                        } else {
                          /*setState(() {
                      hasErrors = false;
                    });*/
                          return null;
                        }
                      },
                      onSaved: (student) {
                        context.read<CurrentFlight>().updateByStudent(
                            gradeSheet.studentId,
                            GradeSheet(
                              instructorId: gradeSheet.instructorId,
                              studentId: context
                                  .read<List<UserSetting>>()
                                  .firstWhere((user) => user.email == student)
                                  .email,
                              missionNum: gradeSheet.missionNum,
                              grades: gradeSheet.grades,
                              overall: gradeSheet.overall,
                              sortieType: gradeSheet.sortieType,
                              dayNight: gradeSheet.dayNight,
                              startTime: gradeSheet.startTime,
                              endTime: gradeSheet.endTime,
                              weather: gradeSheet.weather,
                            ));
                        /*setState(() {
                    hasErrors = false;
                  });*/
                      },
                    ),
            ],
          ) //StudentParamSelectionCard(gradeSheet: gradeSheet),
              ),
          /*SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                for (CTSItem item in ctsItems)
                  SizedBox(
                    width: 200,
                    height: 100,
                    child: ListTile(
                        title: GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text(item.name),
                              content: Text(item.standards),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () => Navigator.pop(
                                        context, 'Back to grading'),
                                    child: const Text("Back to grading"))
                              ],
                            ),
                          ),
                          child: Text(item.name),
                        ),
                        leading: Text(
                            "heh") /*Checkbox(
                    value: _selectedParams[item.name],
                    onChanged: (value) {
                      setState(() {
                        _selectedParams[item.name] = value!;
                        _gradingParams = GradingParams.freeSelect;
                      });
                      context.read<CurrentFlight>().updateParamsByStudent(
                          widget.gradeSheet.studentId, _selectedParams);
                    },
                  ),*/
                        ),
                  )
              ],
            ),
          ),*/
        ]
      ],
    );

    /*SingleChildScrollView(child: LayoutBuilder(
      builder: (context, constraints) {
        if (MediaQuery.of(context).size.width > 600) {
          // build wide
          return Column(
            children: [
              // GENERAL
              Card(
                child: ExpansionTile(
                  title: const Text("General"),
                  initiallyExpanded: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Mission Number",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a value";
                                }
                                return null;
                              },
                              onChanged: (value) => context
                                  .read<CurrentFlight>()
                                  .missionNum = value,
                            ),
                          ),
                          WeatherFormField(validator: (value) {
                            if (value == null) {
                              return "Please select a value";
                            }
                            return null;
                          }, onChanged: (value) {
                            context.read<CurrentFlight>().weather = value;
                          }),
                        ],
                      ),
                    ),
                    SortieTypeFormField(validator: (value) {
                      if (value == null) {
                        return "Please select a value";
                      }
                      return null;
                    }, onChanged: (value) {
                      context.read<CurrentFlight>().sortieType = value;
                    }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          DayNightFormField(validator: (value) {
                            if (value == null) {
                              return "Please select a value";
                            }
                            return null;
                          }, onChanged: (value) {
                            context.read<CurrentFlight>().dayNight = value;
                          }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Sortie Profile",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a value";
                          }
                          return null;
                        },
                        onChanged: (value) =>
                            context.read<CurrentFlight>().profile = value,
                      ),
                    ),
                  ],
                ),
              ),

              // STUDENT

              for (GradeSheet gradeSheet
                  in context.watch<CurrentFlight>().gradeSheets)
                StudentParamSelectionCard(gradeSheet: gradeSheet),
            ],
          );
        } else {
          // build narrow

          return Column(
            children: [
              Card(
                child: ExpansionTile(
                  title: const Text("General"),
                  initiallyExpanded: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Mission Number",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a value";
                                }
                                return null;
                              },
                              onChanged: (value) => context
                                  .read<CurrentFlight>()
                                  .missionNum = value,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 120,
                            child: WeatherFormField(validator: (value) {
                              if (value == null) {
                                return "Please select a value";
                              }
                              return null;
                            }, onChanged: (value) {
                              context.read<CurrentFlight>().weather = value;
                            }),
                          ),
                          Container(
                            width: 120,
                            child: DayNightFormField(validator: (value) {
                              if (value == null) {
                                return "Please select a value";
                              }
                              return null;
                            }, onChanged: (value) {
                              context.read<CurrentFlight>().dayNight = value;
                            }),
                          ),
                        ]),
                    Container(
                      //width: 160,
                      child: SortieTypeFormField(validator: (value) {
                        if (value == null) {
                          return "Please select a value";
                        }
                        return null;
                      }, onChanged: (value) {
                        context.read<CurrentFlight>().sortieType = value;
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Sortie Profile",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a value";
                          }
                          return null;
                        },
                        onChanged: (value) =>
                            context.read<CurrentFlight>().profile = value,
                      ),
                    ),
                  ],
                ),
              ),
              for (GradeSheet gradeSheet
                  in context.watch<CurrentFlight>().gradeSheets)
                StudentParamSelectionCard(gradeSheet: gradeSheet),
            ],
          );
        }
      },
    ));*/
  }
}

class TitleSliver extends StatelessWidget {
  const TitleSliver({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: false,
        pinned: true,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ));
  }
}
