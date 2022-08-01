import 'package:flutter/material.dart';

import '../../models/Weather.dart';

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
              if (MediaQuery.of(context).size.width > 300) {
                // print("printing out constraints" + (constraints.maxWidth).toString());
                return _buildWide(formState, onChanged, context);
              } else {
                return _buildNarrow(formState, onChanged);
              }
            });
          },
        );
}

Widget _buildWide(FormFieldState<Weather> formState,
    ValueChanged<Weather>? onChanged, BuildContext context) {
  return Column(
    children: [
      Row(
        children: [
          Row(
            children: [
              SizedBox(
                width: 40,
                child: const Text("VMC"),
              ),
              Radio<Weather>(
                  value: Weather.VMC,
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
                value: Weather.IMC,
                groupValue: formState.value,
                onChanged: (value) {
                  formState.didChange(value);
                  onChanged!(value!);
                },
                fillColor: formState.hasError
                    ? MaterialStateProperty.resolveWith<Color>((states) {
                        return Colors.red;
                      })
                    : Theme.of(context).radioTheme.fillColor,
              ),
            ],
          )
        ],
      ),
    ],
  );
}

Widget _buildNarrow(
    FormFieldState<Weather> formState, ValueChanged<Weather>? onChanged) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text("Weather:"),
          DropdownButton<Weather>(
            items: const [
              DropdownMenuItem(value: Weather.VMC, child: Text("VMC")),
              DropdownMenuItem(value: Weather.IMC, child: Text("IMC")),
            ],
            value: formState.value,
            onChanged: (newValue) {
              formState.didChange(newValue);
              onChanged!(newValue!);
            },
          ),
        ]),
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
