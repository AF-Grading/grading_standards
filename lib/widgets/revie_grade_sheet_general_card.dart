import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import 'day_night_form_field.dart';
import 'sortie_type_form_field.dart';
import 'weather_form_field.dart';

class ReviewGradeSheetGeneralCard extends StatelessWidget {
  const ReviewGradeSheetGeneralCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //title: const Text("General"),
      //initiallyExpanded: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeatherFormField(
                  initialValue: context.read<CurrentFlight>().weather,
                  validator: (value) {
                    if (value == null) {
                      return "Please select a value";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    context.read<CurrentFlight>().weather = value;
                  }),
              DayNightFormField(
                  initialValue: context.read<CurrentFlight>().dayNight,
                  validator: (value) {
                    if (value == null) {
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
              if (value == null) {
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
                      context.read<CurrentFlight>().missionNum = value,
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
            onChanged: (value) => context.read<CurrentFlight>().profile = value,
          ),
        ),
      ],
    );
  }
}
