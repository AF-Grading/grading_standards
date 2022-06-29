import 'package:flutter/cupertino.dart';

import 'grade_enums.dart';
import 'user.dart';

class GradeSheet {
  final String id; // = UniqueKey().toString();
  final User instructor; //to be taken from a shared database
  final User student; //to be taken from a shared database
  final int missionNum;
  final List<GradeItem> grades;
  final Grade overall;
  // part of formation and airdrop events
  final AdQual adQual;
  final PilotQual pilotQual;
  final String weather;
  final SortieType sortieType;
  final DayNight dayNight; //seems redundant to date
  // TODO convert to start and end time, and have a length num come from it automatically
  final DateTime startTime;
  final DateTime endTime;
  // int length = startTime - endTime;
  //DateTime date;
  final int sortieNumber; // 1-20
  // user could press start and stop button to generate length
  final String length; //perhaps a time value instead of string
  final String profile; //unsure what this means
  final String overallComments;
  final String recommendations;
  final bool isDraft;

  GradeSheet({
    required this.instructor,
    required this.student,
    required this.missionNum,
    required this.grades,
    required this.overall,
    this.adQual = AdQual.noSelection,
    this.pilotQual = PilotQual.noSelection,
    this.weather = '',
    required this.sortieType,
    required this.dayNight,
    required this.startTime,
    required this.endTime,
    required this.sortieNumber,
    required this.length,
    this.profile = '',
    this.overallComments = '',
    this.recommendations = '',
    this.isDraft = true,
    String? id,
  }) : id = id ?? UniqueKey().toString();
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
