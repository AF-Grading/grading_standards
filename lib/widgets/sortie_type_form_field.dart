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
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Sortie Type:"),
            DropdownButton(
                items: const [
                  DropdownMenuItem(
                      value: SortieType.local, child: Text("local")),
                  DropdownMenuItem(value: SortieType.ims, child: Text("ims")),
                  DropdownMenuItem(
                      value: SortieType.mission, child: Text("mission")),
                  DropdownMenuItem(value: SortieType.ost, child: Text("ost")),
                  DropdownMenuItem(
                      value: SortieType.instmtSim, child: Text("instmtSim")),
                  DropdownMenuItem(
                      value: SortieType.tacticsSim, child: Text("tacticsSim")),
                  DropdownMenuItem(value: SortieType.mmp, child: Text("mmp")),
                  DropdownMenuItem(value: SortieType.lfe, child: Text("lfe")),
                ],
                value: formState.value,
                onChanged: (SortieType? newValue) {
                  formState.didChange(newValue);
                  onChanged!(newValue!);
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
