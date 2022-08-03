import 'package:app_prototype/models/cts_list.dart';
import 'package:app_prototype/models/user_setting.dart';
import 'package:csv/csv.dart';
import 'package:download/download.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
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
        if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
          Map<Permission, PermissionStatus> statuses = await [
            Permission.storage,
          ].request();
        }

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
        final stream = Stream.fromIterable(csv.codeUnits);
        /*String dir = await ExtStorage.getExternalStoragePublicDirectory(
            ExtStorage.DIRECTORY_DOWNLOADS);
        print("dir $dir");
        String file = "$dir";*/

        //File f = File("${file}/${filename}.csv");

        download(stream, "${filename}.csv");

        //f.writeAsString(csv);
      },
      child: Icon(Icons.download),
    );
  }
}
