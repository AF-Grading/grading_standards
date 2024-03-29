import 'package:app_prototype/models/application_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/current_user.dart';
import '/models/grade_sheet.dart';
import '/widgets/grade_sheet_list_tile.dart';

class GradeSheetsView extends StatelessWidget {
  const GradeSheetsView({Key? key, required this.isInstructor})
      : super(key: key);

  final bool isInstructor;

  @override
  Widget build(BuildContext context) {
    return Consumer<List<GradeSheet>>(
      builder: (context, gradeSheetsStream, _) {
        // if the viewer is an instructor, see student gradesheets
        final List<GradeSheet> gradeSheets = isInstructor
            ? gradeSheetsStream
                .where((gradesheet) =>
                    gradesheet.instructorId ==
                    context.watch<ApplicationState>().user!.email)
                .toList()
            : gradeSheetsStream
                .where((gradesheet) =>
                    gradesheet.studentId ==
                    context.watch<ApplicationState>().user!.email)
                .toList();
        /* final missionNumbers = gradeSheetsStream
            .map((gradeSheet) => gradeSheet.missionNum)
            .toSet()
            .toList()
            .where((number) =>
                gradeSheets.any((sheet) => sheet.missionNum == number))
            .toList(); */
        return gradeSheets.isEmpty //missionNumbers.isEmpty
            ? const Center(
                child: Text("No GradeSheets"),
              )
            : ListView.builder(
                itemCount: gradeSheets.length, //missionNumbers.length,
                itemBuilder: (context, index) {
                  return GradeSheetListTile(gradeSheet: gradeSheets[index]);

                  /* ListTile(
                    //title: Text("Mission: ${missionNumbers[index]}"),
                    title: Text /* Container(
                      color: Colors.black12,
                      child: Column(
                          children: gradeSheets
                              /* .where((gradeSheet) =>
                                  gradeSheet.missionNum ==
                                  missionNumbers[index]) */
                              .map((gradeSheet) =>
                                  GradeSheetListTile(gradeSheet: gradeSheet))
                              .toList()),
                    ), */
                  ); */
                },
              );
      },
    );
  }
}
