import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/application_state.dart';
import '../models/grade_enums.dart';
import '../models/grading_criterion.dart';
import '../models/user_setting.dart';
import '/models/grade_sheet.dart';
import 'package:flutter/material.dart';

import 'add_edit_grade_sheet_page.dart';

class GradeSheetPage extends StatelessWidget {
  const GradeSheetPage({Key? key, required this.gradeSheet}) : super(key: key);

  final GradeSheet gradeSheet;
  static double dist = 35;

  @override
  Widget build(BuildContext context) {
    return Consumer<List<UserSetting>>(
      builder: (BuildContext context, stream, Widget? child) {
        if (stream.isEmpty) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        String instructor = stream
            .where((usetting) => usetting.email == gradeSheet.instructorId)
            .first
            .name;
        UserSetting student = stream
            .where((usetting) => usetting.email == gradeSheet.studentId)
            .first;
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Instructor: $instructor"),
                GestureDetector(
                  child: const Icon(Icons.copy),
                  onTap: () {
                    Clipboard.setData(ClipboardData(
                            text: gradeSheet.copy(instructor, student)))
                        .then((result) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Copied to your clipboard !')));
                    });
                  },
                ),
                GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () {
                      if (context
                              .read<ApplicationState>()
                              .user
                              .permission
                              .index >
                          0)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddEditGradeSheetPage(
                              gradingCriteria:
                                  context.watch<List<GradingCriterion>>(),
                              users: context.watch<List<UserSetting>>(),
                              gradeSheet: gradeSheet,
                            ),
                          ),
                        );
                    })
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: ExpansionTile(
                    title: const Text("Overall"),
                    initiallyExpanded: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: dist,
                                child: ListTile(
                                    leading: const Text("Student"),
                                    title: Text(student.name)),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: dist,
                                child: ListTile(
                                  leading: const Text("Mission Number:"),
                                  title: Text(gradeSheet.missionNum.toString()),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: SizedBox(
                                  height: dist,
                                  child: ListTile(
                                      leading: const Text("Weather"),
                                      title: Text(gradeSheet.weather!.name))),
                            ),
                            Expanded(
                              child: SizedBox(
                                  height: dist,
                                  child: ListTile(
                                      leading: const Text("Flight Information"),
                                      title: Text(gradeSheet.profile))),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: dist,
                                child: ListTile(
                                  leading: const Text("Overall Grade"),
                                  title: Text("${gradeSheet.overall!.number}"),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                  height: dist,
                                  child: ListTile(
                                    leading: const Text("Comments"),
                                    title: Text(gradeSheet.overallComments),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: const Text("Recommendations"),
                            title: Text(gradeSheet.recommendations),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                child: SizedBox(
                                    height: dist,
                                    child: ListTile(
                                      leading: const Text("Day/Night"),
                                      title: Text(
                                          gradeSheet.dayNight.prettyDayNight),
                                    ))),
                            Expanded(
                              child: SizedBox(
                                height: dist,
                                child: ListTile(
                                  leading: const Text("Date"),
                                  title: Text(
                                      "${gradeSheet.startTime.year}/${gradeSheet.startTime.month}/${gradeSheet.startTime.day}"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                child: SizedBox(
                                    height: dist,
                                    child: ListTile(
                                      leading: const Text("Sortie Type:"),
                                      title: Text(
                                          gradeSheet.sortieType.prettySortie),
                                    ))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: ExpansionTile(
                    title: const Text("Graded Items"),
                    initiallyExpanded: true,
                    children: gradeSheet.grades
                        .where((item) => item.grade != Grade.noGrade)
                        .map((item) => ListTile(
                              leading: Text("${item.grade!.number}"),
                              title: Text(item.name),
                              subtitle: Text(item.comments),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
