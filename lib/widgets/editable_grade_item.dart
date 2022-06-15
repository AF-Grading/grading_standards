import 'package:flutter/material.dart';

import '../models/grade.dart';
import '../models/grade_sheet.dart';

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: 150, child: Text(widget.gradeItem.name)),
              Flexible(
                flex: 1,
                //width: context.size. * .2,
                child: ListTile(
                  title: const Text('NG'),
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
                  title: const Text('0'),
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
                  title: const Text('1'),
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
                  title: const Text('2'),
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
                  title: const Text('3'),
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
                  title: const Text('4'),
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            initialValue: widget.gradeItem.comments,
            decoration: const InputDecoration(
              labelText: "Comments",
            ),
            onSaved: (value) => widget.gradeItem.comments = value!,
          ),
        ),
      ],
    );
  }
}
