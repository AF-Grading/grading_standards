import 'package:app_prototype/models/grade_sheet.dart';
import 'package:flutter/material.dart';

import '../models/cts_list.dart';

class EditableGradeItem extends StatefulWidget {
  const EditableGradeItem({Key? key, required this.gradeItem})
      : super(key: key);

  final GradeItem gradeItem;

  @override
  State<EditableGradeItem> createState() => _EditableGradeItemState();
}

class _EditableGradeItemState extends State<EditableGradeItem> {
  Grade _overall = Grade.noGrade;

  @override
  void initState() {
    _overall = widget.gradeItem.grade;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(widget.gradeItem.name),
            Flexible(
              flex: 1,
              //width: context.size. * .2,
              child: ListTile(
                title: const Text('No Grade'),
                leading: Radio<Grade>(
                  value: Grade.noGrade,
                  groupValue: _overall,
                  onChanged: (Grade? value) {
                    setState(() {
                      _overall = value!;
                    });
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ListTile(
                title: const Text('Unsatisfactory'),
                leading: Radio<Grade>(
                  value: Grade.unsatisfactory,
                  groupValue: _overall,
                  onChanged: (Grade? value) {
                    setState(() {
                      _overall = value!;
                    });
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ListTile(
                title: const Text('Introductory'),
                leading: Radio<Grade>(
                  value: Grade.introductory,
                  groupValue: _overall,
                  onChanged: (Grade? value) {
                    setState(() {
                      _overall = value!;
                    });
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ListTile(
                title: const Text('Familiar'),
                leading: Radio<Grade>(
                  value: Grade.familiar,
                  groupValue: _overall,
                  onChanged: (Grade? value) {
                    setState(() {
                      _overall = value!;
                    });
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ListTile(
                title: const Text('Proficient'),
                leading: Radio<Grade>(
                  value: Grade.proficient,
                  groupValue: _overall,
                  onChanged: (Grade? value) {
                    setState(() {
                      _overall = value!;
                    });
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: ListTile(
                title: const Text('Expert'),
                dense: true,
                leading: Radio<Grade>(
                  value: Grade.expert,
                  groupValue: _overall,
                  onChanged: (Grade? value) {
                    setState(() {
                      _overall = value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        TextFormField(
          initialValue: widget.gradeItem.comments,
          decoration: const InputDecoration(
            labelText: "Comments",
          ),
          onSaved: (value) => widget.gradeItem.comments = value!,
        ),
      ],
    );
  }
}
