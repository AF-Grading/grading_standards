// planned model necessary for data retention upon app restart during a flight
import 'package:app_prototype/models/cts_list.dart';
import 'package:app_prototype/models/grade_sheet.dart';
import 'package:app_prototype/models/user.dart';
import 'package:app_prototype/models/users.dart';
import 'package:flutter/foundation.dart';

import 'grade.dart';

class CurrentFlight extends ChangeNotifier {
  final List<GradeSheet> _gradeSheets = [];
  // Max 4 students per flight
  final int max = 4;

  List<GradeSheet> get gradeSheets => _gradeSheets;

  void update(GradeSheet gradeSheet) {
    int index = _gradeSheets.indexOf(gradeSheet);
    index == -1
        ? _gradeSheets.add(gradeSheet)
        : _gradeSheets.replaceRange(index, index + 1, [gradeSheet]);
    notifyListeners();
  }

  void delete(GradeSheet gradeSheet) {
    _gradeSheets.remove(gradeSheet);
    notifyListeners();
  }

  void clear() {
    _gradeSheets.clear();
    notifyListeners();
  }

  void removeLast() {
    _gradeSheets.isNotEmpty ? _gradeSheets.removeLast() : null;
    notifyListeners();
  }

  void add(User student) {
    _gradeSheets.length < max
        ? _gradeSheets.add(
            GradeSheet(
              // TODO find this by current user instead
              instructor: Users().user.name,
              student: student.name,
              missionNum: 0,
              grades: baseGradeItems,
              overall: Grade.noGrade,
              weather: "",
              pilotQual: PilotQual.fpc,
              sortieType: SortieType.ims,
              dayNight: DayNight.day,
              date: DateTime.now(),
              sortieNumber: 0,
              length: "0",
            ),
          )
        : null;
    notifyListeners();
  }

  int ensureUnique(User student) {
    return _gradeSheets.indexWhere(
      (element) => element.student == student.name,
    );
  }
}
