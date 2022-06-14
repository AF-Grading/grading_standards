import 'package:app_prototype/models/grade_sheets.dart';
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
        title: const Text("My Grade Sheets"),
      ),
      body: ListView.builder(
          itemCount: missionNumbers.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Mission: ${missionNumbers[index]}"),
              subtitle: Container(
                color: Colors.black12,
                child: Column(
                    children: gradeSheets
                        .where((gradeSheet) =>
                            gradeSheet.missionNum == missionNumbers[index])
                        .map(
                          (gradeSheet) => ListTile(
                            leading: Text(gradeSheet.student),
                            title: Text(
                                gradeSheet.date.toString().substring(0, 10)),
                            trailing: Text(gradeSheet.overall.toString()),
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
              ),
            );
          }),
    );
  }
}
