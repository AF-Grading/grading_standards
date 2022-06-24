import 'package:app_prototype/models/grade_sheet.dart';
import 'package:app_prototype/models/individual_report.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/user.dart';

class IndividualReportPage extends StatelessWidget {
  const IndividualReportPage({
    Key? key,
    required this.user,
    required this.gradeSheets,
  }) : super(key: key);

  final User user;
  final List<GradeSheet> gradeSheets;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IndividualReport(gradeSheets),
      builder: (context, individualReport) {
        return Scaffold(
          appBar: AppBar(title: Text(user.name)),
          body: Column(
            children:
                //Text(context.watch<IndividualReport>().first.student),
                context
                    .watch<IndividualReport>()
                    .currentGrades
                    .map((grade) => ListTile(
                          title: Text(grade.name),
                          subtitle: Text(grade.grade.index.toString()),
                        ))
                    .toList(),
          ),
        );
      },
    );
  }
}
