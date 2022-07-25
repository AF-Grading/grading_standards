//import 'package:app_prototype/models/grade_sheet.dart';
import 'package:app_prototype/pages/spash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/GradeSheet.dart';
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
        "${gradeSheet.grade!.index - 1}",
      ),
      title: UserNameTextBox(
        email: gradeSheet.studentId!,
      ),
      trailing: Text(
          "${gradeSheet.startTime!.toString()}"), //-${gradeSheet.startTime.month}-${gradeSheet.startTime.year}"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SplashPage() //GradeSheetPage(gradeSheet: gradeSheet),
              ),
        );
      },
    );
  }
}
