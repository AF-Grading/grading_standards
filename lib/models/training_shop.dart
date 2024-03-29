import 'package:app_prototype/models/grading_criterion.dart';
import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:timer_builder/timer_builder.dart';

import 'cts_list.dart';
import 'grade_enums.dart';
import 'grade_sheet.dart';

class TrainingShop with ChangeNotifier {
  // The gradesheets are injected as a dependency and
  // should remain unmodfified
  TrainingShop(this._gradeSheets, this._gradeItems);

  final List<GradingCriterion> _gradeItems;
  final List<GradeSheet> _gradeSheets;

  late DateTime _startDate = DateTime(
      sortedGradeSheets[0].startTime.year,
      sortedGradeSheets[0].startTime.month,
      sortedGradeSheets[0].startTime.day - 1);
  DateTime _endDate = DateTime.now();

  // sets the start date
  set dateStart(DateTime value) {
    _startDate = value;
    notifyListeners();
  }

  // sets the end date
  set dateEnd(DateTime value) {
    _endDate = value;
    notifyListeners();
  }

  List<GradeSheet> get gradeSheets => _gradeSheets;

  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;

  // Returns the grade sheets that are sorted interms of start dates into ordered list
  List<GradeSheet> get sortedGradeSheets {
    List<GradeSheet> sorted = _gradeSheets.toList();

    for (int i = 0; i < sorted.length; i++) {
      GradeSheet key = sorted[i];
      int j = i - 1;

      while (j >= 0 && key.startTime.isBefore(sorted[j].startTime)) {
        sorted[j + 1] = sorted[j];
        j = j - 1;
      }
      sorted[j + 1] = key;
    }

    return sorted;
  }

  Map<String, List<num>> get firstHalf {
    // having a map with the key being the grading criterion and the value being an array
    // storing the start, end, and the difference between the two

    // sample array: [start total, time seen]
    Map<String, List<num>> firstHalf = {};

    // this does not have the optimal run time
    for (int i = 0; i < ((modifiedSortedGradeSheets.length) / 2).floor(); i++) {
      modifiedSortedGradeSheets[i].grades.forEach((element) {
        if (element.grade != Grade.noGrade) {
          if (firstHalf.containsKey(element.name)) {
            firstHalf[element.name]![0] += int.parse(element.grade!.number);
            firstHalf[element.name]![1] += 1;
          } else {
            firstHalf[element.name] = [int.parse(element.grade!.number), 1];
          }
        }
      });
    }

    firstHalf.keys.forEach((key) {
      firstHalf[key]![0] /= firstHalf[key]![1];
    });
    // we left off on summing all of the items together

    return firstHalf;
  }

  Map<String, List<num>> get secondHalf {
    // return total / ((modifiedSortedGradeSheets.length) / 2).ceil();
    Map<String, List<num>> secondHalf = {};

    // this does not have the optimal run time
    for (int i = ((modifiedSortedGradeSheets.length) / 2).floor();
        i < modifiedSortedGradeSheets.length;
        i++) {
      modifiedSortedGradeSheets[i].grades.forEach((element) {
        if (element.grade != Grade.noGrade) {
          if (secondHalf.containsKey(element.name)) {
            secondHalf[element.name]![0] += int.parse(element.grade!.number);
            secondHalf[element.name]![1] += 1;
          } else {
            secondHalf[element.name] = [int.parse(element.grade!.number), 1];
          }
        }
      });
    }

    secondHalf.keys.forEach((key) {
      secondHalf[key]![0] /= secondHalf[key]![1];
    });
    // we left off on summing all of the items together

    return secondHalf;
  }

  // Returns the sorted grade sheets that are between the start and end dates
  List<GradeSheet> get modifiedSortedGradeSheets {
    List<GradeSheet> modified = [];
    sortedGradeSheets.forEach((element) {
      if (element.startTime.isAfter(_startDate) &&
          element.endTime.isBefore(_endDate)) {
        modified.add(element);
      }
    });
    return modified;
  }

  // Returns the most recently altered gradeItems
  // This assumes grades length and itemnames are in the same spot
  List<GradeItem> get currentGrades {
    List<GradeItem> currentGrades = [];
    Map<String, DateTime> allGradeTimes = {
      for (GradingCriterion item in _gradeItems)
        item.criterion: DateTime.fromMillisecondsSinceEpoch(0)
    };
    Map<String, Grade> allGrades = {
      for (GradingCriterion item in _gradeItems) item.criterion: Grade.noGrade
    };
    for (int i = 0; i < modifiedGradeSheets.length; i++) {
      for (GradeItem grade in modifiedGradeSheets[i].grades) {
        if (!allGradeTimes.containsKey(grade.name)) {
          allGradeTimes[grade.name] = DateTime.fromMicrosecondsSinceEpoch(0);
          allGrades[grade.name] = Grade.noGrade;
        }
        if (allGradeTimes[grade.name]!.millisecondsSinceEpoch <
            modifiedGradeSheets[i].endTime.millisecondsSinceEpoch) {
          if (grade.grade != Grade.noGrade) {
            allGradeTimes.update(
                grade.name, (value) => modifiedGradeSheets[i].endTime);
            allGrades.update(grade.name, (value) => grade.grade!);
          }
        }
      }
    }

    allGrades.forEach((key, value) {
      currentGrades.add(GradeItem(name: key, grade: value));
    });

    return currentGrades;
  }

