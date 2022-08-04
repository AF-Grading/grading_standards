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
              if (MediaQuery.of(context).size.width > 1200) {
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
  return Row(
    children: [
      Wrap(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                const Text("Local"),
                Radio<SortieType>(
                  value: SortieType.local,
                  groupValue: formState.value,
                  onChanged: (value) {
                    formState.didChange(value);
                    onChanged!(value!);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                const Text("IMS"),
                Radio<SortieType>(
                  value: SortieType.ims,
                  groupValue: formState.value,
                  onChanged: (value) {
                    formState.didChange(value);
                    onChanged!(value!);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                const Text("Mission"),
                Radio<SortieType>(
                  value: SortieType.mission,
                  groupValue: formState.value,
                  onChanged: (value) {
                    formState.didChange(value);
                    onChanged!(value!);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                const Text("OST"),
                Radio<SortieType>(
                  value: SortieType.ost,
                  groupValue: formState.value,
                  onChanged: (value) {
                    formState.didChange(value);
                    onChanged!(value!);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                const Text("ISS"),
                Radio<SortieType>(
                  value: SortieType.instmtSim,
                  groupValue: formState.value,
                  onChanged: (value) {
                    formState.didChange(value);
                    onChanged!(value!);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                const Text("Tactics Sim"),
                Radio<SortieType>(
                  value: SortieType.tacticsSim,
                  groupValue: formState.value,
                  onChanged: (value) {
                    formState.didChange(value);
                    onChanged!(value!);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                const Text("MMP"),
                Radio<SortieType>(
                  value: SortieType.mmp,
                  groupValue: formState.value,
                  onChanged: (value) {
                    formState.didChange(value);
                    onChanged!(value!);
                  },
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Text("JFE"),
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
    FormFieldState<SortieType> formState, ValueChanged<SortieType>? onChanged) {
  return Column(
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownButton(
              items: const [
                DropdownMenuItem(value: SortieType.local, child: Text("Local")),
                DropdownMenuItem(value: SortieType.ims, child: Text("IMS")),
                DropdownMenuItem(
                    value: SortieType.mission, child: Text("Mission")),
                DropdownMenuItem(value: SortieType.ost, child: Text("OST")),
                DropdownMenuItem(
                    value: SortieType.instmtSim, child: Text("ISS")),
                DropdownMenuItem(
                    value: SortieType.tacticsSim, child: Text("Tactics Sim")),
                DropdownMenuItem(value: SortieType.mmp, child: Text("MMP")),
                DropdownMenuItem(value: SortieType.lfe, child: Text("JFE")),
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
  );
}
