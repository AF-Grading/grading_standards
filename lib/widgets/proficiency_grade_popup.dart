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
            title: Text(
              "Proficiency Description",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            content: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[0].proficiencyGrade}", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text(
                  "${gradeDescriptions[0].description}",
                ),
                Divider(thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[1].proficiencyGrade}", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text(
                  "${gradeDescriptions[1].description}",
                ),
                Divider(thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[2].proficiencyGrade}", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text(
                  "${gradeDescriptions[2].description}",
                ),
                Divider(thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[3].proficiencyGrade}", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text(
                  "${gradeDescriptions[3].description}",
                ),
                Divider(thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[4].proficiencyGrade}", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text(
                  "${gradeDescriptions[4].description}",
                ),
                Divider(thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[5].proficiencyGrade}", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text(
                  "${gradeDescriptions[5].description}",
                ),
                Divider(thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${gradeDescriptions[6].proficiencyGrade}", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text(
                  "${gradeDescriptions[6].description}",
                ),
                Divider(thickness: 2,),
              ]

                  /*gradeDescriptions
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
                              Divider(thickness: 2,),
                              Divider(
                                thickness: 2,
                              )
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
