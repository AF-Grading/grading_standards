import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

class RankFormField extends FormField<Rank> {
  RankFormField(
      {Key? key,
      Rank? initialValue,
      ValueChanged<Rank>? onChanged,
      FormFieldValidator<Rank>? validator})
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
  FormFieldState<Rank> formState,
  ValueChanged<Rank>? onChanged,
) {
  return Column(
    children: [
      Wrap(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Second Lt."),
          Radio<Rank>(
            value: Rank.secondLt,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
          ),
          const Text("First Lt."),
          Radio<Rank>(
            value: Rank.firstLt,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
          ),
          const Text("Capt."),
          Radio<Rank>(
            value: Rank.capt,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
          ),
          const Text("Maj."),
          Radio<Rank>(
            value: Rank.maj,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
          ),
          const Text("Lt. Col"),
          Radio<Rank>(
            value: Rank.ltCol,
            groupValue: formState.value,
            onChanged: (value) {
              formState.didChange(value);
              onChanged!(value!);
            },
          ),
          const Text("Col."),
          Radio<Rank>(
            value: Rank.colonel,
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
    FormFieldState<Rank> formState, ValueChanged<Rank>? onChanged) {
  return Column(
    children: [
      DropdownButton<Rank>(
        items: const [
          DropdownMenuItem(value: Rank.secondLt, child: Text("Second Lt.")),
          DropdownMenuItem(value: Rank.firstLt, child: Text("First Lt.")),
          DropdownMenuItem(value: Rank.capt, child: Text("Capt.")),
          DropdownMenuItem(value: Rank.maj, child: Text("Major")),
          DropdownMenuItem(value: Rank.ltCol, child: Text("Lt. Col.")),
          DropdownMenuItem(value: Rank.colonel, child: Text("Colonel")),
        ],
        value: formState.value,
        onChanged: (Rank? newValue) {
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
