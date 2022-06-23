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
  // filters the users out that appear in _gradesheets
  List<User> get filteredUsers => Users()
      .users
      .where((user) =>
          _gradeSheets.indexWhere((sheet) => sheet.student == user.name) == -1)
      .toList();

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

  void updateByStudent(String student, GradeSheet sheet) {
    int index = _gradeSheets.indexWhere((sheets) => sheets.student == student);
    index == -1
        ? _gradeSheets.add(sheet)
        : _gradeSheets.replaceRange(index, index + 1, [
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
              length:
                  (_end.microsecondsSinceEpoch - _start.microsecondsSinceEpoch)
                      .toString(),
              adQual: sheet.adQual,
              pilotQual: sheet.pilotQual,
              weather: sheet.weather,
              profile: sheet.profile,
              overallComments: sheet.overallComments,
              recommendations: sheet.recommendations,
              //
              //isDraft: false,
            )
          ]);
    notifyListeners();
  }

  void updateParamsByStudent(String student, Map<String, bool> params) {
    GradeSheet gradeSheet =
        _gradeSheets.firstWhere((sheet) => sheet.student == student);

    List<GradeItem> items = [];
    for (GradeItem item in gradeSheet.grades) {
      if (params[item.name] == true) {
        items.add(GradeItem(name: item.name, grade: Grade.noSelection));
        //item.grade = Grade.noSelection;
      } else {
        items.add(GradeItem(name: item.name, grade: Grade.noGrade));
        //item.grade = Grade.noGrade;
      }
    }

    GradeSheet newSheet = GradeSheet(
      instructor: gradeSheet.instructor,
      student: gradeSheet.student,
      missionNum: gradeSheet.missionNum,
      grades: items,
      overall: gradeSheet.overall,
      sortieType: gradeSheet.sortieType,
      dayNight: gradeSheet.dayNight,
      startTime: gradeSheet.startTime,
      endTime: gradeSheet.endTime,
      sortieNumber: gradeSheet.sortieNumber,
      length: gradeSheet.length,
    );

    updateByStudent(student, newSheet);

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

  // Adds the general items to each gradesheet
  void updateAll() {
    for (int i = 0; i < _gradeSheets.length; i++) {
      GradeSheet sheet = _gradeSheets[i];
      _gradeSheets.replaceRange(i, i + 1, [
        GradeSheet(
          instructor: sheet.instructor,
          student: sheet.student,
          missionNum: _missionNum,
          grades: sheet.grades,
          overall: sheet.overall,
          sortieType: _sortieType,
          dayNight: _dayNight,
          startTime: _start,
          endTime: _end,
          sortieNumber: _sortieNum,
          length: (_end.microsecondsSinceEpoch - _start.microsecondsSinceEpoch)
              .toString(),
          adQual: sheet.adQual,
          pilotQual: sheet.pilotQual,
          weather: _weather,
          profile: _profile,
          overallComments: sheet.overallComments,
          recommendations: sheet.recommendations,
          //
          //isDraft: false,
        )
      ]);
    }

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
