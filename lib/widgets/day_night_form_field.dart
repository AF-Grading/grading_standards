import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

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
                if (MediaQuery.of(context).size.width > 600) {
                  return _buildWide(formState, onChanged);
                } else {
                  return _buildNarrow(formState, onChanged);
                }
              });
            });
}

Widget _buildWide(
    FormFieldState<DayNight> formState, ValueChanged<DayNight>? onChanged) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Day"),
            Radio<DayNight>(
              value: DayNight.day,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("Night"),
            Radio<DayNight>(
              value: DayNight.night,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
          ],
        ),
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

Widget _buildNarrow(
    FormFieldState<DayNight> formState, ValueChanged<DayNight>? onChanged) {
  DayNight dropdownValue = DayNight.noSelection;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Text("Time of Day: "),
          DropdownButton(
            items: [
                DropdownMenuItem(
                  value: DayNight.noSelection,
                  child: Text(""),
                ),
              DropdownMenuItem(
                value: DayNight.day,
                child: Text("Day"),
              ),
              DropdownMenuItem(
                value: DayNight.night,
                child: Text("Night"),
              ),
            ],
            value: dropdownValue,
            onChanged: (DayNight? newValue) {
              formState.didChange(newValue);
              onChanged!(newValue!);
              dropdownValue = newValue;
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
