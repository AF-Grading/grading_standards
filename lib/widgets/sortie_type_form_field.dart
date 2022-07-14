import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

class SortieTypeFormField extends FormField<SortieType> {
  SortieTypeFormField(
      {Key? key,
      SortieType? initialValue,
      ValueChanged<SortieType>? onChanged,
      FormFieldValidator<SortieType>? validator})
      : super(
          key: key,
          initialValue: initialValue,
          // if the user does not select a value, display an error
          validator: validator,
          builder: (formState) {
            return LayoutBuilder(builder: ((context, constraints) {
              if (MediaQuery.of(context).size.width > 600) {
                return _buildWide(formState, onChanged);
              } else {
                return _buildNarrow(formState, onChanged);
              }
            }));
          },
        );
}

Widget _buildWide(
    FormFieldState<SortieType> formState, ValueChanged<SortieType>? onChanged) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Wrap(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Sortie Type: "),
            const Text("local"),
            Radio<SortieType>(
              value: SortieType.local,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("ims"),
            Radio<SortieType>(
              value: SortieType.ims,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("mission"),
            Radio<SortieType>(
              value: SortieType.mission,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("ost"),
            Radio<SortieType>(
              value: SortieType.ost,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("instmtSim"),
            Radio<SortieType>(
              value: SortieType.instmtSim,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("tacticsSim"),
            Radio<SortieType>(
              value: SortieType.tacticsSim,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("mmp"),
            Radio<SortieType>(
              value: SortieType.mmp,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("lfe"),
            Radio<SortieType>(
              value: SortieType.lfe,
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
}

Widget _buildNarrow(
    FormFieldState<SortieType> formState, ValueChanged<SortieType>? onChanged) {
  SortieType dropdownValue = SortieType.noSelection;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sorties Type:"),
            DropdownButton(
                items: [
                  DropdownMenuItem(
                      child: Text(""), value: SortieType.noSelection),
                  DropdownMenuItem(
                      child: Text("local"), value: SortieType.local),
                  DropdownMenuItem(child: Text("ims"), value: SortieType.ims),
                  DropdownMenuItem(
                      child: Text("mission"), value: SortieType.mission),
                  DropdownMenuItem(child: Text("ost"), value: SortieType.ost),
                  DropdownMenuItem(
                      child: Text("instmtSim"), value: SortieType.instmtSim),
                  DropdownMenuItem(
                      child: Text("tacticsSim"), value: SortieType.tacticsSim),
                  DropdownMenuItem(child: Text("mmp"), value: SortieType.mmp),
                  DropdownMenuItem(child: Text("lfe"), value: SortieType.lfe),
                ],
                value: dropdownValue,
                onChanged: (SortieType? newValue) {
                  formState.didChange(newValue);
                  onChanged!(newValue!);
                  dropdownValue = newValue;
                }),
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
