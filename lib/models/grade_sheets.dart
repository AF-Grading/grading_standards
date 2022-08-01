/* import 'dart:collection';
import 'package:flutter/foundation.dart';

import '../models/grade_sheet.dart';
import 'grade_enums.dart';
import 'user.dart';

// fake back end data
class GradeSheets extends ChangeNotifier {
  // TODO inject users so there is only one instance of each user
  final List<GradeSheet> _gradeSheets = [
    GradeSheet(
        instructorId: "cu@spaceforce.mil",
        studentId: "dandandan@spaceforce.mil",
        missionNum: "12303",
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
        overallComments: "Danny is doing a fine job!",
        weather: Weather.imc),
    GradeSheet(
        instructorId: "cu@spaceforce.mil",
        studentId: "dandandan@spaceforce.mil",
        missionNum: "12303",
        grades: [
          GradeItem(
            name: "Communication Skills",
            grade: Grade.introductory,
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
        overallComments: "Danny is doing an okay job!",
        weather: Weather.imc),
    GradeSheet(
        instructorId: "cu@spaceforce.mil",
        studentId: "dandandan@spaceforce.mil",
        missionNum: "12303",
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
        weather: Weather.vmc),
    GradeSheet(
        instructorId: "cu@spaceforce.mil",
        studentId: "dandandan@spaceforce.mil",
        missionNum: "12303",
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
        weather: Weather.imc),
    GradeSheet(
        instructorId: "cu@spaceforce.mil",
        studentId: "king@af.mil",
        missionNum: "12300",
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
        isDraft: false,
        weather: Weather.imc),
    GradeSheet(
        instructorId: "dandandan@spaceforce.mil",
        studentId: "shucks@af.mil",
        missionNum: "12300",
        grades: [
          GradeItem(
            name: "Communication Skills",
            grade: Grade.unsatisfactory,
          ),
          GradeItem(
            name: "Systems Knowledge",
            grade: Grade.unsatisfactory,
          ),
          GradeItem(
            name: "Combat Governing Documents",
            grade: Grade.unsatisfactory,
          ),
          GradeItem(
            name: "Threat Analysis & Mitigation/ Intel Integration",
            grade: Grade.unsatisfactory,
          ),
        ],
        overall: Grade.unsatisfactory,
        sortieType: SortieType.ims,
        dayNight: DayNight.night,
        startTime: DateTime(2022, 7),
        endTime: DateTime(2022, 8),
        isDraft: false,
        weather: Weather.imc),
    GradeSheet(
        instructorId: "dandandan@spaceforce.mil",
        studentId: "king@af.mil",
        missionNum: "12300",
        grades: [
          GradeItem(
            name: "Communication Skills",
            grade: Grade.proficient,
          ),
          GradeItem(
            name: "Systems Knowledge",
            grade: Grade.proficient,
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
        overall: Grade.expert,
        sortieType: SortieType.ims,
        dayNight: DayNight.night,
        startTime: DateTime(2022, 7),
        endTime: DateTime(2022, 8),
        isDraft: false,
        weather: Weather.imc),
  ];

  List<GradeSheet> get gradeSheets => UnmodifiableListView(_gradeSheets);

  List<GradeSheet> get drafts =>
      _gradeSheets.where((gradeSheet) => gradeSheet.isDraft).toList();

  // The .toSet() call is necessary in order to remove duplicates.
  List<String> get missionNumbers =>
      _gradeSheets.map((gradeSheet) => gradeSheet.missionNum).toSet().toList();

  void update(GradeSheet gradeSheet) {
    int index = _gradeSheets.indexOf(gradeSheet);
    index == -1
        ? _gradeSheets.add(gradeSheet)
        : _gradeSheets.replaceRange(index, index + 1, [gradeSheet]);
    notifyListeners();
  }

  String updateById(GradeSheet gradeSheet) {
    int index = _gradeSheets.indexWhere((sheet) => sheet.id == gradeSheet.id);
    index == -1
        ? _gradeSheets.add(gradeSheet)
        : _gradeSheets.replaceRange(index, index + 1, [gradeSheet]);
    notifyListeners();
    return gradeSheet.id;
  }

  void addSheet(GradeSheet sheet) {
    _gradeSheets.add(
      GradeSheet(
        instructorId: sheet.instructorId,
        studentId: sheet.studentId,
        missionNum: sheet.missionNum,
        grades: sheet.grades,
        overall: sheet.overall,
        sortieType: sheet.sortieType,
        dayNight: sheet.dayNight,
        startTime: sheet.startTime,
        endTime: sheet.endTime,
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
 */