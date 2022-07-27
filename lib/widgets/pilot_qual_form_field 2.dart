import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

class PilotQualFormField extends FormField<PilotQual> {
  PilotQualFormField(
      {Key? key,
      PilotQual? initialValue,
      ValueChanged<PilotQual>? onChanged,
      FormFieldValidator<PilotQual>? validator})
      : super(
          key: key,
          // if the user does not select a value, display an error
          initialValue: initialValue,
          validator: validator,
          builder: (formState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Wrap(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("fpq"),
                      Radio<PilotQual>(
                        value: PilotQual.fpq,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("fpc"),
                      Radio<PilotQual>(
                        value: PilotQual.fpc,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("mp"),
                      Radio<PilotQual>(
                        value: PilotQual.mp,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("ip"),
                      Radio<PilotQual>(
                        value: PilotQual.ip,
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
          },
        );
}
