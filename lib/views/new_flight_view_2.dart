import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/DayNight.dart';
import '../models/SortieType.dart';
import '../models/Users.dart';
import '../models/Weather.dart';

import '../models/grading_param_enum.dart';
import '../widgets/form_fields/barrel.dart';
import '../widgets/slivers/barrel.dart';
import '../widgets/styling/barrel.dart';

class NewFlightView2 extends StatefulWidget {
  const NewFlightView2({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  State<NewFlightView2> createState() => _NewFlightView2State();
}

class _NewFlightView2State extends State<NewFlightView2> {
  bool _generalError = false;

  int _students = 1;
  List<bool> _studentError = [false, false, false, false];
  List<GradingParam> _params = [
    GradingParam.all,
    GradingParam.all,
    GradingParam.all,
    GradingParam.all
  ];

  TextEditingController _missionNumber = TextEditingController();
  Weather? _weather;
  SortieType? _sortieType;
  DayNight? _dayNight;
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
                SpacedItem(
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
                      setState(() {
                        _generalError = false;
                      });
                      return null;
                    },
                  ),
                ),
                SpacedItem(
                  name: "Weather",
                  child: WeatherFormField(
                    onChanged: (value) => _weather = value,
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
                    onChanged: (value) => _sortieType = value,
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
                    onChanged: (value) => _dayNight = value,
                  ),
                ),
                SpacedItem(
                  name: "Sortie Profile",
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a value";
                      }
                      return null;
                    },
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
                      .watch<Users>()
                      .users
                      .firstWhere((user) => user.id == _studentIds[i])
                      .name!,
              hasErrors: _studentError[i],
            ),
            SliverToBoxAdapter(
              child: Column(children: [
                SpacedItem(
                  name: "Student Name",
                  child: _studentIds[i].isEmpty
                      ? SearchUsersFormField(
                          users: context
                              .watch<Users>()
                              .users
                              .where((user) =>
                                  _studentIds
                                      .indexWhere((id) => user.id == id) ==
                                  -1)
                              .toList(),
                          onSaved: (studentId) {
                            setState(() {
                              _studentError[i] = false;
                              _studentIds[i] = studentId;
                            });
                          },
                          validator: (value) {
                            if (_studentIds[i].isEmpty) {
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
                ),
                SpacedItem(
                  name: "Pre-select Params:",
                  child: GradingParamFormField(
                    onChanged: (value) => setState(() {
                      _params[i] = value;
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
          )
        ],
      ),
    );
  }
}
