import 'package:app_prototype/models/cts_list.dart';
import 'package:app_prototype/models/grade_sheet.dart';

class GradeSheets {
  final List<GradeSheet> _gradeSheets = [
    GradeSheet(
      instructor: "Captain Underpants",
      student: "2nd Lieutenant Dan",
      missionNum: 12303,
      grades: [],
      overall: Grade.familiar,
      sortieType: SortieType.ims,
      dayNight: DayNight.night,
      date: DateTime(2022),
      sortieNumber: 2,
      length: "2 hours",
    ),
    GradeSheet(
      instructor: "Captain Underpants",
      student: "2nd Lieutenant Dan",
      missionNum: 12303,
      grades: [],
      overall: Grade.introductory,
      sortieType: SortieType.ims,
      dayNight: DayNight.night,
      date: DateTime(2022),
      sortieNumber: 2,
      length: "2 hours",
    ),
    GradeSheet(
      instructor: "Captain Underpants",
      student: "2nd Lieutenant Kinger",
      missionNum: 12300,
      grades: [],
      overall: Grade.familiar,
      sortieType: SortieType.ims,
      dayNight: DayNight.night,
      date: DateTime(2022),
      sortieNumber: 2,
      length: "2 hours",
      isDraft: false,
    ),
  ];

  List<GradeSheet> get gradeSheets => _gradeSheets;

  List<GradeSheet> get drafts =>
      _gradeSheets.where((gradeSheet) => gradeSheet.isDraft).toList();

  // The .toSet() call is necessary in order to remove duplicates.
  List<int> get missionNumbers =>
      _gradeSheets.map((gradeSheet) => gradeSheet.missionNum).toSet().toList();
}
