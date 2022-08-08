import 'package:app_prototype/widgets/misc/radio_spacing.dart';
import 'package:flutter/material.dart';

import '../../models/grade_enums.dart';

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
              if (MediaQuery.of(context).size.width > 900) {
                return _buildWide(formState, onChanged, context);
              } else {
                return _buildNarrow(formState, onChanged, context);
              }
            }));
          },
        );
}

Widget _buildWide(FormFieldState<SortieType> formState,
    ValueChanged<SortieType>? onChanged, BuildContext context) {
  return Row(
    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        width: 40,
        child: const Text("Local"),
      ),
      Radio<SortieType>(
          value: SortieType.local,
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
      SizedBox(
        width: 40,
        child: const Text("IMS"),
      ),
      Radio<SortieType>(
          value: SortieType.ims,
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
      RadioSpacing("Mission"),
      Radio<SortieType>(
          value: SortieType.mission,
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
      SizedBox(
        width: 40,
        child: const Text("OST"),
      ),
      Radio<SortieType>(
          value: SortieType.ost,
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
      SizedBox(
        width: 40,
        child: const Text("ISS"),
      ),
      Radio<SortieType>(
          value: SortieType.instmtSim,
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
      RadioSpacing("Tactics Sim"),
      Radio<SortieType>(
          value: SortieType.tacticsSim,
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
      SizedBox(
        width: 40,
        child: const Text("MMP"),
      ),
      Radio<SortieType>(
          value: SortieType.mmp,
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
      SizedBox(
        width: 40,
        child: const Text("JFE"),
      ),
      Radio<SortieType>(
          value: SortieType.lfe,
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
    ],
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
            DropdownMenuItem(value: SortieType.local, child: Text("Local")),
            DropdownMenuItem(value: SortieType.ims, child: Text("IMS")),
            DropdownMenuItem(value: SortieType.mission, child: Text("Mission")),
            DropdownMenuItem(value: SortieType.ost, child: Text("OST")),
            DropdownMenuItem(value: SortieType.instmtSim, child: Text("ISS")),
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
  );
}
