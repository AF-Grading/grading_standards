import 'package:app_prototype/grade_sheet.dart';
import 'package:flutter/material.dart';

class EditGradeSheetPage extends StatefulWidget {
  const EditGradeSheetPage({Key? key, required this.gradeSheet})
      : super(key: key);

  final GradeSheet gradeSheet;

  @override
  State<EditGradeSheetPage> createState() => _EditGradeSheetPageState();
}

class _EditGradeSheetPageState extends State<EditGradeSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Grade Sheet"),
      ),
      body: Center(
        child: Text(widget.gradeSheet.instructor),
      ),
    );
  }
}
