import 'package:flutter/cupertino.dart';

import 'grade_enums.dart';
import 'cts_list.dart';
import 'grade_sheet.dart';
import 'user.dart';
import 'users.dart';

class CurrentFlight extends ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Overall section

  String _weather = "";
  DayNight _dayNight = DayNight.noSelection;
  SortieType _sortieType = SortieType.noSelection;
  int _missionNum = 0;
  int _sortieNum = 0;
  static const int max = 4;

  // Individual Students

  final List<GradeSheet> _gradeSheets = [
    GradeSheet(
      // TODO find this by current user instead
      instructor: Users().user.name,
      student: "1",
      missionNum: 0,
      grades: baseGradeItems,
      overall: Grade.noGrade,
      weather: "",
      pilotQual: PilotQual.fpc,
      sortieType: SortieType.ims,
      dayNight: DayNight.day,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      sortieNumber: 0,
      length: "0",
    ),
  ];

  // Getters

  GlobalKey<FormState> get formKey => _formKey;
  List<GradeSheet> get gradeSheets => _gradeSheets;
  String get weather => _weather;
  DayNight get dayNight => _dayNight;
  SortieType get sortieType => _sortieType;
  int get missionNum => _missionNum;

  // Setters

  set weather(String value) {
    _weather = value;
    notifyListeners();
  }

  set dayNight(DayNight value) {
    _dayNight = value;
    notifyListeners();
  }

  set sortieType(SortieType value) {
    _sortieType = value;
    notifyListeners();
  }

  set missionNum(int value) {
    _missionNum = value;
    notifyListeners();
  }

  set sortieNum(int value) {
    _sortieNum = value;
    notifyListeners();
  }

  // Methods

  void update(GradeSheet gradeSheet) {
    int index =
        _gradeSheets.indexWhere((sheet) => sheet.student == gradeSheet.student);
    index == -1
        ? _gradeSheets.add(gradeSheet)
        : _gradeSheets.replaceRange(index, index + 1, [gradeSheet]);
    notifyListeners();
  }

  void updateByStudent(String student, GradeSheet gradeSheet) {
    int index = _gradeSheets.indexWhere((sheet) => sheet.student == student);
    index == -1
        ? _gradeSheets.add(gradeSheet)
        : _gradeSheets.replaceRange(index, index + 1, [gradeSheet]);
    notifyListeners();
  }

  void updateParamsByStudent(String student, Map<String, bool> params) {
    GradeSheet gradeSheet =
        _gradeSheets.firstWhere((sheet) => sheet.student == student);

    for (GradeItem item in gradeSheet.grades) {
      if (params[item.name] == true) {
        item.grade = Grade.noSelection;
      } else {
        item.grade = Grade.noGrade;
      }
    }

    //updateByStudent(student, gradeSheet);

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

  /*void add(User student) {
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
              startTime: DateTime.now(),
              endTime: DateTime.now(),
              sortieNumber: 0,
              length: "0",
            ),
          )
        : null;
    notifyListeners();
  }*/

  void add() {
    _gradeSheets.length < max
        ? _gradeSheets.add(
            GradeSheet(
              // TODO find this by current user instead
              instructor: Users().user.name,
              student: "${gradeSheets.length + 1}",
              missionNum: 0,
              grades: baseGradeItems,
              overall: Grade.noGrade,
              weather: "",
              pilotQual: PilotQual.fpc,
              sortieType: SortieType.ims,
              dayNight: DayNight.day,
              startTime: DateTime.now(),
              endTime: DateTime.now(),
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
