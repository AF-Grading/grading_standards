import 'package:app_prototype/models/grade_sheet.dart';
import 'package:app_prototype/models/user_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/application_state.dart';
import '../models/current_flight.dart';
import '../models/current_user.dart';
import '../models/grading_criterion.dart';
import '../pages/current_flight_page.dart';
import '../theme/light_mode.dart';

class NewFlightButtons extends StatelessWidget {
  const NewFlightButtons({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    bool keyBoardIsOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Wrap(
      direction: Axis.horizontal,
      //mainAxisAlignment: MainAxisAlignment.end,
      children: [
        /* Padding(
          padding: const EdgeInsets.all(8.0),
          child: Theme(
            data: Theme.of(context).copyWith(backgroundColor: primaryYellow),
            child: Visibility(
              visible: !keyBoardIsOpen,
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
          ),
        ), */
        /* Padding(
          padding: const EdgeInsets.all(8.0),
          child: Theme(
            data: Theme.of(context).copyWith(backgroundColor: primaryYellow),
            child: Visibility(
              visible: !keyBoardIsOpen,
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
          ),
        ), */
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Theme(
            data: Theme.of(context).copyWith(backgroundColor: primaryYellow),
            child: Visibility(
              visible: !keyBoardIsOpen,
              child: FloatingActionButton(
                heroTag: "start flight",
                // TODO if already pressed, instead have a resume flight button
                tooltip: "Start Flight",
                child: const Icon(Icons.airplanemode_active),
                onPressed: () {
                  if (/* context
                      .read<CurrentFlight>()
                      .newKey
                      .currentState!
                      .validate() */
                      formKey.currentState!.validate()) {
                    context.read<CurrentFlight>().instructorId =
                        context.read<ApplicationState>().user.email;
                    final students = context.read<CurrentFlight>().students;

                    context.read<CurrentFlight>().gradeSheets.clear();
                    for (UserSetting student in students) {
                      /*final List<GradeItem> grades = context
                          .watch<List<GradingCriterion>>()
                          .map((criterion) =>
                              GradeItem(name: criterion.criterion))
                          .toList();*/
                      context.read<CurrentFlight>().gradeSheets.add(GradeSheet(
                          studentId: student.email,
                          missionNum: "0",
                          grades: [], //grades,
                          startTime: DateTime.now(),
                          endTime: DateTime.now()));
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CurrentFlightPage(
                            students: context.read<CurrentFlight>().students),
                      ),
                    );
                    // TODO if in a flight, dont do this
                    context.read<CurrentFlight>().start();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
