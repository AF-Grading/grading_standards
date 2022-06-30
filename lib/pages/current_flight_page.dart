import 'package:app_prototype/models/grade_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// prefer internal routes to be relative
import '../models/current_flight.dart';
import '../models/grade_enums.dart';
import '/pages/review_flight_page.dart';
import '/views/flight_view.dart';

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
  List<bool> hasErrors = [false, false, false, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<CurrentFlight>().flightKey,
      child: context.watch<CurrentFlight>().gradeSheets.length == 1
          ? Scaffold(
              appBar: AppBar(
                title: const Text("Proficiency Standards | Grade Desc"),
              ),
              body: FlightView(
                index: 0,
                gradeSheet: context.watch<CurrentFlight>().gradeSheets.first,
                hasErrors: (hasError) {
                  setState(() {
                    hasErrors[0] = hasError;
                  });
                },
                //selectedParams: widget.selectedParams,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (context
                      .read<CurrentFlight>()
                      .flightKey
                      .currentState!
                      .validate()) {
                    context.read<CurrentFlight>().end();

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
                    tabs: [
                      for (int i = 0;
                          i < context.watch<CurrentFlight>().gradeSheets.length;
                          i++)
                        hasErrors[i]
                            ? Tab(
                                child: Text(
                                  context
                                      .watch<CurrentFlight>()
                                      .gradeSheets[i]
                                      .student
                                      .name,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              )
                            : Tab(
                                child: Text(context
                                    .watch<CurrentFlight>()
                                    .gradeSheets[i]
                                    .student
                                    .name))
                    ],

                    /*context
                        .watch<CurrentFlight>()
                        .gradeSheets
                        .map((gradeSheet) {
                      return Tab(
                        child: Text(gradeSheet.student),
                      );
                    }).toList(),*/
                  ),
                ),

                body: TabBarView(children: [
                  for (int i = 0;
                      i < context.watch<CurrentFlight>().gradeSheets.length;
                      i++)
                    // _flightViews[i],
                    FlightView(
                      index: i,
                      gradeSheet: context.watch<CurrentFlight>().gradeSheets[i],
                      hasErrors: (hasError) {
                        setState(() {
                          hasErrors[i] = hasError;
                        });
                      },
                    )
                ]),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    if (context
                        .read<CurrentFlight>()
                        .flightKey
                        .currentState!
                        .validate()) {
                      context.read<CurrentFlight>().end();
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
            ),
    );
  }
}
