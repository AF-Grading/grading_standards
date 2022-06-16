import 'dart:collection';

import 'package:app_prototype/models/cts_list.dart';
import 'package:app_prototype/models/grade_sheet.dart';
import 'package:app_prototype/widgets/editable_day_night_item.dart';
import 'package:app_prototype/widgets/editable_sortie_type.dart';
import 'package:app_prototype/widgets/search_users.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

enum GradingParams { freeSelect, all, formationAndAirdop }

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
  GradingParams _gradingParams = GradingParams.all;
  final Map<String, bool> _selectedParams = {
    for (CTSItem item in ctsItems) item.name: true
  };

  @override
  Widget build(BuildContext context) {
    return Column(
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
          ],
        ),
        SizedBox(
          height: 300,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 6,
            ),
            itemCount: ctsItems.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                  width: 200,
                  height: 100,
                  child: ListTile(
                      title: Text(ctsItems[index].name),
                      leading: Checkbox(
                          value: _selectedParams[ctsItems[index].name],
                          onChanged: (value) {
                            setState(() {
                              _selectedParams[ctsItems[index].name] = value!;
                              _gradingParams = GradingParams.freeSelect;
                            });
                          })));
            },
          ),
        ),
        const Text("Pilot Qualifications:"),
      ],
    );
  }
}
