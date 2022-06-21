import 'package:app_prototype/models/current_flight.dart';
import 'package:app_prototype/models/grade_enums.dart';
import 'package:app_prototype/widgets/day_night_form_field.dart';
import 'package:app_prototype/widgets/editable_day_night_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            Card(
              child: ExpansionTile(
                title: const Text("General"),
                initiallyExpanded: true,
                children: [
                  Row(
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
                  )
                ],
              ),
            ),
            ElevatedButton(
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
      ),
    );
  }
}
