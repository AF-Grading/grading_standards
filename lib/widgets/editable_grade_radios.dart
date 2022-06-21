import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

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
      child: ListTile(
        // edited layout looks so it's easier to identity which text aligns with
        // which button
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(child: const Text("Overall Grade:")),
          Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SizedBox(child: const Text('NG')),
                Radio<Grade>(
                  value: Grade.noGrade,
                  groupValue: _grade,
                  onChanged: (Grade? value) {
                    setState(() {
                      _grade = value!;
                    });
                    widget.onChanged(_grade);
                  },
                ),
              ]),
          Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text('0'),
                Radio<Grade>(
                  value: Grade.unsatisfactory,
                  groupValue: _grade,
                  onChanged: (Grade? value) {
                    setState(() {
                      _grade = value!;
                    });
                    widget.onChanged(_grade);
                  },
                ),
              ]),
          Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text('1'),
                Radio<Grade>(
                  value: Grade.introductory,
                  groupValue: _grade,
                  onChanged: (Grade? value) {
                    setState(() {
                      _grade = value!;
                    });
                    widget.onChanged(_grade);
                  },
                ),
              ]),
          Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text('2'),
                Radio<Grade>(
                  value: Grade.familiar,
                  groupValue: _grade,
                  onChanged: (Grade? value) {
                    setState(() {
                      _grade = value!;
                    });
                    widget.onChanged(_grade);
                  },
                ),
              ]),
          Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text('3'),
                Radio<Grade>(
                  value: Grade.proficient,
                  groupValue: _grade,
                  onChanged: (Grade? value) {
                    setState(() {
                      _grade = value!;
                    });
                    widget.onChanged(_grade);
                  },
                ),
              ]),
          Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text('4'),
                Radio<Grade>(
                  value: Grade.expert,
                  groupValue: _grade,
                  onChanged: (Grade? value) {
                    setState(() {
                      _grade = value!;
                    });
                    widget.onChanged(_grade);
                  },
                ),
              ]),
        ]),
      ),
    );
  }
}
