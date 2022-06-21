import 'package:flutter/material.dart';

import '../models/users.dart';

class SearchUsersFormField extends FormField<String> {
  SearchUsersFormField(
      {Key? key,
      //List<User> users,
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
                      TextFormField(
                        //controller: _controller.text,
                        decoration: const InputDecoration(
                          labelText: "Student Name",
                        ),
                        initialValue: formState.value,
                        validator: validator,
                        onChanged: (value) => formState.didChange(value),
                      ),
                      Column(
                        children: formState.value != null
                            ? Users()
                                .users
                                .where((user) => user.name
                                    .toLowerCase()
                                    .contains(formState.value!))
                                .map(
                                  (item) => GestureDetector(
                                      onTap: () => onSaved!(item.name),

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
