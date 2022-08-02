import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker(
      {Key? key, this.restorationId, this.date, required this.onChanged})
      : super(key: key);

  final String? restorationId;
  final DateTime? date;
  final ValueChanged<DateTime> onChanged;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  late DateTime _date;
  bool _startNull = true;

  @override
  void initState() {
    widget.date != null ? _date = widget.date! : _date = DateTime.now();
    widget.date != null ? _startNull = false : _startNull = true;
    super.initState();
  }

  @override
  String? get restorationId => widget.restorationId;

  late final RestorableDateTime _selectedDate = RestorableDateTime(_date);

  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(0),
          lastDate: DateTime(2100),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        _date = newSelectedDate;
        _startNull = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.month}/${_selectedDate.value.day}/${_selectedDate.value.year}'),
        ));
      });
      widget.onChanged(_date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _startNull
            ? const Text("N/a")
            : Text('Date: ${_date.month}/${_date.day}/${_date.year}'),
        OutlinedButton(
          onPressed: () {
            _restorableDatePickerRouteFuture.present();
          },
          child: const Text('Open Date Picker'),
        ),
      ],
    );
  }
}
