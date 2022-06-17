// planned model necessary for data retention upon app restart during a flight
import 'package:app_prototype/models/grade_sheet.dart';
import 'package:flutter/foundation.dart';

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
}
