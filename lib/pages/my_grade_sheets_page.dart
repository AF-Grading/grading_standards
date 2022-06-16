import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/edit_gradesheet_page.dart';
import '../models/grade.dart';
import '../models/grade_sheet.dart';
import '../models/grade_sheets.dart';
import '../models/cts_list.dart';

class MyGradeSheetsPage extends StatelessWidget {
  const MyGradeSheetsPage({Key? key}) : super(key: key);

  //final gradeSheets = GradeSheets().gradeSheets;
  //final missionNumbers = GradeSheets().missionNumbers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("My Grade Sheets"),
            GestureDetector(
              child: const Icon(
                Icons.add,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        //TODO: NOT A GOOD PRACTICE TO PASS MODEL WITH DATA LIKE THIS
                        EditGradeSheetPage(
                      gradeSheet: GradeSheet(
                        instructor: "To Be Automatically Obtained",
                        student: "",
                        missionNum: 0,
                        grades: baseGradeItems,
                        overall: Grade.noGrade,
                        sortieType: SortieType.ims,
                        dayNight: DayNight.night,
                        date: DateTime.now(),
                        sortieNumber: 2,
                        length: "2 hours",
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Consumer<GradeSheets>(
        builder: (context, gradeSheetsModel, _) {
          final gradeSheets = gradeSheetsModel.gradeSheets;
          final missionNumbers = gradeSheetsModel.missionNumbers;
          return ListView.builder(
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
                                title: Text(gradeSheet.date
                                    .toString()
                                    .substring(0, 10)),
                                trailing: Text(gradeSheet.overall.toString()),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditGradeSheetPage(
                                                gradeSheet: gradeSheet)),
                                  );
                                },
                              ),
                            )
                            .toList()),
                  ),
                );
              });
        },
      ),
    );
  }
}
