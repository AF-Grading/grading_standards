import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

class GradeRadiosFormField extends FormField<Grade> {
  GradeRadiosFormField(
      {Key? key,
      ValueChanged<Grade>? onChanged,
      FormFieldValidator<Grade>? validator})
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
                      const Text("NG"),
                      Radio<Grade>(
                        value: Grade.noGrade,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("0"),
                      Radio<Grade>(
                        value: Grade.unsatisfactory,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("1"),
                      Radio<Grade>(
                        value: Grade.introductory,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("2"),
                      Radio<Grade>(
                        value: Grade.familiar,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("3"),
                      Radio<Grade>(
                        value: Grade.proficient,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("4"),
                      Radio<Grade>(
                        value: Grade.expert,
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
