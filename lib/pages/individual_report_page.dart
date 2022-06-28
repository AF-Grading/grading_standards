import 'package:app_prototype/models/grade_sheet.dart';
import 'package:app_prototype/models/individual_report.dart';
import 'package:app_prototype/pages/edit_gradesheet_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '/models/user.dart';

class IndividualReportPage extends StatelessWidget {
  const IndividualReportPage({
    Key? key,
    required this.user,
    required this.gradeSheets,
  }) : super(key: key);

  final User user;
  final List<GradeSheet> gradeSheets;

  @override
  Widget build(BuildContext context) {
    // We create the provider here because it will change for each student
    return ChangeNotifierProvider(
      // Here we inject the Individual's gradesheets
      create: (context) => IndividualReport(gradeSheets),
      builder: (context, individualReport) {
        return Scaffold(
          appBar: AppBar(title: Text(user.name)),
          body: SingleChildScrollView(
            child: Column(children: [
              // OVERALL SECTION
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                          "Average Overall Grade: ${context.watch<IndividualReport>().overallAverage}"),
                      Text(
                          "Most Recent Overall Comment: ${context.watch<IndividualReport>().mostRecentComment}"),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Overall Grades Over Time"),
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: charts.TimeSeriesChart(
                            context.watch<IndividualReport>().overallChart),
                      ),
                    ],
                  ),
                ],
              ),

              // TOP FIVE BOTTOM FIVE

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text("Top 5"),
                        Column(
                          children: context
                              .watch<IndividualReport>()
                              .bestFive
                              .map((item) =>
                                  Text("${item.name}: ${item.grade.index - 2}"))
                              .toList(),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Bottom 5"),
                        Column(
                          children: context
                              .watch<IndividualReport>()
                              .worstFive
                              .map((item) =>
                                  Text("${item.name}: ${item.grade.index - 2}"))
                              .toList(),
                        )
                      ],
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text("Strong 5"),
                        Column(
                          children: context
                              .watch<IndividualReport>()
                              .strongFive
                              .map((item) =>
                                  Text("${item.name}: ${item.average}"))
                              .toList(),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Weak 5",
                          style: TextStyle(fontSize: 32),
                        ),
                        Column(
                          children: context
                              .watch<IndividualReport>()
                              .weakFive
                              .map((item) => SizedBox(
                                    // TODO alter to favor relative sizing
                                    width: 400,
                                    height: 40,
                                    child: ListTile(
                                        title: Text("${item.name}"),
                                        trailing: Text("${item.average}")),
                                  ))
                              .toList(),
                        )
                      ],
                    )
                  ],
                ),
              ),

              // FILLING THE REST OF THE PAGE WITH BS

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("All Reports:"),
              ),
              for (GradeSheet sheet in gradeSheets)
                ListTile(
                  trailing: Text("Grade ${sheet.overall.index - 2}"),
                  subtitle: Text(sheet.overallComments),
                  title: Text(
                      "${sheet.startTime.month} ${sheet.startTime.day}, ${sheet.startTime.year}"),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditGradeSheetPage(
                        isEditing: false,
                        gradeSheet: sheet,
                      ),
                    ),
                  ),
                ),
            ]

                //Text(context.watch<IndividualReport>().first.student),
                /*context
                      .watch<IndividualReport>()
                      .currentGrades
                      .map((grade) => ListTile(
                            title: Text(grade.name),
                            subtitle: Text(grade.grade.index.toString()),
                          ))
                      .toList(),*/
                ),
          ),
        );
      },
    );
  }
}
