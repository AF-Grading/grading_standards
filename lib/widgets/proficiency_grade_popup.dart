import 'package:flutter/material.dart';

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

List<GradeDescription> gradeDescriptions = [
  GradeDescription("Expert (4)",
      'Grades earning a “4” represent an unusually high degree of ability and reflect “Expert” level performance. Expert level performance encompasses an individual’s ability to successfully perform a specific skill/task/topic with an extraordinary level of ability, speed, accuracy, safety, and technique in a highly stressful and/or complex environment. Can evaluate/explain/describe facts/principles and nomenclature/terms and/or perform and create new concepts/techniques involved in the skillset/subject.'),
  GradeDescription("Proficient (3)",
      'Grades of “3” are labeled "Proficient" and are consistent with performance that is correct, skillful, and without hesitation. Proficient level performance encompasses an individual\'s ability to successfully and decisively perform a specific skill with full understanding of actions, reactions, and applications under various circumstances and when exposed to various environments. Can analyze, state, describe facts/principles and nomenclature/terms and/or preform procedures and techniques involved in a skillset/subject with no assistance from an instructor; and little to no doubt remains in the operator\'s ability to perform the event.'),
  GradeDescription("Familiar (2)",
      'A grade of “2” is considered “Familiar” and represents performance that is essentially correct. Although some areas of imprecision or flaws exist, the skill was accomplished satisfactorily given a specific set of circumstances and/or environments. Can state/discuss facts and nomenclature/terms and/or perform procedures and basic techniques involved in a skill/subject with some assistance from an instructor; and the use of the specific skill was generally effective and, despite relatively minor errors, performance contributed positively towards the desired goal.'),
  GradeDescription("Introductory (1)",
      '“Introductory” grades are labeled “1” and are based on performance that is marginal or limited in proficiency. Introductory level performance indicates an inability to achieve a familiar or proficient level of accomplishment and accuracy, not because of a fundamental lack of knowledge of the required skill, but due to a lack of experience, proper execution, technique, or application. Can identify basic facts and state nomenclature/terms and/or perform basic procedures involved in the skill/subject with significant assistance from an instructor. This the lowest passing grade possible.'),
  GradeDescription("Unsatisfactory (0)",
      'Performance indicating a lack of ability or knowledge is deemed “Unsatisfactory” and will be graded as “0”. The student is unsafe, showed dangerous tendencies, unable, or lacks sufficient knowledge, skill or ability to perform the operation, maneuver, or task.'),
  GradeDescription("No Grade (NG)",
      'The instructor demonstrates a maneuver the pilot does not practice or performance was not observed, element was not performed.'),
  GradeDescription("NOTES",
      'Crewmembers graded an unsatisfactory (0) on any required individual task should not receive any higher overall sortie grade than Familiar (2). Likewise, instructors should consider awarding an overall grade of (0) if the same specific procedure is graded as unsatisfactory (0) three sorties in a row. A Crewmember’s performance is expected to improve during training and upgrade, and lack of progression will be reflected in the overall grade.'),
];

class GradeDescription {
  final String proficiencyGrade;
  final String description;
  GradeDescription(this.proficiencyGrade, this.description);
}
