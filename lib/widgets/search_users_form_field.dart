import 'package:app_prototype/widgets/spaced_item.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/user_setting.dart';

// TODO SEARCH BY ID NOT NAME
class SearchUsersFormField extends FormField<String> {
  SearchUsersFormField(
      {Key? key,
      required String title,
      required List<UserSetting> users,
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpacedItem(
                  name: title,
                  child: TextFormField(
                    initialValue: formState.value,
                    decoration: InputDecoration(
                        hintText: "Name, Squadron, Email, Rank..."),
                    validator: validator,
                    onChanged: (value) => formState.didChange(value),
                  ),
                ),
                Column(
                  children: formState.value != null
                      ? //Users()
                      users
                          .where((user) =>
                              user.email
                                  .toLowerCase()
                                  .contains(formState.value!.toLowerCase()) ||
                              user.name
                                  .toLowerCase()
                                  .contains(formState.value!.toLowerCase()) ||
                              user.rank.pretty!
                                  .toLowerCase()
                                  .contains(formState.value!.toLowerCase()) ||
                              user.squad
                                  .toLowerCase()
                                  .contains(formState.value!.toLowerCase()))
                          .map(
                            (item) => GestureDetector(
                                onTap: () => onSaved!(item.email),

                                //() => formState.didChange(item.name),
                                child:
                                    Text("${item.rank.pretty} ${item.name}")),
                          )
                          .toList()
                      : [],
                )
              ],
            );
          },
        );
}
