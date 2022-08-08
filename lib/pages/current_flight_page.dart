import 'package:app_prototype/models/grading_parameter.dart';
import 'package:app_prototype/models/user_setting.dart';
import 'package:app_prototype/views/flight_view_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// prefer internal routes to be relative
import '../models/user.dart';
import '/models/current_flight.dart';
import '/widgets/proficiency_grade_popup.dart';
import '/widgets/proficiency_table_popup.dart';
import '/pages/review_flight_page.dart';
import '/views/flight_view.dart';

class CurrentFlightPage extends StatefulWidget {
  const CurrentFlightPage({Key? key, required this.students}) : super(key: key);

  final List<UserSetting> students;
  //final List<GradeSheet> gradeSheets;
  //final Map<String, bool> selectedParams;

  @override
  State<CurrentFlightPage> createState() => _CurrentFlightPageState();
}

class _CurrentFlightPageState extends State<CurrentFlightPage> {
  List<bool> hasErrors = [false, false, false, false];

  @override
  void initState() {
    // TODO get initial errors working for tabs
    /*for (int i = 0; i < widget.length; i++) {
      hasErrors[i] = true;
    }*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool keyBoardIsOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Form(
      key: context.read<CurrentFlight>().flightKey,
      child: widget.students.length == 1 //gradeSheets.length == 1
          ? Scaffold(
              appBar: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    ProficencyTablePopup(),
                    ProficencyGradePopup(),
                  ],
                ),
              ),
              body: FlightView2(
                //index: 0,
                hasErrors: (error) {
                  setState(() {
                    hasErrors[0] = error;
                  });
                },
                student: widget.students[0],
                gradeSheet: context.watch<CurrentFlight>().gradeSheets.first,
                params: context.read<List<GradingParameter>>().firstWhere(
                    (param) =>
                        param.paramName ==
                        context.watch<CurrentFlight>().selectedParams[0]),
              ),
              floatingActionButton: Visibility(
                visible: !keyBoardIsOpen,
                child: FloatingActionButton(
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
              ),
            )
          : DefaultTabController(
              initialIndex: 0,
              length: widget.students.length,
              child: Scaffold(
                appBar: AppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      ProficencyTablePopup(),
                      ProficencyGradePopup(),
                    ],
                  ),
                  bottom: TabBar(
                    tabs: [
                      for (int i = 0; i < widget.students.length; i++)
                        hasErrors[i]
                            ? Tab(
                                child: Text(
                                  widget.students[i].name,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              )
                            : Tab(
                                child: Text(
                                widget.students[i].name,
                              ))
                    ],
                  ),
                ),
                body: TabBarView(children: [
                  for (int i = 0; i < widget.students.length; i++)
                    // _flightViews[i],
                    FlightView2(
                      //index: i,
                      hasErrors: (error) {
                        setState(() {
                          hasErrors[i] = error;
                        });
                      },
                      student: widget.students[i],
                      gradeSheet: context.watch<CurrentFlight>().gradeSheets[i],
                      params: context
                          .watch<List<GradingParameter>>()
                          .firstWhere((param) =>
                              param.paramName ==
                              context.watch<CurrentFlight>().selectedParams[i]),
                    )
                ]),
                floatingActionButton: Visibility(
                  visible: !keyBoardIsOpen,
                  child: FloatingActionButton(
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
                                builder: (context) =>
                                    const ReviewFlightPage()));
                      }
                    },
                    tooltip: 'Increment',
                    child: const Text("Review"),
                  ),
                ),
              ),
            ),
    );
  }
}
