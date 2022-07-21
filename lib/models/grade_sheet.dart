import 'package:app_prototype/models/user_setting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'cts_list.dart';
import 'grade_enums.dart';

class GradeSheet {
  final String id;
  final String instructorId;
  final String studentId;
  final int missionNum;
  final List<GradeItem> grades;
  final Grade? overall;
  final AdQual adQual; //TODO does this need to be on gsheet?
  final PilotQual pilotQual;
  final Weather? weather;
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
    this.overall,
    this.adQual = AdQual.none,
    this.pilotQual = PilotQual.fpc,
    this.weather,
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

  factory GradeSheet.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return GradeSheet(
      instructorId: data?['instructorId'],
      studentId: data?['studentId'],
      missionNum: data?['missionNum'],
      grades: data?['grades'] is Iterable
          ? (data?['grades'] as Iterable)
              .map((gradeItem) => GradeItem(
                  name: gradeItem?['name'],
                  grade: (gradeItem?['grade'] as String).grade!,
                  comments: gradeItem?['comments']))
              .toList()
          : [],
      overall: (data?['overall'] as String).grade!,
      adQual: (data?['adQual'] as String).adQual!,
      pilotQual: (data?['pilotQual'] as String).pilotQual!,
      weather: (data?['weather'] as String).weather!,
      sortieType: (data?['sortieType'] as String).sortieType!,
      dayNight: (data?['dayNight'] as String).dayNight!,
      startTime: DateTime.fromMillisecondsSinceEpoch(data?['startTime']),
      endTime: DateTime.fromMillisecondsSinceEpoch(data?['endTime']),
      profile: data?['profile'],
      overallComments: data?['overallComments'],
      recommendations: data?['recommendations'],
      id: data?['id'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "instructorId": instructorId,
      "studentId": studentId,
      "missionNum": missionNum,
      "grades": grades.map((e) => e.toFirestore()).toList(),
      "overall": overall!.name,
      "adQual": adQual.name,
      "pilotQual": pilotQual.name,
      "weather": weather!.name,
      "sortieType": sortieType.name,
      "dayNight": dayNight.name,
      "startTime": startTime.millisecondsSinceEpoch,
      "endTime": endTime.millisecondsSinceEpoch,
      "profile": profile,
      "overallComments": overallComments,
      "recommendations": recommendations,
      "id": id
    };
  }

  String copy(String instructorName, UserSetting student) {
    String getScore(CTSItem ctsItem) {
      if (ctsItem.isAirdrop) {
        AirDropTableDescription ad =
            airDropDescriptions.firstWhere((ad) => ad.id == ctsItem.id);
        switch (student.adQual) {
          case AdQual.none:
            return "";
          case AdQual.ldad:
            return ad.ldad.toString();
          case AdQual.adip:
            return ad.adip.toString();
          case AdQual.acad:
            return ad.acad.toString();
          case AdQual.cpad:
            return ad.cpad.toString();
        }
      } else {
        TableDescription td =
            tableDescriptions.firstWhere((td) => td.id == ctsItem.id);
        switch (student.pilotQual) {
          case PilotQual.fpc:
            return td.fpc.toString();
          case PilotQual.fpq:
            return td.fpq.toString();
          case PilotQual.ip:
            return td.ip.toString();
          case PilotQual.mp:
            return td.mp.toString();
        }
      }
    }

    String myString = '''INSTRUCTOR NAME: $instructorName
STUDENT NAME: ${student.name}
PILOT QUAL: ${pilotQual.name.toUpperCase()}
PROFILE: $profile
Sortie Type: ${sortieType.name.toUpperCase()}
DATE(S): ${startTime.day}-${startTime.month}-${startTime.year}
Weather: ${weather!.name}
Day/Night: ${dayNight.name}
Length: ${endTime.difference(startTime).inSeconds}
        
.PS.|GRADE| EVENT | COMMENTS\n''';

    for (int i = 0; i < grades.length; i++) {
      myString +=
          "_${getScore(ctsItems[i])}|__${grades[i].grade!.index - 1}___| ${i + 1}. ${grades[i].name} ${grades[i].comments}\n";
    }

    myString += '''\n OVERALL GRADE: ${overall!.index - 2}

RECOMMENDATION / NEXT: $recommendations''';

    return myString;
  }
}

class GradeItem {
  String name; //foreign key from cts_list.name
  Grade? grade;
  String comments;

  GradeItem({
    required this.name,
    this.grade,
    this.comments = '',
  });

  Map<String, dynamic> toFirestore() {
    return {"name": name, "grade": grade!.name, "comments": comments};
  }

  factory GradeItem.unMap(
    Map<String, dynamic> snapshot,
  ) {
    return GradeItem(
      name: snapshot['name'],
      grade: (snapshot['grade'] as String).grade!,
      comments: snapshot['comments'],
    );
  }
}
