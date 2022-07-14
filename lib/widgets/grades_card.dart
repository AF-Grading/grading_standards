import 'package:app_prototype/models/grade_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cts_list.dart';
import '../models/current_flight.dart';
import '../models/grade_enums.dart';
import '../models/user.dart';
import 'grade_radio_form_field.dart';

class GradesCard extends StatelessWidget {
  const GradesCard({
    Key? key,
    //required this.gradeSheet,
    required this.student,
    required this.grades,
    required this.hasErrors,
    this.title,
    this.initiallyExpanded = true,
  }) : super(key: key);

  //final GradeSheet gradeSheet;
  final String student;
  final List<GradeItem> grades;
  final String? title;
  final bool initiallyExpanded;
  final ValueChanged<bool> hasErrors;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        title: title != null ? Text(title!) : const Text("Grade Items"),
        children: grades
            .map(
              (item) => ListTile(
                leading: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: GestureDetector(
                    onTap: () {
                      var ctsItem = ctsItems
                          .firstWhere((ctsItem) => item.name == ctsItem.name);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(ctsItem.name),
                          content: Text(ctsItem.standards),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Back to grading'),
                                child: const Text("Back to grading"))
                          ],
                        ),
                      );
                    },
                    child: Text(item.name),
                  ),
                ),
                title: GradeRadiosFormField(
                  initialValue: item.grade,
                  validator: (value) {
                    if (value == null) {
                      return "Please select a value";
                    } else {
                      hasErrors(false);
                      return null;
                    }
                  },
                  onChanged: (grade) =>
                      context.read<CurrentFlight>().updateByGradeItem(
                            student,
                            GradeItem(
                                name: item.name,
                                //comments: item.comments,
                                grade: grade),
                          ),
                ),
                subtitle: TextFormField(
                  initialValue: item.comments,
                  decoration: const InputDecoration(
                    labelText: "Comments",
                  ),
                  onChanged: (comment) {
                    context.read<CurrentFlight>().updateByGradeItem(
                          student,
                          GradeItem(
                            name: item.name,
                            comments: comment,
                            //grade: item.grade,
                          ),
                        );
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

//  Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 // change this part to change the arrangement
//                 children: [
//                   Row(children: [
//                     GestureDetector(
//                       onTap: () {
//                         var ctsItem = ctsItems
//                             .firstWhere((ctsItem) => item.name == ctsItem.name);
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) => AlertDialog(
//                             title: Text(ctsItem.name),
//                             content: Text(ctsItem.standards),
//                             actions: <Widget>[
//                               TextButton(
//                                   onPressed: () =>
//                                       Navigator.pop(context, 'Back to grading'),
//                                   child: const Text("Back to grading"))
//                             ],
//                           ),
//                         );
//                       },
//                       child: Text(item.name),
//                     ),
//                     GradeRadiosFormField(
//                       initialValue: item.grade,
//                       validator: (value) {
//                         if (value == null || value == Grade.noSelection) {
//                           return "Please select a value";
//                         } else {
//                           hasErrors(false);
//                           return null;
//                         }
//                       },
//                       onChanged: (grade) =>
//                           context.read<CurrentFlight>().updateByGradeItem(
//                                 student,
//                                 GradeItem(
//                                     name: item.name,
//                                     comments: item.comments,
//                                     grade: grade),
//                               ),
//                     ),
//                   ]),
//                   Row(children: [
//                     TextFormField(
//                       initialValue: item.comments,
//                       decoration: const InputDecoration(
//                         labelText: "Comments",
//                       ),
//                       onChanged: (comment) {
//                         context.read<CurrentFlight>().updateByGradeItem(
//                               student,
//                               GradeItem(
//                                 name: item.name,
//                                 comments: comment,
//                                 grade: item.grade,
//                               ),
//                             );
//                       },
//                     ),
//                   ])
//                 ],
              // ),