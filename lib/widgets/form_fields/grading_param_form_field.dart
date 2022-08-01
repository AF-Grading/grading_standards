import 'package:flutter/material.dart';

import '../../models/grading_param_enum.dart';

//import '../../models/GradingParam.dart';

class GradingParamFormField extends FormField<GradingParam> {
  GradingParamFormField(
      {Key? key,
      GradingParam? initialValue,
      ValueChanged<GradingParam>? onChanged,
      FormFieldValidator<GradingParam>? validator})
      : super(
          key: key,
          // if the user does not select a value, display an error
          initialValue: initialValue,
          validator: validator,
          builder: (formState) {
            return LayoutBuilder(builder: (context, constraints) {
              return DropdownButton<GradingParam>(
                underline: Container(
                    decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.0,
                      color: formState.hasError
                          ? Colors.red
                          : Theme.of(context).highlightColor),
                )),
                items: [
                  DropdownMenuItem(value: GradingParam.all, child: Text("All")),
                  DropdownMenuItem(
                      value: GradingParam.airland, child: Text("Airland")),
                  DropdownMenuItem(
                      value: GradingParam.min, child: Text("Min.")),
                  DropdownMenuItem(
                      value: GradingParam.oneOneOne, child: Text("1-1-1")),
                  DropdownMenuItem(
                      value: GradingParam.enroute,
                      child: Text("Enroute Sortie")),
                  DropdownMenuItem(
                      value: GradingParam.pattern, child: Text("Pattern Only")),
                  DropdownMenuItem(
                      value: GradingParam.tactical, child: Text("Tactical")),
                  DropdownMenuItem(
                      value: GradingParam.tacticalPlus,
                      child: Text("Tactical Plus")),
                  DropdownMenuItem(
                      value: GradingParam.airdrop, child: Text("Airdrop")),
                  DropdownMenuItem(
                      value: GradingParam.airdropPlus,
                      child: Text("Airdrop Plus")),
                ],
                value: formState.value,
                onChanged: (GradingParam? newValue) {
                  formState.didChange(newValue);
                  onChanged!(newValue!);
                },
              );
            });
          },
        );
}
