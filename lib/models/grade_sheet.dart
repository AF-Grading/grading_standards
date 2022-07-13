import 'package:flutter/cupertino.dart';

import 'grade_enums.dart';

class GradeSheet {
  final String id;
  final String instructorId;
  final String studentId;
  final int missionNum;
  final List<GradeItem> grades;
  final Grade overall;
  final AdQual adQual; //TODO does this need to be on gsheet?
  final PilotQual pilotQual;
  final Weather weather;
  final SortieType sortieType;
  final DayNight dayNight;
  final DateTime startTime;
  final DateTime endTime;
  final String profile;
  final String overallComments;
  final String recommendations;
  final bool isDraft;

  GradeSheet({
    required this.instructorId,
    required this.studentId,
    required this.missionNum,
    required this.grades,
    required this.overall,
    this.adQual = AdQual.noSelection,
    this.pilotQual = PilotQual.noSelection,
    required this.weather,
    required this.sortieType,
    required this.dayNight,
    required this.startTime,
    required this.endTime,
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
