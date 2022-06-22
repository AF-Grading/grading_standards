import 'package:app_prototype/models/current_flight.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../models/users.dart';

class SearchUsers2 extends StatefulWidget {
  const SearchUsers2({Key? key}) : super(key: key);

  @override
  State<SearchUsers2> createState() => _SearchUsers2State();
}

class _SearchUsers2State extends State<SearchUsers2> {
  final List<TextEditingController> _controllers = [TextEditingController()];
  final List<User> _searchResults = [];
  int _editingIndex = 0;

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
              Consumer<CurrentFlight>(builder: (context, currentFlight, child) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controllers.isEmpty ? null : _controllers.removeLast();
                      currentFlight.removeLast();
                    });
                  },
                  child: const Icon(Icons.exposure_minus_1),
                );
              }),
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
                        child: Consumer<CurrentFlight>(
                          builder: (context, currentFlight, child) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _controllers[_editingIndex].text =
                                        user.name;
                                    // only allows one gradesheet per student at a time for a flight, contains did not work, nor did search by id
                                    // TODO fix so that users with the same name (but different people) can be selected

                                    if (currentFlight.ensureUnique(user) ==
                                        -1) {
                                      if (currentFlight.gradeSheets.length <
                                          CurrentFlight.max) {
                                        //currentFlight.add(user);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "Max amount of students reached"),
                                          ),
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "You can only select the same student once per flight"),
                                        ),
                                      );
                                    }
                                    _searchResults.clear();
                                  });
                                },
                                child: Text(user.name));
                          },
                        ),
                      ))
                  .toList(),
            ),
          ),
      ],
    );
  }
}
