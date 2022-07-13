import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'cts_list.dart';
import 'grade_enums.dart';
import 'grade_sheet.dart';

class TrainingShop with ChangeNotifier {
  // The gradesheets are injected as a dependency and
  // should remain unmodfified
  TrainingShop(this._gradeSheets);

  final List<GradeSheet> _gradeSheets;

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
      // noSelection = -2, noGrade = -1
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

  // Return the average overall grade for each instructor
  List<AverageGrade> get avgPerInstructor {
    Map<String, int> totalNum = {
      for (GradeSheet sheet in _gradeSheets) sheet.instructorId: 0
    };
    Map<String, double> averages = {
      for (GradeSheet sheet in _gradeSheets) sheet.instructorId: 0
    };

    for (GradeSheet sheet in _gradeSheets) {
      if (sheet.overall != Grade.noGrade &&
          sheet.overall != Grade.noSelection) {
        totalNum[sheet.instructorId] = totalNum[sheet.instructorId]! + 1;
        averages[sheet.instructorId] =
            averages[sheet.instructorId]! + sheet.overall.index - 2;
      }
    }

    totalNum.forEach((key, value) {
      if (value != 0) {
        averages[key] = averages[key]! / value;
      }
    });

    List<AverageGrade> current = [];

    averages.forEach((key, value) {
      if (value != 0) current.add(AverageGrade(key, value));
    });

    //current.sort((a, b) => b.average.compareTo(a.average));

    return current;
  }

  // return the average for each grade item, leaving ungraded items as 0
  Map<String, double> get averageGrades {
    Map<String, int> totalNum = {
      for (GradeItem item in baseGradeItems) item.name: 0
    };
    Map<String, double> averages = {
      for (GradeItem item in baseGradeItems) item.name: 0
    };

    for (GradeSheet sheet in _gradeSheets) {
      for (GradeItem item in sheet.grades) {
        if (item.grade != Grade.noGrade && item.grade != Grade.noSelection) {
          totalNum[item.name] = totalNum[item.name]! + 1;
          averages[item.name] = averages[item.name]! + item.grade.index - 2;
        }
      }
    }

    totalNum.forEach((key, value) {
      if (value != 0) {
        averages[key] = averages[key]! / value;
      }
    });

    return averages;
  }

  // return the top 5 average grades, ignoring ungraded items
  List<AverageGrade> get strongFive {
    List<AverageGrade> current = [];

    averageGrades.forEach((key, value) {
      if (value != 0) current.add(AverageGrade(key, value));
    });

    current.sort((a, b) => b.average.compareTo(a.average));

    return current.take(5).toList();
  }

  // return the worst 5 average grades, ignoring ungraded items
  List<AverageGrade> get weakFive {
    List<AverageGrade> current = [];

    averageGrades.forEach((key, value) {
      if (value != 0) current.add(AverageGrade(key, value));
    });

    current.sort((a, b) => a.average.compareTo(b.average));

    return current.take(5).toList();
  }
}

class AverageGrade {
  String name;
  double average;
  AverageGrade(this.name, this.average);
}
