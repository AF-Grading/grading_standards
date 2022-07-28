import 'package:flutter/material.dart';

import '../models/Grade.dart';

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
              return _buildWide(formState, onChanged);
              //} else {
              return _buildNarrow(formState, onChanged);
              //}
              //;
            });
          },
        );
}

Widget _buildWide(
    FormFieldState<Grade> formState, ValueChanged<Grade>? onChanged) {
  return Column(
    children: [
      Wrap(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text("NG"),
                Radio<Grade>(
                  value: Grade.NOGRADE,
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
                  value: Grade.UNSATISFACTORY,
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
                  value: Grade.INTRODUCTORY,
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
                  value: Grade.FAMILIAR,
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
                  value: Grade.PROFICIENT,
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
                  value: Grade.EXPERT,
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
            DropdownMenuItem(value: Grade.NOGRADE, child: Text("NG")),
            DropdownMenuItem(value: Grade.UNSATISFACTORY, child: Text("0")),
            DropdownMenuItem(value: Grade.INTRODUCTORY, child: Text("1")),
            DropdownMenuItem(value: Grade.INTRODUCTORY, child: Text("2")),
            DropdownMenuItem(value: Grade.PROFICIENT, child: Text("3")),
            DropdownMenuItem(value: Grade.EXPERT, child: Text("4")),
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
