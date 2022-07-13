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
  GlobalKey<FormState> _flightKey = GlobalKey<FormState>();
  GlobalKey<FormState> _reviewKey = GlobalKey<FormState>();
  //bool
  // Overall section

  Weather _weather = Weather.noSelection;
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
      instructorId: "",
      studentId: "1",
      missionNum: 0,
      grades: baseGradeItems,
      overall: Grade.noSelection,
      weather: Weather.imc,
      pilotQual: PilotQual.fpc,
      sortieType: SortieType.ims,
      dayNight: DayNight.day,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
    ),
  ];

  // Getters

  GlobalKey<FormState> get newKey => _newKey;
  List<GlobalKey<FormState>> get flightKeys => _flightKeys;
  GlobalKey<FormState> get reviewKey => _reviewKey;
  GlobalKey<FormState> get flightKey => _flightKey;

  List<GradeSheet> get gradeSheets => _gradeSheets;
  Weather get weather => _weather;
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
          _gradeSheets.indexWhere((sheet) => sheet.studentId == user.id) == -1)
      .toList();

  // Setters

  set weather(Weather value) {
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
    return _gradeSheets.indexWhere((element) => element.studentId == student);
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
    int index = _gradeSheets
        .indexWhere((sheet) => sheet.studentId == gradeSheet.studentId);
    index == -1
        ? _gradeSheets.add(gradeSheet)
        : _gradeSheets.replaceRange(index, index + 1, [gradeSheet]);
    notifyListeners();
  }

  void updateByStudent(String student, GradeSheet sheet) {
    int index =
        _gradeSheets.indexWhere((sheets) => sheets.studentId == student);
    index == -1
        ? _gradeSheets.add(sheet)
        : _gradeSheets.replaceRange(index, index + 1, [
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
              //
              //isDraft: false,
            )
          ]);
    notifyListeners();
  }

  void updateParamsByStudent(String student, Map<String, bool> params) {
    GradeSheet gradeSheet =
        _gradeSheets.firstWhere((sheet) => sheet.studentId == student);

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
        instructorId: gradeSheet.instructorId,
        studentId: gradeSheet.studentId,
        missionNum: gradeSheet.missionNum,
        grades: items,
        overall: gradeSheet.overall,
        sortieType: gradeSheet.sortieType,
        dayNight: gradeSheet.dayNight,
        startTime: gradeSheet.startTime,
        endTime: gradeSheet.endTime,
        weather: gradeSheet.weather);

    updateByStudent(student, newSheet);

    notifyListeners();
  }

  void updateByGradeItem(String student, GradeItem item) {
    GradeSheet gradeSheet =
        _gradeSheets.firstWhere((sheet) => sheet.studentId == student);

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
    _flightKey = GlobalKey<FormState>();

    //bool
    // Overall section

    _weather = Weather.noSelection;
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
      instructorId: Users().user.email,
      studentId: "1",

      missionNum: 0,
      grades: baseGradeItems,
      overall: Grade.noSelection,
      weather: Weather.imc,
      pilotQual: PilotQual.fpc,
      sortieType: SortieType.ims,
      dayNight: DayNight.day,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
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
          instructorId: sheet.instructorId,
          studentId: sheet.studentId,
          missionNum: _missionNum,
          grades: sheet.grades,
          overall: sheet.overall,
          sortieType: _sortieType,
          dayNight: _dayNight,
          startTime: _start,
          endTime: _end,
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

  String? add() {
    String? message;
    _gradeSheets.length < max
        ? _gradeSheets.add(
            GradeSheet(
              // TODO find this by current user instead
              instructorId: Users().user.email,
              studentId: "${gradeSheets.length + 1}",
              missionNum: 0,
              grades: baseGradeItems,
              overall: Grade.noSelection,
              weather: Weather.noSelection,
              pilotQual: PilotQual.fpc,
              sortieType: SortieType.ims,
              dayNight: DayNight.day,
              startTime: DateTime.now(),
              endTime: DateTime.now(),
            ),
          )
        : message = "Max Students added";

    notifyListeners();

    return message;
  }

  String? subtract() {
    String? message;
    _gradeSheets.length > 1
        ? _gradeSheets.removeLast()
        : message = "At least 1 student required";

    notifyListeners();

    return message;
  }

  int ensureUnique(User student) {
    return _gradeSheets.indexWhere(
      (element) => element.studentId == student.name,
    );
  }
}
