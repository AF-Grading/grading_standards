import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

class PilotQualFormField extends FormField<PilotQual> {
  PilotQualFormField(
      {Key? key,
      PilotQual? initialValue,
      ValueChanged<PilotQual>? onChanged,
      FormFieldValidator<PilotQual>? validator})
      : super(
          key: key,
          // if the user does not select a value, display an error
          initialValue: initialValue,
          validator: validator,
          builder: (formState) {
            return LayoutBuilder(
                builder: (BuildContext context2, BoxConstraints constraints) {
              if (constraints.minWidth > 400) {
                return _buildWide(formState, onChanged);
              } else {
                return _buildNarrow(formState, onChanged);
              }
            });
          },
        );
}

Widget _buildWide(
  FormFieldState<PilotQual> formState,
  ValueChanged<PilotQual>? onChanged,
) {
  return Column(
    children: [
      Wrap(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("FPC"),
          Radio<PilotQual>(
            value: PilotQual.fpc,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
          ),
          const Text("FPQ"),
          Radio<PilotQual>(
            value: PilotQual.fpq,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
          ),
          const Text("MP"),
          Radio<PilotQual>(
            value: PilotQual.mp,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
          ),
          const Text("IP"),
          Radio<PilotQual>(
            value: PilotQual.ip,
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
  );
}

Widget _buildNarrow(
    FormFieldState<PilotQual> formState, ValueChanged<PilotQual>? onChanged) {
  return Column(
    children: [
      DropdownButton<PilotQual>(
        items: const [
          DropdownMenuItem(value: PilotQual.fpq, child: Text("FPQ")),
          DropdownMenuItem(value: PilotQual.fpc, child: Text("FPC")),
          DropdownMenuItem(value: PilotQual.mp, child: Text("MP")),
          DropdownMenuItem(value: PilotQual.ip, child: Text("IP")),
        ],
        value: formState.value,
        onChanged: (PilotQual? newValue) {
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
  );
}
