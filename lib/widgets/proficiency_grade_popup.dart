import 'package:flutter/material.dart';

import '../models/cts_list.dart';

class ProficencyGradePopup extends StatelessWidget {
  const ProficencyGradePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Proficiency Grade and Description"),
            content: SingleChildScrollView(
              child: Column(
                children: gradeDescriptions
                    .map((gD) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SizedBox(
                                    width: 130,
                                    child: Text("${gD.proficiencyGrade}")),
                              ),
                              Expanded(
                                child: Text(
                                  "${gD.description}",
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.pop(context, 'Back to grading'),
                  child: const Text("Back to grading"))
            ],
          ),
        );
      },
      child: const Text("Grade Description"),
    );
  }
}
