import 'package:app_prototype/models/grade_sheet.dart';
import 'package:app_prototype/models/theme_change.dart';
import 'package:app_prototype/pages/grade_sheet_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/current_user.dart';
import '../../models/grade_sheets.dart';
import '../../theme/dark_mode.dart';
import '../../theme/light_mode.dart';
import '../../views/individual_reports_view.dart';
import '../reference_materials_page.dart';
import '../settings_page.dart';
import '../../models/user.dart';
import '../../models/grade_enums.dart';

class StudentViewPage extends StatefulWidget {
  @override
  _StudentViewPageState createState() => _StudentViewPageState();
}

class _StudentViewPageState extends State<StudentViewPage> {
  // temp hot coded until we can figure out how to do it dynamiclly
  GradeSheet _selectedGradeSheet = GradeSheet(
    weather: Weather.imc,
    instructor: User(
        name: "Captain Underpants",
        rank: Rank.capt,
        squad: "4th Airlift",
        id: "1",
        email: '',
        password: ''),
    student: User(
        name: "1st Lieutenant Dan",
        rank: Rank.firstLt,
        squad: "4th Airlift",
        id: "2",
        email: '',
        password: ''),
    missionNum: 12303,
    grades: [
      GradeItem(
        name: "Communication Skills",
        grade: Grade.familiar,
      ),
      GradeItem(
        name: "Systems Knowledge",
        grade: Grade.noGrade,
      ),
      GradeItem(
        name: "Combat Governing Documents",
        grade: Grade.familiar,
      ),
      GradeItem(
        name: "Threat Analysis & Mitigation/ Intel Integration",
        grade: Grade.familiar,
      ),
    ],
    overall: Grade.expert,
    overallComments: "Almost there Danny!!",
    sortieType: SortieType.ims,
    dayNight: DayNight.night,
    startTime: DateTime(2022, 5),
    endTime: DateTime(2022, 6),
    sortieNumber: 2,
    length: "2 hours",
  );

  @override
  Widget build(BuildContext context) {
    context.read<GradeSheets>().gradeSheets.forEach((gradeSheet) {
      if (gradeSheet.student.name == context.read<CurrentUser>().user.name) {
        // we can change the .name to user when we change the backend so that the users are shared instead of created on the spot

        _selectedGradeSheet = gradeSheet;
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, " + context.read<CurrentUser>().user.name),
      ),
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.watch<ThemeChange>().mode == ThemeMode.dark
                  ? primaryDarkBlue
                  : primaryBlue,
            ),
            child: Text(
              context.watch<CurrentUser>().user.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Reference Materials'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ReferenceMaterialsPages()),
              );
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ]),
      ),
      body: GradeSheetPage(
        gradeSheet: _selectedGradeSheet,
      ),
    );
  }
}
