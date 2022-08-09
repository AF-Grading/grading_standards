import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import 'form_fields/day_night_form_field.dart';
import 'form_fields/sortie_type_form_field.dart';
import 'form_fields/weather_form_field.dart';
import 'spaced_item.dart';

class ReviewGradeSheetGeneralCard extends StatelessWidget {
  ReviewGradeSheetGeneralCard({Key? key}) : super(key: key);
  double spaceBetween = 150;
  @override
  Widget build(BuildContext context) {
    return Column(
      //title: const Text("General"),
      //initiallyExpanded: true,
      children: [
        SpacedItem(
          name: "Weather",
          child: WeatherFormField(
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
        ),
        SpacedItem(
          name: "Time of Day",
          child: DayNightFormField(
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
        ),
        SpacedItem(
          name: "Sortie Type",
          child: SortieTypeFormField(
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
        ),
        /* SpacedItem(
          name: "Mission Number",
          child: TextFormField(
            initialValue: context.read<CurrentFlight>().missionNum.toString(),
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
        ), */
        SpacedItem(
          name: "Flight Information",
          child: TextFormField(
            initialValue: context.read<CurrentFlight>().profile,
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
