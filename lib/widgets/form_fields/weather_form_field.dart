import 'package:flutter/material.dart';

import '../../models/grade_enums.dart';

class WeatherFormField extends FormField<Weather> {
  WeatherFormField(
      {Key? key,
      Weather? initialValue,
      ValueChanged<Weather>? onChanged,
      FormFieldValidator<Weather>? validator})
      : super(
          key: key,
          // if the user does not select a value, display an error
          initialValue: initialValue,
          validator: validator,
          builder: (formState) {
            return LayoutBuilder(builder: (context, constraints) {
              if (MediaQuery.of(context).size.width > 400) {
                // print("printing out constraints" + (constraints.maxWidth).toString());
                return _buildWide(formState, onChanged, context);
              } else {
                return _buildNarrow(formState, onChanged, context);
              }
            });
          },
        );
}

Widget _buildWide(FormFieldState<Weather> formState,
    ValueChanged<Weather>? onChanged, BuildContext context) {
  return Row(
    children: [
      Row(
        children: [
          SizedBox(
            width: 40,
            child: const Text("VMC"),
          ),
          Radio<Weather>(
              value: Weather.vmc,
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
      ),
      Row(
        children: [
          SizedBox(
            width: 40,
            child: const Text("IMC"),
          ),
          Radio<Weather>(
              value: Weather.imc,
              groupValue: formState.value,
              onChanged: (value) {
                formState.didChange(value);
                onChanged!(value!);
              },
              fillColor: formState.hasError
                  ? MaterialStateProperty.resolveWith<Color>((states) {
                      return Colors.red;
                    })
                  : Theme.of(context).radioTheme.fillColor)
        ],
      )
    ],
  );
}

Widget _buildNarrow(FormFieldState<Weather> formState,
    ValueChanged<Weather>? onChanged, BuildContext context) {
  return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    DropdownButton<Weather>(
      underline: Container(
          decoration: BoxDecoration(
        border: Border.all(
            width: 0.0,
            color: formState.hasError
                ? Colors.red
                : Theme.of(context).highlightColor),
      )),
      items: const [
        DropdownMenuItem(value: Weather.vmc, child: Text("VMC")),
        DropdownMenuItem(value: Weather.imc, child: Text("IMC")),
      ],
      value: formState.value,
      onChanged: (newValue) {
        formState.didChange(newValue);
        onChanged!(newValue!);
      },
    ),
  ]);
}
