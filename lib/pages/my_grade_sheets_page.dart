import 'package:app_prototype/views/grade_sheets_view.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../pages/edit_gradesheet_page.dart';
import '../models/grade_enums.dart';
import '../models/grade_sheet.dart';
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
                        isEditing: true,
                        gradeSheet: GradeSheet(
                            // TODO get
                            instructor: User(
                                name: "GET AUTOMATICALLY",
                                rank: Rank.capt,
                                squad: "4th Airlift",
                                id: "0",
                                email: '',
                                password: ''),
                            student: User(
                                name: "",
                                rank: Rank.capt,
                                squad: "4th Airlift",
                                id: "0",
                                email: '',
                                password: ''),
                            missionNum: 0,
                            grades: baseGradeItems,
                            overall: Grade.noGrade,
                            sortieType: SortieType.ims,
                            dayNight: DayNight.night,
                            startTime: DateTime.now(),
                            endTime: DateTime.now(),
                            sortieNumber: 2,
                            length: "2 hours",
                            weather: Weather.noSelection),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: const GradeSheetsView(
          isInstructor: true,
        ));
  }
}
