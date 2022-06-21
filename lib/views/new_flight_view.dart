import 'package:app_prototype/widgets/sortie_type_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/grade_sheet.dart';
import '/models/current_flight.dart';
import '/widgets/day_night_form_field.dart';

class NewFlightView extends StatelessWidget {
  const NewFlightView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        // adds key for form validation from the model
        key: context.read<CurrentFlight>().formKey,
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
                            decoration: const InputDecoration(
                              labelText: "Weather",
                            ),
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
                  SortieTypeFormField(validator: (value) {
                    if (value == null) {
                      return "Please select a value";
                    }
                    return null;
                  }, onChanged: (value) {
                    context.read<CurrentFlight>().sortieType = value;
                  }),
                  Row(
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
                      Expanded(
                        child: TextFormField(
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
                          onChanged: (value) =>
                              // tryparse needed because of empty string else error
                              context.read<CurrentFlight>().sortieNum =
                                  int.tryParse(value) ?? 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // STUDENT

            for (GradeSheet gradeSheet
                in context.watch<CurrentFlight>().gradeSheets)
              Card(
                child: ExpansionTile(
                  title: Text("Student: ${gradeSheet.student}"),
                  initiallyExpanded: true,
                ),
              ),

            //  FINISH

            Row(
              children: [
                //ElevatedButton(onPressed: onPressed, child: child),
                ElevatedButton(
                  // TODO if already pressed, instead have a resume flight button
                  child: const Text("Start Flight"),
                  onPressed: () {
                    if (context
                        .read<CurrentFlight>()
                        .formKey
                        .currentState!
                        .validate()) {
                      // TODO: add/update general items to all gradesheets
                      //TODO go to flight view

                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
