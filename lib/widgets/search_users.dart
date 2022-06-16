import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/users.dart';

class SearchUsers extends StatefulWidget {
  const SearchUsers({Key? key, required this.onSelected}) : super(key: key);

  final ValueChanged<List<User>> onSelected;

  @override
  State<SearchUsers> createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers> {
  final List<TextEditingController> _controllers = [TextEditingController()];
  final List<User> _searchResults = [];
  int _editingIndex = 0;
  final List<User> _selectedUsers = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Student Name:"),
            GestureDetector(
              child: const Icon(Icons.search),
              //onTap: ,
            ),
            Row(
              children: _controllers
                  .map((controller) => SizedBox(
                        // TODO change this to something flexible for alternate screen sizes
                        width: 180,
                        child: TextFormField(
                          controller: controller,
                          decoration: const InputDecoration(
                            hintText: 'Enter a name or ID',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _searchResults.clear();
                              _searchResults.addAll(Users().users.where(
                                  (user) =>
                                      user.name.toLowerCase().contains(value)));

                              _editingIndex = _controllers.indexOf(controller);
                              if (value == "") _searchResults.clear();
                            });
                          },
                        ),
                      ))
                  .toList(),
            ),
            // Max out at 4 GradeSheets at a time
            if (_controllers.length < 4)
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controllers.length < 4
                          ? _controllers.add(TextEditingController())
                          : null;
                    });
                  },
                  child: const Text("Add another student...")),
            // Remove uneeded GradeSheets
            if (_controllers.length > 1)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _controllers.removeLast();
                  });
                },
                child: const Icon(Icons.exposure_minus_1),
              ),
          ],
        ),
        //Search Overlay
        if (_searchResults.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: _searchResults
                  .map((user) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _controllers[_editingIndex].text = user.name;
                                // only allows one gradesheet per student at a time for a flight, contains did not work, nor did search by id
                                // TODO fix so that users with the same name (but different people) can be selected
                                _selectedUsers
                                        .where(
                                            (muser) => muser.name == user.name)
                                        .isEmpty
                                    ? _selectedUsers.add(user)
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "You can only select the same student once per flight"),
                                        ),
                                      );

                                widget.onSelected(_selectedUsers);
                                _searchResults.clear();
                              });
                            },
                            child: Text(user.name)),
                      ))
                  .toList(),
            ),
          ),
      ],
    );
  }
}
