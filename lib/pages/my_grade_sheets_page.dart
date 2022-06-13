import 'package:app_prototype/grade_sheets.dart';
import 'package:app_prototype/pages/edit_gradesheet_page.dart';
import 'package:flutter/material.dart';

class MyGradeSheetsPage extends StatelessWidget {
  MyGradeSheetsPage({Key? key}) : super(key: key);

  final gradeSheets = GradeSheets().gradeSheets;
  final missionNumbers = GradeSheets().missionNumbers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grade"),
      ),
      body: ListView.builder(
          itemCount: missionNumbers.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Mission: ${gradeSheets[index].missionNum}"),
              subtitle: Column(
                  children: gradeSheets
                      .where((gradeSheet) =>
                          gradeSheet.missionNum == missionNumbers[index])
                      .map(
                        (gradeSheet) => GestureDetector(
                          child: Text(
                              "${gradeSheet.student} ${gradeSheet.date} ${gradeSheet.overall}"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditGradeSheetPage(
                                      gradeSheet: gradeSheet)),
                            );
                          },
                        ),
                      )
                      .toList()),
            );
          }),
    );
  }
}
