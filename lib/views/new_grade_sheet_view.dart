import 'dart:collection';

import 'package:app_prototype/models/cts_list.dart';
import 'package:app_prototype/models/grade_sheet.dart';
import 'package:app_prototype/widgets/editable_day_night_item.dart';
import 'package:app_prototype/widgets/editable_sortie_type.dart';
import 'package:app_prototype/widgets/search_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/grade.dart';
import '../models/user.dart';
import '../models/users.dart';
import '../pages/grading_activity_page.dart';

enum GradingParams { freeSelect, all, none, formationAndAirdop }

class NewGradeSheetView extends StatefulWidget {
  const NewGradeSheetView({Key? key}) : super(key: key);

  @override
  State<NewGradeSheetView> createState() => _NewGradeSheetViewState();
}

class _NewGradeSheetViewState extends State<NewGradeSheetView> {
  final List<User> _students = [];
  String _weather = "";
  // perhaps have a no selection option for validation ie DayNight.noSelection
  DayNight _dayNight = DayNight.day;
  SortieType _sortieType = SortieType.ims;
  int _sortieNum = 0;
  int _missionNum = 0;
  // TODO add this
  PilotQual _pilotQual = PilotQual.fpc;
  //User instructor = Users().user;
  GradingParams _gradingParams = GradingParams.all;
  final Map<String, bool> _selectedParams = {
    for (CTSItem item in ctsItems) item.name: true
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SearchUsers(
            onSelected: (values) {
              setState(() {
                _students.clear();
                _students.addAll(values);
                for (User user in _students) {
                  print(user.name);
                }
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Weather: "),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter weather conditions',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _weather = value;
                    });
                  },
                ),
              ),
              EditableDayNightItem(
                  dayNight: _dayNight,
                  onChanged: (value) {
                    setState(() {
                      _dayNight = value;
                    });
                  }),
            ],
          ),
          EditableSortieType(
              sortieType: _sortieType,
              onChanged: (value) {
                setState(() {
                  _sortieType = value;
                });
              }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: "Mission Number",
              ),
              onChanged: (value) => setState(() {
                // tryparse needed because of empty string else error
                _missionNum = int.tryParse(value) ?? 0;
              }),
            ),
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
                // changed the size of child aspect ratio to 4 so we can see the titles clearly
                // we still need to change it so the box aligns neatly though
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
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          const Text("Pilot Qualifications:"),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GradingActivity(
                            gradeSheets: {
                              for (User student in _students)
                                GradeSheet(
                                  // TODO find this by current user instead
                                  instructor: Users().user.name,
                                  student: student.name,
                                  missionNum: _missionNum,
                                  grades: baseGradeItems,
                                  overall: Grade.noGrade,
                                  weather: _weather,
                                  pilotQual: _pilotQual,
                                  sortieType: _sortieType,
                                  dayNight: _dayNight,
                                  date: DateTime.now(),
                                  sortieNumber: _sortieNum,
                                  length: "0",
                                )
                            }.toList(),
                          )));
            },
            child: const Text("Start Flight"),
          ),
        ],
      ),
    );
  }
}
