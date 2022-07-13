import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade_sheet.dart';
import '../pages/grade_sheet_page.dart';

class AllGradeSheetsView extends StatelessWidget {
  const AllGradeSheetsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<GradeSheet>>(builder: (context, stream, _) {
      print(stream.length);
      return Column(
          children: stream
              .map(
                (gradeSheet) => ListTile(
                  leading: Text(
                    gradeSheet.studentId,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GradeSheetPage(gradeSheet: gradeSheet)),
                    );
                  },
                ),
              )
              .toList());
    });
  }
}
