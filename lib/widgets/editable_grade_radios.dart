import 'package:flutter/material.dart';

import '../models/grade.dart';

class EditableGradeRadios extends StatefulWidget {
  const EditableGradeRadios(
      {Key? key,
      required this.name,
      required this.grade,
      required this.onChanged})
      : super(key: key);

  final String name;
  final Grade grade;
  final ValueChanged<Grade> onChanged;

  @override
  State<EditableGradeRadios> createState() => _EditableGradeRadiosState();
}

class _EditableGradeRadiosState extends State<EditableGradeRadios> {
  Grade _grade = Grade.noGrade;

  @override
  void initState() {
    _grade = widget.grade;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 150, child: Text(widget.name)),
          ListTile(
            title: const Text('NG'),
            leading: Radio<Grade>(
              value: Grade.noGrade,
              groupValue: _grade,
              onChanged: (Grade? value) {
                setState(() {
                  _grade = value!;
                });
                widget.onChanged(_grade);
              },
            ),
          ),
          ListTile(
            title: const Text('0'),
            leading: Radio<Grade>(
              value: Grade.unsatisfactory,
              groupValue: _grade,
              onChanged: (Grade? value) {
                setState(() {
                  _grade = value!;
                });
                widget.onChanged(_grade);
              },
            ),
          ),
          ListTile(
            title: const Text('1'),
            leading: Radio<Grade>(
              value: Grade.introductory,
              groupValue: _grade,
              onChanged: (Grade? value) {
                setState(() {
                  _grade = value!;
                });
                widget.onChanged(_grade);
              },
            ),
          ),
          ListTile(
            title: const Text('2'),
            leading: Radio<Grade>(
              value: Grade.familiar,
              groupValue: _grade,
              onChanged: (Grade? value) {
                setState(() {
                  _grade = value!;
                });
                widget.onChanged(_grade);
              },
            ),
          ),
          ListTile(
            title: const Text('3'),
            leading: Radio<Grade>(
              value: Grade.proficient,
              groupValue: _grade,
              onChanged: (Grade? value) {
                setState(() {
                  _grade = value!;
                });
                widget.onChanged(_grade);
              },
            ),
          ),
          ListTile(
            title: const Text('4'),
            dense: true,
            leading: Radio<Grade>(
              value: Grade.expert,
              groupValue: _grade,
              onChanged: (Grade? value) {
                setState(() {
                  _grade = value!;
                });
                widget.onChanged(_grade);
              },
            ),
          ),
        ],
      ),
    );
  }
}
