import 'package:flutter/cupertino.dart';

import 'grade_enums.dart';
import 'cts_list.dart';
import 'grade_sheet.dart';
import 'user.dart';
import 'users.dart';

class CurrentFlight extends ChangeNotifier {
  GlobalKey<FormState> _newKey = GlobalKey<FormState>();
  final List<GlobalKey<FormState>> _flightKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  GlobalKey<FormState> _reviewKey = GlobalKey<FormState>();
  //bool
  // Overall section

  String _weather = "";
  DayNight _dayNight = DayNight.noSelection;
  SortieType _sortieType = SortieType.noSelection;
  int _missionNum = 0;
  int _sortieNum = 0;
  String _profile = "";
  DateTime _start = DateTime.now();
  DateTime _end = DateTime.now();
  static const int max = 4;

  // Individual Students

  final List<GradeSheet> _gradeSheets = [
    GradeSheet(
      // TODO find this by current user instead
      instructor: Users().user.name,
      student: "1",
      missionNum: 0,
      grades: baseGradeItems,
      overall: Grade.noSelection,
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

  GlobalKey<FormState> get newKey => _newKey;
  List<GlobalKey<FormState>> get flightKeys => _flightKeys;
  GlobalKey<FormState> get reviewKey => _reviewKey;
  List<GradeSheet> get gradeSheets => _gradeSheets;
  String get weather => _weather;
  DayNight get dayNight => _dayNight;
  SortieType get sortieType => _sortieType;
  int get missionNum => _missionNum;
  int get sortieNum => _sortieNum;
  String get profile => _profile;
  DateTime get startTime => _start;
  DateTime get endTime => _end;

  // Setters

  set weather(String value) {
    _weather = value;
    notifyListeners();
  }

  set profile(String value) {
    _profile = value;
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

  int index(String student) {
    return _gradeSheets.indexWhere((element) => element.student == student);
  }

  void end() {
    _end = DateTime.now();
    notifyListeners();
  }

  void start() {
    _start = DateTime.now();
    notifyListeners();
  }

  bool validate() {
    bool isValid = true;
    for (GlobalKey<FormState> key in _flightKeys) {
      if (key.currentState != null) {
        if (!key.currentState!.validate()) {
          isValid = false;
        }
      }
    }
    return isValid;
  }

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

  void updateByGradeItem(String student, GradeItem item) {
    GradeSheet gradeSheet =
        _gradeSheets.firstWhere((sheet) => sheet.student == student);

    int index = gradeSheet.grades
        .indexWhere((gradeItem) => gradeItem.name == item.name);

    gradeSheet.grades.replaceRange(index, index + 1, [item]);

    notifyListeners();
  }

  void delete(GradeSheet gradeSheet) {
    _gradeSheets.remove(gradeSheet);
    notifyListeners();
  }

  void clear() {
    _newKey = GlobalKey<FormState>();
    _flightKeys.clear();
    for (int i = 0; i < 4; i++) {
      _flightKeys.add(GlobalKey<FormState>());
    }
    _reviewKey = GlobalKey<FormState>();
    //bool
    // Overall section

    _weather = "";
    _dayNight = DayNight.noSelection;
    _sortieType = SortieType.noSelection;
    _missionNum = 0;
    _sortieNum = 0;
    _profile = "";
    _start = DateTime.now();
    _end = DateTime.now();
    _gradeSheets.clear();
    _gradeSheets.add(GradeSheet(
      // TODO find this by current user instead
      instructor: Users().user.name,
      student: "1",
      missionNum: 0,
      grades: baseGradeItems,
      overall: Grade.noSelection,
      weather: "",
      pilotQual: PilotQual.fpc,
      sortieType: SortieType.ims,
      dayNight: DayNight.day,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      sortieNumber: 0,
      length: "0",
    ));
    notifyListeners();
  }

  void clearSheets() {
    _gradeSheets.clear();
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
              overall: Grade.noSelection,
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
