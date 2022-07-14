import 'package:app_prototype/pages/edit_gradesheet_page.dart';

import '../models/grade_enums.dart';
import '/models/grade_sheet.dart';
import 'package:flutter/material.dart';

import 'add_edit_grade_sheet_page.dart';

class GradeSheetPage extends StatelessWidget {
  const GradeSheetPage({Key? key, required this.gradeSheet}) : super(key: key);

  final GradeSheet gradeSheet;
  static double dist = 35;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Instructor: ${gradeSheet.instructorId}"),
            GestureDetector(
              child: const Icon(Icons.edit),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditGradeSheetPage(
                    gradeSheet: gradeSheet,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: MediaQuery.of(context).size.width > 600
                ? [
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
                                        leading: const Text("Student:"),
                                        title: Text(gradeSheet.studentId)),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: dist,
                                    child: ListTile(
                                      leading: const Text("Mission Number:"),
                                      title: Text(
                                          gradeSheet.missionNum.toString()),
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
                                          leading: const Text("Weather:"),
                                          title:
                                              Text(gradeSheet.weather.name))),
                                ),
                                Expanded(
                                  child: SizedBox(
                                      height: dist,
                                      child: ListTile(
                                          leading: const Text("Sortie Profile:"),
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
                                      leading: const Text("Overall Grade:"),
                                      title: Text(
                                          "${gradeSheet.overall.index - 2}"),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                      height: dist,
                                      child: ListTile(
                                        leading: const Text("Comments:"),
                                        title: Text(gradeSheet.overallComments),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: const Text("Recommendations:"),
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
                                          leading: const Text("Day/Night:"),
                                          title: Text(gradeSheet.dayNight.name),
                                        ))),
                                Expanded(
                                  child: SizedBox(
                                    height: dist,
                                    child: ListTile(
                                      leading: const Text("Date:"),
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
                                // TODO: change expanded to flexible for listtiles casue they fat

                                Expanded(
                                  child: SizedBox(
                                    height: dist,
                                    child: ListTile(
                                      leading:
                                          const Text("Pilot Qualifications"),
                                      title: Text(gradeSheet.pilotQual ==
                                              PilotQual.noSelection
                                          ? ""
                                          : gradeSheet.pilotQual.name),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                      height: dist,
                                      child: ListTile(
                                        leading:
                                            const Text("AD Qualifications:"),
                                        // display emtpy string if not used
                                        title: Text(gradeSheet.adQual ==
                                                AdQual.noSelection
                                            ? ""
                                            : gradeSheet.adQual.name),
                                      )),
                                ),
                                Expanded(
                                    child: SizedBox(
                                        height: dist,
                                        child: ListTile(
                                          leading: const Text("Sortie Type:"),
                                          title:
                                              Text(gradeSheet.sortieType.name),
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
                                  leading: Text("${item.grade.index - 2}"),
                                  title: Text(item.name),
                                  subtitle: Text(item.comments),
                                ))
                            .toList(),
                      ),
                    ),
                  ]
                : [
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
                                        leading: const Text("Student:"),
                                        title: Text(gradeSheet.studentId)),
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
                                      leading: const Text("Mission Number:"),
                                      title: Text(
                                          gradeSheet.missionNum.toString()),
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
                                          leading: const Text("Weather:"),
                                          title:
                                              Text(gradeSheet.weather.name))),
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
                                          leading: const Text("Sortie Profile:"),
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
                                      leading: const Text("Overall Grade:"),
                                      title: Text(
                                          "${gradeSheet.overall.index - 2}"),
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
                                        leading: const Text("Comments:"),
                                        title: Text(gradeSheet.overallComments),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: const Text("Recommendations:"),
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
                                          leading: const Text("Day/Night:"),
                                          title: Text(gradeSheet.dayNight.name),
                                        ))),
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
                                      leading: const Text("Date:"),
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
                                // TODO: change expanded to flexible for listtiles casue they fat

                                Expanded(
                                  child: SizedBox(
                                    height: dist,
                                    child: ListTile(
                                      leading:
                                          const Text("Pilot Qualifications:"),
                                      title: Text(gradeSheet.pilotQual ==
                                              PilotQual.noSelection
                                          ? ""
                                          : gradeSheet.pilotQual.name),
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
                                // TODO: change expanded to flexible for listtiles casue they fat

                                Expanded(
                                  child: SizedBox(
                                      height: dist,
                                      child: ListTile(
                                        leading:
                                            const Text("AD Qualifications:"),
                                        // display emtpy string if not used
                                        title: Text(gradeSheet.adQual ==
                                                AdQual.noSelection
                                            ? ""
                                            : gradeSheet.adQual.name),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // TODO: change expanded to flexible for listtiles casue they fat

                                Expanded(
                                    child: SizedBox(
                                        height: dist,
                                        child: ListTile(
                                          leading: const Text("Sortie Type"),
                                          title:
                                              Text(gradeSheet.sortieType.name),
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
                                  leading: Text("${item.grade.index - 2}"),
                                  title: Text(item.name),
                                  subtitle: Text(item.comments),
                                ))
                            .toList(),
                      ),
                    ),
                  ]),
      ),
    );
  }
}
