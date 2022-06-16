import 'package:flutter/cupertino.dart';

import 'grade.dart';

enum AdQual { none, ldad, adid, acad, cpad }

enum PilotQual { fpq, fpc, mp, ip }

enum DayNight { day, night }

enum SortieType { local, ims, mission, ost, instmtSim, tacticsSim, mmp, lfe }

class GradeSheet {
  final String id = UniqueKey().toString();
  String instructor; //to be taken from a shared database
  String student; //to be taken from a shared database
  int missionNum;
  List<GradeItem> grades;
  Grade overall;
  // part of formation and airdrop events
  AdQual adQual;
  PilotQual pilotQual;
  String weather;
  SortieType sortieType;
  DayNight dayNight; //seems redundant to date
  //automatic generation
  DateTime date;
  int sortieNumber; // 1-20
  // user could press start and stop button to generate length
  String length; //perhaps a time value instead of string
  String profile; //unsure what this means
  String overallComments;
  String recommendations;
  bool isDraft;

  GradeSheet({
    required this.instructor,
    required this.student,
    required this.missionNum,
    required this.grades,
    required this.overall,
    this.adQual = AdQual.none,
    this.pilotQual = PilotQual.fpq,
    this.weather = '',
    required this.sortieType,
    required this.dayNight,
    required this.date,
    required this.sortieNumber,
    required this.length,
    this.profile = '',
    this.overallComments = '',
    this.recommendations = '',
    this.isDraft = true,
  });
}

class GradeItem {
  String name; //foreign key from cts_list.name
  Grade grade;
  String comments;

  GradeItem({
    required this.name,
    required this.grade,
    this.comments = '',
  });
}
