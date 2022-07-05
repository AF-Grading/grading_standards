import 'package:app_prototype/models/CurrentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade_sheet.dart';
import '../models/grade_sheets.dart';
import '../pages/grade_sheet_page.dart';

class UserGradeSheetsView extends StatelessWidget {
  const UserGradeSheetsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GradeSheets>(
      builder: (context, gradeSheetsModel, _) {
        final List<GradeSheet> gradeSheets = gradeSheetsModel.gradeSheets
            .where((gradesheet) =>
                gradesheet.student.id == context.watch<CurrentUser>().user.id)
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
                                  leading: Text(gradeSheet.student.name),
                                  title: Text(gradeSheet.startTime
                                      .toString()
                                      .substring(0, 10)),
                                  trailing: Text(gradeSheet.overall.name),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GradeSheetView(
                                              //isEditing: true,
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
