import 'package:app_prototype/models/grade_sheet.dart';
import 'package:flutter/material.dart';

class EditGradeSheetPage extends StatefulWidget {
  const EditGradeSheetPage({Key? key, required this.gradeSheet})
      : super(key: key);

  final GradeSheet gradeSheet;

  @override
  State<EditGradeSheetPage> createState() => _EditGradeSheetPageState();
}

class _EditGradeSheetPageState extends State<EditGradeSheetPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Grade Sheet"),
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            initialValue: widget.gradeSheet.student,
            decoration: const InputDecoration(
              labelText: "Student",
            ),
            onSaved: (value) => widget.gradeSheet.student = value!,
          )
        ]),
      ),
    );
  }
}
