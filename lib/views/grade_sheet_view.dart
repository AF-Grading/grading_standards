import '../models/grade_enums.dart';
import '/models/grade_sheet.dart';
import 'package:flutter/material.dart';

class GradeSheetView extends StatelessWidget {
  const GradeSheetView({Key? key, required this.gradeSheet}) : super(key: key);

  final GradeSheet gradeSheet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grade Sheet    Instructor: ${gradeSheet.instructor}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ExpansionTile(
                title: const Text("Overall"),
                initiallyExpanded: true,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Student: ${gradeSheet.student}")),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Mission Number: ${gradeSheet.missionNum}")),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Sortie Number: ${gradeSheet.sortieNumber}")),
                      ),
                      Flexible(
                        flex: 1,
                        // consider some sort of time picker here
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Text("Flight Duration: ${gradeSheet.length}")),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Weather ${gradeSheet.weather}")),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Text("Sortie Profile: ${gradeSheet.profile}")),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                            "Overall Grade: ${gradeSheet.overall.index - 2}"),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Comments: ${gradeSheet.overallComments}")),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Recommendations: ${gradeSheet.recommendations}")),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Text("Day/Night: ${gradeSheet.dayNight}")),
                      Flexible(
                          flex: 1,
                          child: Text("Date: ${gradeSheet.startTime}")),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Text(
                              "Pilot Qualifications: ${gradeSheet.pilotQual}")),
                      Flexible(
                          flex: 1,
                          child:
                              Text("AD Qualifications: ${gradeSheet.adQual}")),
                      Flexible(
                          flex: 1,
                          child: Text("Sortie Type: ${gradeSheet.sortieType}")),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: ExpansionTile(
                title: const Text("Graded Items"),
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
          ],
        ),
      ),
    );
  }
}
