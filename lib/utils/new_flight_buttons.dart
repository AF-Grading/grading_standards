import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import '../pages/current_flight_page.dart';

class NewFlightButtons extends StatelessWidget {
  const NewFlightButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      //mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            heroTag: "subtract student",
            onPressed: () {
              String? message = context.read<CurrentFlight>().subtract();
              if (message != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }
            },
            tooltip: "Subtract Student",
            child: const Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
              heroTag: "add student",
              tooltip: "Add Student",
              onPressed: () {
                String? message = context.read<CurrentFlight>().add();
                if (message != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                }
              },
              child: const Icon(Icons.add)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            heroTag: "start flight",
            // TODO if already pressed, instead have a resume flight button
            tooltip: "Start Flight",
            child: const Icon(Icons.airplanemode_active),
            onPressed: () {
              if (context
                  .read<CurrentFlight>()
                  .newKey
                  .currentState!
                  .validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CurrentFlightPage(),
                  ),
                );
                // TODO if in a flight, dont do this
                context.read<CurrentFlight>().start();
              }
            },
          ),
        ),
      ],
    );
  }
}
