import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

class AdQualFormField extends FormField<AdQual> {
  AdQualFormField(
      {Key? key,
      AdQual? initialValue,
      ValueChanged<AdQual>? onChanged,
      FormFieldValidator<AdQual>? validator})
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
                      const Text("none"),
                      Radio<AdQual>(
                        value: AdQual.none,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("ldad"),
                      Radio<AdQual>(
                        value: AdQual.ldad,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("adid"),
                      Radio<AdQual>(
                        value: AdQual.adid,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("acad"),
                      Radio<AdQual>(
                        value: AdQual.acad,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("cpad"),
                      Radio<AdQual>(
                        value: AdQual.cpad,
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
