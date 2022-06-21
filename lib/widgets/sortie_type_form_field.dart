import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

class SortieTypeFormField extends FormField<SortieType> {
  SortieTypeFormField(
      {Key? key,
      ValueChanged<SortieType>? onChanged,
      FormFieldValidator<SortieType>? validator})
      : super(
          key: key,
          // if the user does not select a value, display an error
          validator: validator,
          builder: (formState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("local"),
                      Radio<SortieType>(
                        value: SortieType.local,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("ims"),
                      Radio<SortieType>(
                        value: SortieType.ims,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("mission"),
                      Radio<SortieType>(
                        value: SortieType.mission,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("ost"),
                      Radio<SortieType>(
                        value: SortieType.ost,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("instmtSim"),
                      Radio<SortieType>(
                        value: SortieType.instmtSim,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("tacticsSim"),
                      Radio<SortieType>(
                        value: SortieType.tacticsSim,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("mmp"),
                      Radio<SortieType>(
                        value: SortieType.mmp,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("lfe"),
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
