import 'package:flutter/material.dart';

import '../../models/DayNight.dart';

class DayNightFormField extends FormField<DayNight> {
  DayNightFormField(
      {Key? key,
      DayNight? initialValue,
      ValueChanged<DayNight>? onChanged,
      FormFieldValidator<DayNight>? validator})
      : super(
            key: key,
            // if the user does not select a value, display an error
            initialValue: initialValue,
            validator: validator,
            builder: (formState) {
              return LayoutBuilder(builder: (context, constraints) {
                if (MediaQuery.of(context).size.width > 300) {
                  return _buildWide(formState, onChanged, context);
                } else {
                  return _buildNarrow(formState, onChanged);
                }
              });
            });
}

Widget _buildWide(FormFieldState<DayNight> formState,
    ValueChanged<DayNight>? onChanged, BuildContext context) {
  return Row(
    children: [
      Row(
        children: [
          SizedBox(
            width: 40,
            child: const Text("Day"),
          ),
          Radio<DayNight>(
            value: DayNight.DAY,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
            fillColor: formState.hasError
                ? MaterialStateProperty.resolveWith<Color>((states) {
                    return Colors.red;
                  })
                : Theme.of(context).radioTheme.fillColor,
          ),
        ],
      ),
      Row(
        children: [
          SizedBox(width: 40, child: const Text("Night")),
          Radio<DayNight>(
            value: DayNight.NIGHT,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
            fillColor: formState.hasError
                ? MaterialStateProperty.resolveWith<Color>((states) {
                    return Colors.red;
                  })
                : Theme.of(context).radioTheme.fillColor,
          ),
        ],
      )
    ],
  );
}

Widget _buildNarrow(
    FormFieldState<DayNight> formState, ValueChanged<DayNight>? onChanged) {
  //DayNight dropdownValue = DayNight.noSelection;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Text("Time of Day: "),
          DropdownButton<DayNight>(
            value: formState.value,
            items: const [
              DropdownMenuItem(
                value: DayNight.DAY,
                child: Text("Day"),
              ),
              DropdownMenuItem(
                value: DayNight.NIGHT,
                child: Text("Night"),
              ),
            ],
            onChanged: (DayNight? newValue) {
              formState.didChange(newValue);
              onChanged!(newValue!);
              //dropdownValue = newValue;
            },
          ),
        ]),
        formState.hasError
            ? Text(
                formState.errorText!,
                style: const TextStyle(color: Colors.red),
              )
            : Container()
      ],
    ),
  );
}
