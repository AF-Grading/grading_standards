import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/user_setting.dart';

// TODO SEARCH BY ID NOT NAME
class SearchUsersFormField extends FormField<String> {
  SearchUsersFormField(
      {Key? key,
      required List<UserSetting> users,
      required labelText,
      controller = TextEditingController,
      ValueChanged<String>? onChanged,
      ValueChanged<String>? onSaved,
      FormFieldValidator<String>? validator})
      : super(
          key: key,
          //controller: TextEditingController(),
          // if the user does not select a value, display an error
          validator: validator,
          //onSaved: onSaved,
          builder: (formState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(labelText),
                          ),
                          Flexible(
                            child: TextFormField(
                              initialValue: formState.value,
                              onChanged: (value) => formState.didChange(value),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: formState.value != null
                            ? //Users()
                            users
                                .where((user) => user.email
                                    .toLowerCase()
                                    .contains(formState.value!))
                                .map(
                                  (item) => GestureDetector(
                                      onTap: () => onSaved!(item.email),

                                      //() => formState.didChange(item.name),
                                      child: Text(item.name)),
                                )
                                .toList()
                            : [],
                      )
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
