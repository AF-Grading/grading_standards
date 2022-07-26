// import 'dart:html';

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
            title: const Text("Proficiency Description"),
            content: SingleChildScrollView(
              child: Column(
                children: gradeDescriptions
                    .map((gD) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Padding(
                              // padding: const EdgeInsets.only(right: 8.0),
                              // child:
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Text("${gD.proficiencyGrade}")),
                              // ),
                              Text(
                                "${gD.description}",
                              ),
                              Divider(
                                thickness: 2,
                              )
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
      child: MediaQuery.of(context).size.width > 600
          ? const Text(
              "Grade Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          : const Text("Grade Description",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    );
  }
}
