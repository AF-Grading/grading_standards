import 'package:app_prototype/widgets/sortie_type_form_field.dart';
import 'package:app_prototype/widgets/student_param_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/grade_sheet.dart';
import '/widgets/weather_form_field.dart';
import '/models/current_flight.dart';
import '/widgets/day_night_form_field.dart';

class NewFlightView extends StatelessWidget {
  const NewFlightView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                          onChanged: (value) =>
                              // tryparse needed because of empty string else error
                              context.read<CurrentFlight>().missionNum =
                                  int.tryParse(value) ?? 0,
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
      ),
    );
  }
}
