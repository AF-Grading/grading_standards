import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/Squadrons.dart';

class SquadronFormField extends FormField<String> {
  SquadronFormField(
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
              List<Squadron> squads = context.watch<List<Squadron>>();
              return _buildNarrow(formState, onChanged, squads, context);
            });
          },
        );
}

Widget _buildNarrow(
    FormFieldState<String> formState,
    ValueChanged<String>? onChanged,
    List<Squadron> squads,
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
      for (Squadron squad in squads)
        DropdownMenuItem(value: squad.squad, child: Text(squad.squad))
    ],
    value: formState.value,
    onChanged: (String? newValue) {
      formState.didChange(newValue);
      onChanged!(newValue!);
    },
  );
}
