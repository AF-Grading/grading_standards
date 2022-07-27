import 'package:app_prototype/models/grade_enums.dart';
import 'package:app_prototype/models/grade_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../pages/grade_sheet_page.dart';
import 'user_name_text_box.dart';

class GradeSheetListTile extends StatelessWidget {
  const GradeSheetListTile({Key? key, required this.gradeSheet})
      : super(key: key);

  final GradeSheet gradeSheet;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "${gradeSheet.overall!.number}",
      ),
      title: UserNameTextBox(
        email: gradeSheet.studentId,
      ),
      trailing: Text(
          "${gradeSheet.startTime.day}-${gradeSheet.startTime.month}-${gradeSheet.startTime.year}"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GradeSheetPage(gradeSheet: gradeSheet),
          ),
        );
      },
    );
  }
}
