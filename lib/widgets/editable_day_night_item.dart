import 'package:flutter/material.dart';

import '../models/grade_sheet.dart';

class EditableDayNightItem extends StatefulWidget {
  const EditableDayNightItem(
      {Key? key, required this.gradeSheet, required this.onChanged})
      : super(key: key);

  final GradeSheet gradeSheet;
  final ValueChanged<DayNight> onChanged;

  @override
  State<EditableDayNightItem> createState() => _EditableDayNightItemState();
}

class _EditableDayNightItemState extends State<EditableDayNightItem> {
  DayNight _dayNight = DayNight.day;

  @override
  void initState() {
    _dayNight = widget.gradeSheet.dayNight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const SizedBox(width: 150, child: Text("Day/Night:")),
          Flexible(
            flex: 1,
            //width: context.size. * .2,
            child: ListTile(
              title: const Text('Day'),
              leading: Radio<DayNight>(
                value: DayNight.day,
                groupValue: _dayNight,
                onChanged: (DayNight? value) {
                  setState(() {
                    _dayNight = value!;
                  });
                  widget.onChanged(_dayNight);
                },
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: ListTile(
              title: const Text('Night'),
              leading: Radio<DayNight>(
                value: DayNight.night,
                groupValue: _dayNight,
                onChanged: (DayNight? value) {
                  setState(() {
                    _dayNight = value!;
                  });
                  widget.onChanged(_dayNight);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
