import 'package:flutter/material.dart';

import '../models/user.dart';

class RankFormField extends FormField<Rank> {
  RankFormField(
      {Key? key,
      Rank? initialValue,
      ValueChanged<Rank>? onChanged,
      FormFieldValidator<Rank>? validator})
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
                      const Text("Second Lt."),
                      Radio<Rank>(
                        value: Rank.secondLt,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("First Lt."),
                      Radio<Rank>(
                        value: Rank.firstLt,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("Capt."),
                      Radio<Rank>(
                        value: Rank.capt,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("Maj."),
                      Radio<Rank>(
                        value: Rank.maj,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("Lt. Col"),
                      Radio<Rank>(
                        value: Rank.ltCol,
                        groupValue: formState.value,
                        onChanged: (value) {
                          formState.didChange(value);
                          onChanged!(value!);
                        },
                      ),
                      const Text("Col."),
                      Radio<Rank>(
                        value: Rank.colonel,
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
