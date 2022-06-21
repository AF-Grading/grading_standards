import 'package:flutter/material.dart';

import '../models/grade_enums.dart';
import '../models/grade_sheet.dart';

class EditableDayNightItem extends StatefulWidget {
  const EditableDayNightItem(
      {Key? key, required this.dayNight, required this.onChanged})
      : super(key: key);

  final DayNight dayNight;
  final ValueChanged<DayNight> onChanged;

  @override
  State<EditableDayNightItem> createState() => _EditableDayNightItemState();
}

class _EditableDayNightItemState extends State<EditableDayNightItem> {
  DayNight _dayNight = DayNight.day;

  @override
  void initState() {
    _dayNight = widget.dayNight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // addded wrap for readability
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 150, child: Text("Day/Night:")),
          Flexible(
            flex: 1,
            child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text('Day'),
                  Radio<DayNight>(
                    value: DayNight.day,
                    groupValue: _dayNight,
                    onChanged: (DayNight? value) {
                      setState(() {
                        _dayNight = value!;
                      });
                      widget.onChanged(_dayNight);
                    },
                  ),
                ]),
          ),
          Flexible(
            flex: 1,
            child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text("Night"),
                  Radio<DayNight>(
                    value: DayNight.night,
                    groupValue: _dayNight,
                    onChanged: (DayNight? value) {
                      setState(() {
                        _dayNight = value!;
                      });
                      widget.onChanged(_dayNight);
                    },
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
