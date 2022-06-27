import 'package:app_prototype/models/cts_list.dart';
import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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

  // TODO remove noGrade items
  List<GradeItem> get bestFive {
    List<GradeItem> current = currentGrades
        .where((gradeItem) => gradeItem.grade != Grade.noGrade)
        .toList();

    current.sort((a, b) => b.grade.index.compareTo(a.grade.index));

    return current.take(5).toList();
  }

  // TODO remove noGrade items
  List<GradeItem> get worstFive {
    List<GradeItem> current = currentGrades
        .where((gradeItem) => gradeItem.grade != Grade.noGrade)
        .toList();

    current.sort((a, b) => a.grade.index.compareTo(b.grade.index));

    return current.take(5).toList();
  }

  double get overallAverage {
    int total = 0;
    for (GradeSheet sheet in _gradeSheets) {
      // noSelection = -1, noGrade = 0
      total += sheet.overall.index - 2;
    }

    return total / _gradeSheets.length;
  }

  String get mostRecentComment {
    int newest = 0;
    String comment = '';
    for (GradeSheet sheet in _gradeSheets) {
      if (sheet.endTime.millisecondsSinceEpoch > newest) {
        if (sheet.overallComments != "") comment = sheet.overallComments;
        newest = sheet.endTime.millisecondsSinceEpoch;
      }
    }

    return comment;
  }

  List<charts.Series<GradeSheet, DateTime>> get overallChart {
    //List<Grade> grades = [for (GradeSheet sheet in _gradeSheets) sheet.overall];

    List<charts.Series<GradeSheet, DateTime>> series = [
      charts.Series(
        id: "Overall",
        data: _gradeSheets,
        measureFn: (GradeSheet grade, _) => grade.overall.index - 2,
        domainFn: (GradeSheet time, _) => time.endTime,
      )
    ];

    return series;
  }
}
