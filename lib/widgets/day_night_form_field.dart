import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

class DayNightFormField extends FormField<DayNight> {
  DayNightFormField(
      {Key? key,
      ValueChanged<DayNight>? onChanged,
      FormFieldValidator<DayNight>? validator})
      : super(
          key: key,
          // if the user does not select a value, display an error
          validator: validator,
          builder: (formState) {
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
          },
        );
}
