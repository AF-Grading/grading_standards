import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

class AdQualFormField extends FormField<AdQual> {
  AdQualFormField(
      {Key? key,
      AdQual? initialValue,
      ValueChanged<AdQual>? onChanged,
      FormFieldValidator<AdQual>? validator})
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
  FormFieldState<AdQual> formState,
  ValueChanged<AdQual>? onChanged,
) {
  return Column(
    children: [
      Wrap(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("None"),
          Radio<AdQual>(
            value: AdQual.none,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
          ),
          const Text("LDAD"),
          Radio<AdQual>(
            value: AdQual.ldad,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
          ),
          const Text("ADIP"),
          Radio<AdQual>(
            value: AdQual.adip,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
          ),
          const Text("ACAD"),
          Radio<AdQual>(
            value: AdQual.acad,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
          ),
          const Text("CPAD"),
          Radio<AdQual>(
            value: AdQual.cpad,
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
    FormFieldState<AdQual> formState, ValueChanged<AdQual>? onChanged) {
  return Column(
    children: [
      DropdownButton<AdQual>(
        items: const [
          DropdownMenuItem(value: AdQual.none, child: Text("None")),
          DropdownMenuItem(value: AdQual.ldad, child: Text("LDAD")),
          DropdownMenuItem(value: AdQual.acad, child: Text("ACAD")),
          DropdownMenuItem(value: AdQual.adip, child: Text("ADIP")),
          DropdownMenuItem(value: AdQual.cpad, child: Text("CPAD")),
        ],
        value: formState.value,
        onChanged: (AdQual? newValue) {
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
