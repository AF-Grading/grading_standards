import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

class GradeRadiosFormField extends FormField<Grade> {
  GradeRadiosFormField(
      {Key? key,
      Grade? initialValue,
      ValueChanged<Grade>? onChanged,
      FormFieldValidator<Grade>? validator})
      : super(
          key: key,
          // if the user does not select a value, display an error
          initialValue: initialValue,
          validator: validator,
          builder: (formState) {
            return LayoutBuilder(
                builder: (BuildContext context2, BoxConstraints constraints) {
              if (constraints.maxWidth > 600) {
                return _buildWide(formState, onChanged);
              } else {
                return _buildNarrow(formState, onChanged);
              }
              ;
            });
          },
        );
}

Widget _buildWide(
    FormFieldState<Grade> formState, ValueChanged<Grade>? onChanged) {
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
                  const Text("NG"),
                  Radio<Grade>(
                    value: Grade.noGrade,
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
                  const Text("0"),
                  Radio<Grade>(
                    value: Grade.unsatisfactory,
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
                  const Text("1"),
                  Radio<Grade>(
                    value: Grade.introductory,
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
                  const Text("2"),
                  Radio<Grade>(
                    value: Grade.familiar,
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
                  const Text("3"),
                  Radio<Grade>(
                    value: Grade.proficient,
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
                  const Text("4"),
                  Radio<Grade>(
                    value: Grade.expert,
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
}

Widget _buildNarrow(FormFieldState<Grade> formState, ValueChanged<Grade>? onChanged) {
  // I am not sure why it is not showing up the new one when it's changed
  
  Grade? dropdownValue = Grade.noGrade;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        DropdownButton(
          items: const [
            DropdownMenuItem(child: Text("NG"), value: Grade.noGrade),
            DropdownMenuItem(child: Text("1"), value: Grade.introductory),
            DropdownMenuItem(child: Text("2"), value: Grade.familiar),
            DropdownMenuItem(child: Text("3"), value: Grade.proficient),
            DropdownMenuItem(child: Text("4"), value: Grade.expert),
          ],
          value: dropdownValue,
          onChanged: (Grade? newValue) {
            formState.didChange(newValue);
            onChanged!(newValue!);
            dropdownValue = newValue;
          },
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