  // returns the average of the grades for the the grade items between selelct period
  double get overallAverage {
    int total = 0;
    for (GradeSheet sheet in modifiedGradeSheets) {
      // noSelection = -2, noGrade = -1
      if (sheet.overall! != Grade.noGrade) {
        total += int.parse(sheet.overall!.number);
      }
    }

    return total / modifiedGradeSheets.length;
  }

  // returns the most recent comment of all time
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

  // reutrns the most recent recommendation of all time
  String get mostRecentRecommendation {
    int newest = 0;
    String recommendation = '';
    for (GradeSheet sheet in _gradeSheets) {
      if (sheet.endTime.millisecondsSinceEpoch > newest) {
        if (sheet.recommendations != "") recommendation = sheet.recommendations;
        newest = sheet.endTime.millisecondsSinceEpoch;
      }
    }

    return recommendation;
  }

  // this method will return a list of grade sheets that are within the given date range (start date and end date)
  List<GradeSheet> get modifiedGradeSheets {
    List<GradeSheet> modified = [];
    gradeSheets.forEach((element) {
      if (element.startTime.isAfter(_startDate) &&
          element.endTime.isBefore(_endDate)) {
        modified.add(element);
      }
    });
    return modified;
  }

  // returns the time sereis char of the average of the student at the specific date
  List<charts.Series<AverageGradeSheet, DateTime>> get overallChart {
    Map<DateTime, List<GradeSheet>> average_time_sheets = {};

    modifiedGradeSheets.forEach((element) {
      average_time_sheets.update(
        alignDateTime(element.endTime, const Duration(days: 1)),
        ((value) {
          value.add(element);
          return value;
        }),
        ifAbsent: () => [element],
      );
    });

    List<AverageGradeSheet> score_sheets = [];

    average_time_sheets.forEach((key, value) {
      double temp = 0;
      value.forEach((element) {
        if (element.overall != Grade.noGrade) {
          temp += int.parse(element.overall!.number);
        }
      });
      AverageGradeSheet temp_sheet =
          AverageGradeSheet(key, temp / value.length);

      score_sheets.add(temp_sheet);
    });

    List<charts.Series<AverageGradeSheet, DateTime>> series = [
      charts.Series(
        id: "Overall",
        data: score_sheets,
        measureFn: (AverageGradeSheet sheet, _) => sheet.average,
        domainFn: (AverageGradeSheet sheet, _) => sheet.date,
      )
    ];
    return series;
  }

  // return the average for each grade item, leaving ungraded items as 0
  Map<String, double> get averageGrades {
    Map<String, int> totalNum = {
      for (GradingCriterion item in _gradeItems) item.criterion: 0
    };
    Map<String, double> averages = {
      for (GradingCriterion item in _gradeItems) item.criterion: 0
    };

    for (GradeSheet sheet in modifiedGradeSheets) {
      if (sheet.startTime.isAfter(_startDate) &&
          sheet.endTime.isBefore(_endDate)) {
        for (GradeItem item in sheet.grades) {
          if (!totalNum.containsKey(item.name)) {
            totalNum[item.name] = 0;
            averages[item.name] = 0;
          }
          if (item.grade != Grade.noGrade) {
            totalNum[item.name] = totalNum[item.name]! + 1;
            averages[item.name] =
                averages[item.name]! + int.parse(item.grade!.number);
          }
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

  // TODO remove noGrade items
  List<GradeItem> get bestFive {
    List<GradeItem> current = currentGrades
        .where((gradeItem) => gradeItem.grade != Grade.noGrade)
        .toList();

    current.sort((a, b) => b.grade!.index.compareTo(a.grade!.index));

    return current.take(5).toList();
  }

  // TODO remove noGrade items
  List<GradeItem> get worstFive {
    List<GradeItem> current = currentGrades
        .where((gradeItem) => gradeItem.grade != Grade.noGrade)
        .toList();

    current.sort((a, b) => a.grade!.index.compareTo(b.grade!.index));

    return current.take(5).toList();
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

  // returns the average of the grades for the instructors grade items between selelct period
  List<AverageGrade> get avgPerInstructor {
    Map<String, int> totalNum = {
      for (GradeSheet sheet in modifiedGradeSheets) sheet.instructorId: 0
    };
    Map<String, double> averages = {
      for (GradeSheet sheet in modifiedGradeSheets) sheet.instructorId: 0
    };

    for (GradeSheet sheet in modifiedGradeSheets) {
      if (sheet.overall != null && sheet.overall != Grade.noGrade) {
        totalNum[sheet.instructorId] = totalNum[sheet.instructorId]! + 1;
        averages[sheet.instructorId] =
            averages[sheet.instructorId]! + int.parse(sheet.overall!.number);
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
}

class AverageGrade {
  String name;
  double average;
  AverageGrade(this.name, this.average);
}

class AverageGradeSheet {
  DateTime date;
  double average;
  AverageGradeSheet(this.date, this.average);
}
