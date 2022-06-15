import 'dart:collection';

import 'package:app_prototype/models/cts_list.dart';
import 'package:app_prototype/models/grade_sheet.dart';
import 'package:flutter/foundation.dart';

// fake back end data
class GradeSheets extends ChangeNotifier {
  final List<GradeSheet> _gradeSheets = [
    GradeSheet(
      instructor: "Captain Underpants",
      student: "2nd Lieutenant Dan",
      missionNum: 12303,
      grades: [
        GradeItem(
          name: "Communication Skills",
          grade: Grade.familiar,
        ),
        GradeItem(
          name: "Systems Knowledge",
          grade: Grade.familiar,
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
      grades: [
        GradeItem(
          name: "Communication Skills",
          grade: Grade.familiar,
        ),
        GradeItem(
          name: "Systems Knowledge",
          grade: Grade.introductory,
        ),
        GradeItem(
          name: "Combat Governing Documents",
          grade: Grade.familiar,
        ),
        GradeItem(
          name: "Threat Analysis & Mitigation/ Intel Integration",
          grade: Grade.expert,
        ),
      ],
      overall: Grade.familiar,
      sortieType: SortieType.ims,
      dayNight: DayNight.night,
      date: DateTime(2022),
      sortieNumber: 2,
      length: "2 hours",
      isDraft: false,
    ),
  ];

  List<GradeSheet> get gradeSheets => UnmodifiableListView(_gradeSheets);

  List<GradeSheet> get drafts =>
      _gradeSheets.where((gradeSheet) => gradeSheet.isDraft).toList();

  // The .toSet() call is necessary in order to remove duplicates.
  List<int> get missionNumbers =>
      _gradeSheets.map((gradeSheet) => gradeSheet.missionNum).toSet().toList();

  void add(GradeSheet gradeSheet) {
    _gradeSheets.add(gradeSheet);
    notifyListeners();
    print("GradeSheets: Added grade sheet");
  }

  void edit(GradeSheet gradeSheet) {
    _gradeSheets.removeWhere((gs) => gs.id == gradeSheet.id);
    _gradeSheets.add(gradeSheet);
    notifyListeners();
  }
}
