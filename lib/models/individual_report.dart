import 'package:app_prototype/models/cts_list.dart';
import 'package:flutter/foundation.dart';

import 'grade_enums.dart';
import 'grade_sheet.dart';

// Takes in a list of GradeSheets and returns
// various statistics
class IndividualReport with ChangeNotifier {
  // The gradesheets are injected as a dependcy and
  // should remain unmodfified
  IndividualReport(this._gradeSheets);

  final List<GradeSheet> _gradeSheets;

  List<GradeSheet> get gradeSheets => _gradeSheets;

  // TODO delete
  GradeSheet get first => _gradeSheets.first;

  // Returns the most recently altered gradeItems
  // This assumes grades length and itemnames are in the same spot
  List<GradeItem> get currentGrades {
    List<GradeItem> currentGrades = [];
    Map<String, DateTime> allGradeTimes = {
      for (GradeItem item in baseGradeItems)
        item.name: DateTime.fromMillisecondsSinceEpoch(0)
    };
    Map<String, Grade> allGrades = {
      for (GradeItem item in baseGradeItems) item.name: Grade.noGrade
    };
    for (int i = 0; i < _gradeSheets.length; i++) {
      for (GradeItem grade in _gradeSheets[i].grades) {
        if (allGradeTimes[grade.name]!.millisecondsSinceEpoch <
            _gradeSheets[i].endTime.millisecondsSinceEpoch) {
          if (grade.grade != Grade.noGrade) {
            allGradeTimes.update(
                grade.name, (value) => _gradeSheets[i].endTime);
            allGrades.update(grade.name, (value) => grade.grade);
          }
        }
      }
    }

    allGrades.forEach((key, value) {
      currentGrades.add(GradeItem(name: key, grade: value));
    });

    return currentGrades;
  }
}
