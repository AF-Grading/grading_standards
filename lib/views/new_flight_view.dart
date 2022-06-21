import 'package:app_prototype/models/current_flight.dart';
import 'package:app_prototype/models/grade_enums.dart';
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
                      const Text("Weather: "),
                      Expanded(
                        child: TextFormField(
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
                      EditableDayNightItem(
                        dayNight: DayNight.noSelection,
                        onChanged: (value) =>
                            context.read<CurrentFlight>().dayNight = value,
                      ),
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
