import 'package:flutter/material.dart';

import '../../models/SortieType.dart';

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
                return _buildNarrow(formState, onChanged, context);
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
            const Text("Sortie Type:"),
            const Text("Local"),
            Radio<SortieType>(
              value: SortieType.LOCAL,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("IMS"),
            Radio<SortieType>(
              value: SortieType.IMS,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("Mission"),
            Radio<SortieType>(
              value: SortieType.MISSION,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("OST"),
            Radio<SortieType>(
              value: SortieType.OST,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("ISS"),
            Radio<SortieType>(
              value: SortieType.INSTMTSIM,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("Tactics Sim"),
            Radio<SortieType>(
              value: SortieType.TACTICSSIM,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("MMP"),
            Radio<SortieType>(
              value: SortieType.MMP,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
            ),
            const Text("JFE"),
            Radio<SortieType>(
              value: SortieType.LFE,
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

Widget _buildNarrow(FormFieldState<SortieType> formState,
    ValueChanged<SortieType>? onChanged, BuildContext context) {
  return Column(
    children: [
      DropdownButton(
          underline: Container(
              decoration: BoxDecoration(
            border: Border.all(
                width: 0.0,
                color: formState.hasError
                    ? Colors.red
                    : Theme.of(context).highlightColor),
          )),
          items: const [
            DropdownMenuItem(value: SortieType.LOCAL, child: Text("Local")),
            DropdownMenuItem(value: SortieType.IMS, child: Text("IMS")),
            DropdownMenuItem(value: SortieType.MISSION, child: Text("Mission")),
            DropdownMenuItem(value: SortieType.OST, child: Text("OST")),
            DropdownMenuItem(value: SortieType.INSTMTSIM, child: Text("ISS")),
            DropdownMenuItem(
                value: SortieType.TACTICSSIM, child: Text("Tactics Sim")),
            DropdownMenuItem(value: SortieType.MMP, child: Text("MMP")),
            DropdownMenuItem(value: SortieType.LFE, child: Text("JFE")),
          ],
          value: formState.value,
          onChanged: (SortieType? newValue) {
            formState.didChange(newValue);
            onChanged!(newValue!);
          }),
    ],
  );
}
