import 'dart:async';

import 'package:app_prototype/pages/review_flight_page.dart';
import 'package:app_prototype/views/flight_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import '../models/grade_sheet.dart';

class CurrentFlightPage extends StatefulWidget {
  const CurrentFlightPage({
    Key? key,
  }) : super(key: key);

  //final List<GradeSheet> gradeSheets;
  //final Map<String, bool> selectedParams;

  @override
  State<CurrentFlightPage> createState() => _CurrentFlightPageState();
}

class _CurrentFlightPageState extends State<CurrentFlightPage> {
  @override
  Widget build(BuildContext context) {
    return context.watch<CurrentFlight>().gradeSheets.length == 1
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Proficiency Standards | Grade Desc"),
            ),
            body: FlightView(
              index: 0,
              gradeSheet: context.watch<CurrentFlight>().gradeSheets.first,
              //selectedParams: widget.selectedParams,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (context.read<CurrentFlight>().validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReviewFlightPage()));
                }
              },
              tooltip: 'Increment',
              child: const Text("Review"),
            ),
          )
        : DefaultTabController(
            initialIndex: 0,
            length: context.watch<CurrentFlight>().gradeSheets.length,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                    "Proficiency Standards Table Popup | Proficiency Grade Description Popup"),
                bottom: TabBar(
                  tabs: context
                      .watch<CurrentFlight>()
                      .gradeSheets
                      .map((gradeSheet) {
                    return Tab(
                      // gross mess that doesnt do what i want it to - kegan
                      child: context
                                  .watch<CurrentFlight>()
                                  .flightKeys[context
                                      .read<CurrentFlight>()
                                      .index(gradeSheet.student)]
                                  .currentState !=
                              null
                          ? context
                                  .watch<CurrentFlight>()
                                  .flightKeys[context
                                      .read<CurrentFlight>()
                                      .index(gradeSheet.student)]
                                  .currentState!
                                  .validate()
                              ? Text(gradeSheet.student)
                              : Text(
                                  gradeSheet.student,
                                  style: const TextStyle(color: Colors.red),
                                )
                          : Text(gradeSheet.student),
                    );
                  }).toList(),
                ),
              ),

              body: TabBarView(children: [
                for (int i = 0;
                    i < context.watch<CurrentFlight>().gradeSheets.length;
                    i++)
                  FlightView(
                      index: 1,
                      gradeSheet: context.watch<CurrentFlight>().gradeSheets[i])
              ]),

              /*children: context
                    .watch<CurrentFlight>()
                    .gradeSheets
                    .map((gradeSheet) {
                  return FlightView(
                    index:,
                    gradeSheet: gradeSheet,
                    //selectedParams: widget.selectedParams,
                  );
                }).toList(),
              ),*/

              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (context.read<CurrentFlight>().validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReviewFlightPage()));
                  }
                },
                tooltip: 'Increment',
                child: const Text("Review"),
              ), // This trailing comma makes auto-formatting nicer for build methods.
            ),
          );
  }
}
