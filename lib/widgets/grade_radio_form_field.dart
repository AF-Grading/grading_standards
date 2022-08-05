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
              //if (constraints.maxWidth > 500) {
              return _buildWide(formState, onChanged, context2);
              //} else {
              return _buildNarrow(formState, onChanged);
              //}
              //;
            });
          },
        );
}

Widget _buildWide(FormFieldState<Grade> formState,
    ValueChanged<Grade>? onChanged, BuildContext context) {
  return Wrap(
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
                fillColor: formState.hasError
                    ? MaterialStateProperty.resolveWith<Color>((states) {
                        return Colors.red;
                      })
                    : Theme.of(context).radioTheme.fillColor),
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
                fillColor: formState.hasError
                    ? MaterialStateProperty.resolveWith<Color>((states) {
                        return Colors.red;
                      })
                    : Theme.of(context).radioTheme.fillColor),
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
                fillColor: formState.hasError
                    ? MaterialStateProperty.resolveWith<Color>((states) {
                        return Colors.red;
                      })
                    : Theme.of(context).radioTheme.fillColor),
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
                fillColor: formState.hasError
                    ? MaterialStateProperty.resolveWith<Color>((states) {
                        return Colors.red;
                      })
                    : Theme.of(context).radioTheme.fillColor),
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
                fillColor: formState.hasError
                    ? MaterialStateProperty.resolveWith<Color>((states) {
                        return Colors.red;
                      })
                    : Theme.of(context).radioTheme.fillColor),
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
                fillColor: formState.hasError
                    ? MaterialStateProperty.resolveWith<Color>((states) {
                        return Colors.red;
                      })
                    : Theme.of(context).radioTheme.fillColor),
          ]),
    ],
  );
}

Widget _buildNarrow(
    FormFieldState<Grade> formState, ValueChanged<Grade>? onChanged) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        DropdownButton<Grade>(
          items: const [
            DropdownMenuItem(value: Grade.noGrade, child: Text("NG")),
            DropdownMenuItem(value: Grade.unsatisfactory, child: Text("0")),
            DropdownMenuItem(value: Grade.introductory, child: Text("1")),
            DropdownMenuItem(value: Grade.familiar, child: Text("2")),
            DropdownMenuItem(value: Grade.proficient, child: Text("3")),
            DropdownMenuItem(value: Grade.expert, child: Text("4")),
          ],
          value: formState.value,
          onChanged: (Grade? newValue) {
            formState.didChange(newValue);
            onChanged!(newValue!);
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
