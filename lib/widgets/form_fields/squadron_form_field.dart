import 'package:app_prototype/models/grading_parameter.dart';
import 'package:app_prototype/views/new_grade_sheet_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GradingParametersFormField extends FormField<String> {
  GradingParametersFormField(
      {Key? key,
      String? initialValue,
      ValueChanged<String>? onChanged,
      FormFieldValidator<String>? validator})
      : super(
          key: key,
          // if the user does not select a value, display an error
          initialValue: initialValue,
          validator: validator,
          builder: (formState) {
            return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              List<GradingParameter> params =
                  context.watch<List<GradingParameter>>();
              return _buildNarrow(formState, onChanged, params, context);
            });
          },
        );
}

Widget _buildNarrow(
    FormFieldState<String> formState,
    ValueChanged<String>? onChanged,
    List<GradingParameter> squads,
    BuildContext context) {
  return DropdownButton<String>(
    underline: Container(
        decoration: BoxDecoration(
      border: Border.all(
          width: 0.0,
          color: formState.hasError
              ? Colors.red
              : Theme.of(context).highlightColor),
    )),
    items: [
      for (GradingParameter squad in squads)
        DropdownMenuItem(value: squad.paramName, child: Text(squad.paramName))
    ],
    value: formState.value,
    onChanged: (String? newValue) {
      formState.didChange(newValue);
      onChanged!(newValue!);
    },
  );
}
