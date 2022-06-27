import 'dart:collection';
import 'package:flutter/foundation.dart';

import '../models/grade_sheet.dart';
import 'grade_enums.dart';

// fake back end data
class GradeSheets extends ChangeNotifier {
  final List<GradeSheet> _gradeSheets = [
    GradeSheet(
      instructor: "Captain Underpants",
      student: "1st Lieutenant Dan",
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
        GradeItem(
          name: "Air Refueling",
          grade: Grade.expert,
        ),
        GradeItem(
          name: "Tactical Arrival Planning/Execution",
          grade: Grade.proficient,
        ),
        GradeItem(
          name: "Assault Landing",
          grade: Grade.familiar,
        ),
      ],
      overall: Grade.introductory,
      sortieType: SortieType.ims,
      dayNight: DayNight.night,
      startTime: DateTime(2021, 4),
      endTime: DateTime(2021, 4),
      sortieNumber: 2,
      overallComments: "Danny is doing a fine job!",
      length: "2 hours",
    ),
    GradeSheet(
      instructor: "Captain Underpants",
      student: "1st Lieutenant Dan",
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
      startTime: DateTime(2021, 4),
      endTime: DateTime(2021, 5),
      sortieNumber: 2,
      overallComments: "Danny is doing an okay job!",
      length: "2 hours",
    ),
    GradeSheet(
      instructor: "Captain Underpants",
      student: "1st Lieutenant Dan",
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
      overall: Grade.proficient,
      sortieType: SortieType.ims,
      dayNight: DayNight.night,
      startTime: DateTime(2022, 5),
      endTime: DateTime(2022, 5),
      sortieNumber: 2,
      length: "2 hours",
    ),
    GradeSheet(
      instructor: "Captain Underpants",
      student: "1st Lieutenant Dan",
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
      startTime: DateTime.now(),
      endTime: DateTime.now(),
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

  void update(GradeSheet gradeSheet) {
    int index = _gradeSheets.indexOf(gradeSheet);
    index == -1
        ? _gradeSheets.add(gradeSheet)
        : _gradeSheets.replaceRange(index, index + 1, [gradeSheet]);
    notifyListeners();
  }

  void addSheet(GradeSheet sheet) {
    _gradeSheets.add(
      GradeSheet(
        instructor: sheet.instructor,
        student: sheet.student,
        missionNum: sheet.missionNum,
        grades: sheet.grades,
        overall: sheet.overall,
        sortieType: sheet.sortieType,
        dayNight: sheet.dayNight,
        startTime: sheet.startTime,
        endTime: sheet.endTime,
        sortieNumber: sheet.sortieNumber,
        length: sheet.length,
        adQual: sheet.adQual,
        pilotQual: sheet.pilotQual,
        weather: sheet.weather,
        profile: sheet.profile,
        overallComments: sheet.overallComments,
        recommendations: sheet.recommendations,
        isDraft: false,
      ),
    );
    notifyListeners();
  }
}
