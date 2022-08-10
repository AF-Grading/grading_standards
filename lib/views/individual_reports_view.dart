import 'package:app_prototype/models/grade_sheets.dart';
import 'package:app_prototype/models/user_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade_sheet.dart';
import '../models/user.dart';
import '../models/users.dart';
import '../pages/individual_report_page.dart';

class IndividualReportsView extends StatelessWidget {
  const IndividualReportsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO change this list depending on user permissions
    // for example: the captain of one squadron can't see another's students

    return Consumer<List<UserSetting>>(
      builder: ((context, usersProvider, child) {
        List<UserSetting> users = usersProvider;
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Center(child: Text("${user.rank.pretty} ${user.name}")),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IndividualReportPage(
                      user: users[index],
                      // pass the gradeSheets that this user is a student of
                      gradeSheets: context
                          .watch<List<GradeSheet>>()
                          // .gradeSheets
                          .where((gradeSheet) =>
                              gradeSheet.studentId == user.email)
                          .toList(),
                    ),
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
