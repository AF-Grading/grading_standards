import 'package:app_prototype/widgets/editable_grade_radios.dart';
import 'package:flutter/material.dart';

import '../models/grade_enums.dart';
import '../models/grade_sheet.dart';

class EditableGradeItem extends StatefulWidget {
  const EditableGradeItem(
      {Key? key, required this.gradeItem, required this.onChanged})
      : super(key: key);

  final GradeItem gradeItem;
  final ValueChanged<GradeItem> onChanged;

  @override
  State<EditableGradeItem> createState() => _EditableGradeItemState();
}

class _EditableGradeItemState extends State<EditableGradeItem> {
  late Grade _grade;
  late String _comments;

  @override
  void initState() {
    _grade = widget.gradeItem.grade;
    _comments = widget.gradeItem.comments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditableGradeRadios(
            name: widget.gradeItem.name,
            grade: _grade,
            onChanged: (value) {
              setState(() {
                _grade = value;
              });
              widget.onChanged(GradeItem(
                  name: widget.gradeItem.name,
                  grade: _grade,
                  comments: _comments));
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            initialValue: widget.gradeItem.comments,
            decoration: const InputDecoration(
                labelText: "Comments",
                contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0)),
            onChanged: (value) {
              setState(() {
                _comments = value;
              });
              widget.onChanged(GradeItem(
                  name: widget.gradeItem.name,
                  grade: _grade,
                  comments: _comments));
            },
          ),
        ),
      ],
    );
  }
}
