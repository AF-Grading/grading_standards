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
            title: Text(
              "Proficiency Grade and Description",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            content: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[0].proficiencyGrade}"),
                ),
                Text(
                  "${gradeDescriptions[0].description}",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[1].proficiencyGrade}"),
                ),
                Text(
                  "${gradeDescriptions[1].description}",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[2].proficiencyGrade}"),
                ),
                Text(
                  "${gradeDescriptions[2].description}",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[3].proficiencyGrade}"),
                ),
                Text(
                  "${gradeDescriptions[3].description}",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[4].proficiencyGrade}"),
                ),
                Text(
                  "${gradeDescriptions[4].description}",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[5].proficiencyGrade}"),
                ),
                Text(
                  "${gradeDescriptions[5].description}",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[6].proficiencyGrade}"),
                ),
                Text(
                  "${gradeDescriptions[6].description}",
                ),
              ]

                  /*gradeDescriptions
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
                    .toList(),*/
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
      child: const Text("About Grades"),
    );
  }
}
