import 'package:flutter/material.dart';

import '../models/grade_enums.dart';
import '../models/user.dart';

class PermissionFormField extends FormField<Permission> {
  PermissionFormField(
      {Key? key,
      Permission? initialValue,
      ValueChanged<Permission>? onChanged,
      FormFieldValidator<Permission>? validator})
      : super(
          key: key,
          // if the user does not select a value, display an error
          initialValue: initialValue,
          validator: validator,
          builder: (formState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Wrap(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Student"),
                      Radio<Permission>(
                        value: Permission.student,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("Instructor"),
                      Radio<Permission>(
                        value: Permission.instructor,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("Training Shop"),
                      Radio<Permission>(
                        value: Permission.training_shop,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("Wing Training"),
                      Radio<Permission>(
                        value: Permission.wing_training,
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
