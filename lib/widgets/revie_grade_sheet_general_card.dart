import 'package:app_prototype/models/grade_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import 'day_night_form_field.dart';
import 'sortie_type_form_field.dart';

class ReviewGradeSheetGeneralCard extends StatelessWidget {
  const ReviewGradeSheetGeneralCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      labelText: "Weather",
                    ),
                    initialValue: context.read<CurrentFlight>().weather,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a value";
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        context.read<CurrentFlight>().weather = value,
                  ),
                ),
                DayNightFormField(
                    initialValue: context.read<CurrentFlight>().dayNight,
                    validator: (value) {
                      if (value == null || value == DayNight.noSelection) {
                        return "Please select a value";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      context.read<CurrentFlight>().dayNight = value;
                    }),
              ],
            ),
          ),
          SortieTypeFormField(
              initialValue: context.read<CurrentFlight>().sortieType,
              validator: (value) {
                if (value == null || value == SortieType.noSelection) {
                  return "Please select a value";
                }
                return null;
              },
              onChanged: (value) {
                context.read<CurrentFlight>().sortieType = value;
              }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue:
                        context.read<CurrentFlight>().missionNum.toString(),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                Expanded(
                  child: TextFormField(
                    initialValue:
                        context.read<CurrentFlight>().sortieNum.toString(),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    onChanged: (value) =>
                        // tryparse needed because of empty string else error
                        context.read<CurrentFlight>().sortieNum =
                            int.tryParse(value) ?? 0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: context.read<CurrentFlight>().profile,
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
    );
  }
}
