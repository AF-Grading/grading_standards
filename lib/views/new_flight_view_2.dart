import 'package:app_prototype/models/current_flight.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade_enums.dart';
import '../models/user_setting.dart';
import '../widgets/form_fields/barrel.dart';
import '../widgets/search_users_form_field.dart';
import '../widgets/slivers/barrel.dart';
import '../widgets/spaced_item.dart';

class NewFlightView2 extends StatefulWidget {
  const NewFlightView2({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  State<NewFlightView2> createState() => _NewFlightView2State();
}

class _NewFlightView2State extends State<NewFlightView2> {
  bool _generalError = false;
  List<bool> _studentError = [false, false, false, false];

  int _students = 1;
  List<String> _params = ["All", "All", "All", "All"];

  TextEditingController _missionNumber = TextEditingController();
  //Weather? _weather;
  //SortieType? _sortieType;
  //DayNight? _dayNight;
  TextEditingController _sortieProfile = TextEditingController();

  List<String> _studentIds = ["", "", "", ""];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: CustomScrollView(
        slivers: [
          SliverTitleBar("General", hasErrors: _generalError),
          SliverToBoxAdapter(
            child: Column(
              children: [
                /* SpacedItem(
                  name: "Mission Number",
                  child: TextFormField(
                    controller: _missionNumber,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        setState(() {
                          _generalError = true;
                        });
                        return "Please enter a value";
                      }
                      context.read<CurrentFlight>().missionNum =
                          _missionNumber.text;
                      setState(() {
                        _generalError = false;
                      });
                      return null;
                    },
                  ),
                ), */
                SpacedItem(
                  name: "Weather",
                  child: WeatherFormField(
                    onChanged: (value) {
                      //_weather = value;
                      context.read<CurrentFlight>().weather = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        setState(() {
                          _generalError = true;
                        });
                        return "Please Select a Value";
                      }

                      setState(() {
                        _generalError = false;
                      });
                      return null;
                    },
                  ),
                ),
                SpacedItem(
                  name: "Sortie Type",
                  child: SortieTypeFormField(
                    validator: (value) {
                      if (value == null) {
                        setState(() {
                          _generalError = true;
                        });
                        return "Please select a value";
                      }
                      setState(() {
                        _generalError = false;
                      });
                      return null;
                    },
                    onChanged: (value) {
                      //_sortieType = value;
                      context.read<CurrentFlight>().sortieType = value;
                    },
                  ),
                ),
                SpacedItem(
                  name: "Day/Night",
                  child: DayNightFormField(
                    validator: (value) {
                      if (value == null) {
                        setState(() {
                          _generalError = true;
                        });
                        return "Please select a value";
                      }
                      setState(() {
                        _generalError = true;
                      });
                      return null;
                    },
                    onChanged: (value) {
                      //_dayNight = value;
                      context.read<CurrentFlight>().dayNight = value;
                    },
                  ),
                ),
                SpacedItem(
                  name: "Flight Information",
                  child: TextFormField(
                    controller: _sortieProfile,
                    decoration:
                        InputDecoration(hintText: "No Sortie Profile Allowed"),
                    /* validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a value";
                      }
                      context.read<CurrentFlight>().profile =
                          _sortieProfile.text;
                      return null;
                    }, */
                  ),
                ),
              ],
            ),
          ),
          for (int i = 0; i < _students; i++) ...[
            SliverTitleBar(
              _studentIds[i].isEmpty
                  ? "Student"
                  : context
                      .watch<List<UserSetting>>()
                      .firstWhere((user) => user.email == _studentIds[i])
                      .name,
              hasErrors: _studentError[i],
            ),
            SliverToBoxAdapter(
              child: Column(children: [
                _studentIds[i].isEmpty
                    ? SearchUsersFormField(
                        title: "Student Name",
                        users: context
                            .watch<List<UserSetting>>()
                            .where((user) =>
                                _studentIds
                                    .indexWhere((id) => user.email == id) ==
                                -1)
                            .toList(),
                        onSaved: (studentId) {
                          setState(() {
                            _studentError[i] = false;
                            _studentIds[i] = studentId;
                          });
                          final student = context
                              .read<List<UserSetting>>()
                              .firstWhere((user) => user.email == studentId);
                          if (context.read<CurrentFlight>().students.length <
                              i + 1) {
                            context.read<CurrentFlight>().students.add(student);
                          } else {
                            context
                                .read<CurrentFlight>()
                                .students
                                .replaceRange(i, i + 1, [student]);
                          }
                        },
                        validator: (value) {
                          if (_studentIds[i] == "") {
                            setState(() {
                              _studentError[i] = true;
                            });
                            return "Please select a student";
                          }

                          return null;
                        },
                      )
                    : ElevatedButton(
                        onPressed: () => setState(() {
                          _studentIds[i] = "";
                        }),
                        child: Text("Select Different Student"),
                      ),
                SpacedItem(
                  name: "Pre-select Params",
                  child: GradingParametersFormField(
                    initialValue: _params[i],
                    onChanged: (value) => setState(() {
                      _params[i] = value;
                      context.read<CurrentFlight>().selectedParams[i] = value;
                    }),
                  ),
                ),
              ]),
            ),
          ],
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_students > 1) {
                      setState(() {
                        _students--;
                      });
                      context.read<CurrentFlight>().studentNum = _students;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Minimum of One Student"),
                        ),
                      );
                    }
                  },
                  child: Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_students < 4) {
                      setState(() {
                        _students++;
                      });
                      context.read<CurrentFlight>().studentNum = _students;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Maximum of Four Students"),
                        ),
                      );
                    }
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
          // Adds height so Action Buttton isn't blocked
          SliverToBoxAdapter(
            child: SizedBox(height: 100),
          )
        ],
      ),
    );
  }
}
