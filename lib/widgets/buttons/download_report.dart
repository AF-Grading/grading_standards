import 'dart:convert';
import 'dart:io';

import 'package:app_prototype/models/cts_list.dart';
import 'package:app_prototype/models/user_setting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:download/download.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
//import 'package:universal_html/html.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../models/grade_sheet.dart';
import '../../models/grade_enums.dart';

class DownloadReport extends StatelessWidget {
  const DownloadReport(
      {Key? key,
      required this.gradeSheets,
      required this.users,
      required this.filename})
      : super(key: key);

  final List<GradeSheet> gradeSheets;
  final List<UserSetting> users;
  final String filename;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        gradeSheets.sort((a, b) => b.startTime.compareTo(a.startTime));
        List<List<dynamic>> data = [];
        List<dynamic> first = [];
        first.add("Date");
        first.add("Length");
        first.add("Overall Grade");
        first.add("Instructor");
        first.add("Student");
        first.add("Mission Number");
        first.add("Overall Comments");
        first.add("Recommendations");
        first.add("Sortie Profile");
        first.add("Weather");
        first.add("Day/Night");
        first.add("Sortie Type");
        for (GradeItem item in baseGradeItems) {
          first.add(item.name);
        }

        data.add(first);
        for (GradeSheet sheet in gradeSheets) {
          List<dynamic> row = [];
          row.add(sheet.startTime);
          row.add(sheet.startTime.difference(sheet.endTime));
          row.add(sheet.overall!.index - 1);
          row.add(users
              .firstWhere((element) => element.email == sheet.instructorId)
              .name);
          row.add(users
              .firstWhere((element) => element.email == sheet.studentId)
              .name);
          row.add(sheet.missionNum);
          row.add(sheet.overallComments);
          row.add(sheet.recommendations);
          row.add(sheet.profile);
          row.add(sheet.weather!.name);
          row.add(sheet.dayNight.prettyDayNight);
          row.add(sheet.sortieType.prettySortie);
          for (GradeItem item in sheet.grades) {
            row.add(item.grade!.index - 1);
          }

          data.add(row);
        }

        String csv = const ListToCsvConverter().convert(data);

        if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
          /*await FlutterDownloader.initialize();

          FirebaseFirestore.instance.;

          final bytes = utf8.encode(csv);
          final blob = Blob([bytes]);
          final url = Url.createObjectUrlFromBlob(blob);
          final anchor = document.createElement('a') as AnchorElement
            ..href = url
            ..style.display = 'none'
            ..download = '${filename}.csv';

          document.body!.children.add(anchor);

          anchor.click();

          final stream = Stream.fromIterable(csv.codeUnits);

          final taskId = await FlutterDownloader.enqueue(
              url: url, savedDir: '/storage/emulated/0/Download/');*/

          File file = File('/storage/emulated/0/Download/${filename}.csv');
          file.writeAsString(csv);
        } else {
          final stream = Stream.fromIterable(csv.codeUnits);
          download(stream, "${filename}.csv");
        }
      },
      child: Icon(Icons.download),
    );
  }
}
