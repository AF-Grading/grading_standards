import 'package:app_prototype/models/CurrentUser.dart';
import 'package:app_prototype/pages/add_edit_grade_sheet_page.dart';
import 'package:app_prototype/views/grade_sheets_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      builder: (context) => const AddEditGradeSheetPage(
                          /*instructor:
                            context.watch<CurrentUser>().permission.index < 3
                                ? context.watch<CurrentUser>().user
                                : null,*/
                          ),
                      //TODO: NOT A GOOD PRACTICE TO PASS MODEL WITH DATA LIKE THIS
                      /*EditGradeSheetPage(
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
                            overall: Grade.noSelection,
                            sortieType: SortieType.noSelection,
                            dayNight: DayNight.noSelection,
                            startTime: DateTime.now(),
                            endTime: DateTime.now(),
                            sortieNumber: 0,
                            length: "",
                            weather: Weather.noSelection),
                      ),*/
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
