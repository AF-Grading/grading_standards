import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

class ThemeField extends FormField<ThemeMode> {
  ThemeField(
      {Key? key,
      ThemeMode? initialValue,
      ValueChanged<ThemeMode>? onChanged,
      FormFieldValidator<ThemeMode>? validator})
      : super(
          key: key,
          initialValue: initialValue,
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
                      Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Text("System"),
                            Radio<ThemeMode>(
                              value: ThemeMode.system,
                              groupValue: formState.value,
                              onChanged: (value) {
                                formState.didChange(value);
                                onChanged!(value!);
                              },
                            ),
                          ]),
                      Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Text("Dark"),
                            Radio<ThemeMode>(
                              value: ThemeMode.dark,
                              groupValue: formState.value,
                              onChanged: (value) {
                                formState.didChange(value);
                                onChanged!(value!);
                              },
                            ),
                          ]),
                      Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Text("Light"),
                            Radio<ThemeMode>(
                              value: ThemeMode.light,
                              groupValue: formState.value,
                              onChanged: (value) {
                                formState.didChange(value);
                                onChanged!(value!);
                              },
                            ),
                          ]),
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
