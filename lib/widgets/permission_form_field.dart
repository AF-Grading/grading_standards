import 'package:flutter/material.dart';

import '../models/user.dart';

class PermissionFormField extends FormField<Permission> {
  PermissionFormField(
      {Key? key,
      Permission? userPermission,
      Permission? initialValue,
      ValueChanged<Permission>? onChanged,
      FormFieldValidator<Permission>? validator})
      : super(
          key: key,
          // if the user does not select a value, display an error
          initialValue: initialValue,
          validator: validator,
          builder: (formState) {
            return LayoutBuilder(
                builder: (BuildContext context2, BoxConstraints constraints) {
              if (constraints.minWidth > 400) {
                return _buildWide(formState, onChanged, userPermission!);
              } else {
                return _buildNarrow(formState, onChanged, userPermission!);
              }
            });
          },
        );
}

Widget _buildWide(FormFieldState<Permission> formState,
    ValueChanged<Permission>? onChanged, Permission userPermission) {
  return Column(
    children: [
      Wrap(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Student"),
          Radio<Permission>(
            value: Permission.student,
            groupValue: formState.value,
            onChanged: (value) {
              if (userPermission.index >= value!.index) {
                formState.didChange(value);
                onChanged!(value);
              }
            },
          ),
          const Text("Instructor"),
          Radio<Permission>(
            value: Permission.instructor,
            groupValue: formState.value,
            onChanged: (value) {
              if (userPermission.index >= value!.index) {
                formState.didChange(value);
                onChanged!(value);
              }
            },
          ),
          const Text("Training Shop"),
          Radio<Permission>(
            value: Permission.training_shop,
            groupValue: formState.value,
            onChanged: (value) {
              if (userPermission.index >= value!.index) {
                formState.didChange(value);
                onChanged!(value);
              }
            },
          ),
          const Text("Wing Training"),
          Radio<Permission>(
            value: Permission.wing_training,
            groupValue: formState.value,
            onChanged: (value) {
              if (userPermission.index >= value!.index) {
                formState.didChange(value);
                onChanged!(value);
              }
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
  );
}

Widget _buildNarrow(FormFieldState<Permission> formState,
    ValueChanged<Permission>? onChanged, Permission userPermission) {
  return Column(
    children: [
      DropdownButton<Permission>(
        items: const [
          DropdownMenuItem(value: Permission.student, child: Text("Student")),
          DropdownMenuItem(
              value: Permission.instructor, child: Text("Instructor")),
          DropdownMenuItem(
              value: Permission.training_shop, child: Text("Training Shop")),
          DropdownMenuItem(
              value: Permission.wing_training, child: Text("Wing Training")),
        ],
        value: formState.value,
        onChanged: (Permission? newValue) {
          if (userPermission.index >= newValue!.index) {
            formState.didChange(newValue);
            onChanged!(newValue);
          }
        },
      ),
      formState.hasError
          ? Text(
              formState.errorText!,
              style: const TextStyle(color: Colors.red),
            )
          : Container()
    ],
  );
}
