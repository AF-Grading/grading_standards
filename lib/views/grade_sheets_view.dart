import 'package:app_prototype/models/current_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade_sheet.dart';
import '../models/grade_sheets.dart';
import '../pages/grade_sheet_page.dart';

class GradeSheetsView extends StatelessWidget {
  const GradeSheetsView({Key? key, required this.isInstructor})
      : super(key: key);

  final bool isInstructor;

  @override
  Widget build(BuildContext context) {
    return Consumer<GradeSheets>(
      builder: (context, gradeSheetsModel, _) {
        // if the viewer is an instructor, see student gradesheets
        final List<GradeSheet> gradeSheets = isInstructor
            ? gradeSheetsModel.gradeSheets
                .where((gradesheet) =>
                    gradesheet.instructorId ==
                    context.watch<CurrentUser>().user.email)
                .toList()
            : gradeSheetsModel.gradeSheets
                .where((gradesheet) =>
                    gradesheet.studentId ==
                    context.watch<CurrentUser>().user.email)
                .toList();
        final missionNumbers = gradeSheetsModel.missionNumbers
            .where((number) =>
                gradeSheets.any((sheet) => sheet.missionNum == number))
            .toList();
        return missionNumbers.isEmpty
            ? const Center(
                child: Text("No Missions"),
              )
            : ListView.builder(
                itemCount: missionNumbers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Mission: ${missionNumbers[index]}"),
                    subtitle: Container(
                      color: Colors.black12,
                      child: Column(
                          children: gradeSheets
                              .where((gradeSheet) =>
                                  gradeSheet.missionNum ==
                                  missionNumbers[index])
                              .map(
                                (gradeSheet) => ListTile(
                                  leading: Text(gradeSheet.studentId),
                                  title: Text(gradeSheet.startTime
                                      .toString()
                                      .substring(0, 10)),
                                  trailing: Text(gradeSheet.overall.name),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GradeSheetPage(
                                              gradeSheet: gradeSheet)),
                                    );
                                  },
                                ),
                              )
                              .toList()),
                    ),
                  );
                },
              );
      },
    );
  }
}
