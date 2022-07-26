import 'package:app_prototype/models/grade_sheet.dart';
import 'package:app_prototype/models/individual_report.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../models/grade_enums.dart';
import '/models/user.dart';
import 'grade_sheet_page.dart';

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
            child: gradeSheets.length == 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Text('No Data Found for This Individual'),
                    ))
                : Column(
                    children: MediaQuery.of(context).size.width > 900
                        ?

                        // build wide

                        [
                            // OVERALL SECTION
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Average Overall Grade: ${context.watch<IndividualReport>().overallAverage.toStringAsPrecision(3)}",
                                      style: const TextStyle(fontSize: 22),
                                    ),
                                    const Text(
                                      "Most Recent Overall Comment:",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    Text(context
                                        .watch<IndividualReport>()
                                        .mostRecentComment),
                                    const Text(
                                      "Ungraded Items:",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: context
                                          .watch<IndividualReport>()
                                          .currentGrades
                                          .where((item) =>
                                              item.grade == Grade.noGrade)
                                          .map((item) => Text(item.name))
                                          .toList(),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "Overall Grade Over Time",
                                      style: TextStyle(fontSize: 28),
                                    ),
                                    SizedBox(
                                      width: 300,
                                      height: 300,
                                      child: charts.TimeSeriesChart(
                                        context
                                            .watch<IndividualReport>()
                                            .overallChart,
                                        defaultRenderer: new charts
                                            .BarRendererConfig<DateTime>(),
                                        // animate: true,
                                        // defaultRenderer: new charts
                                        //     .BarRendererConfig<DateTime>(),
                                        // defaultInteractions: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // TOP FIVE BOTTOM FIVE

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        "Top",
                                        style: TextStyle(fontSize: 28),
                                      ),
                                      Column(
                                        children: context
                                            .watch<IndividualReport>()
                                            .bestFive
                                            .map((item) => SizedBox(
                                                  // TODO alter to favor relative sizing
                                                  width: 400,
                                                  height: 40,
                                                  child: ListTile(
                                                      title: Text(item.name),
                                                      trailing: Text(
                                                          "${item.grade!.index - 2}")),
                                                ))
                                            .toList(),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        "Bottom",
                                        style: TextStyle(fontSize: 28),
                                      ),
                                      Column(
                                        children: context
                                            .watch<IndividualReport>()
                                            .worstFive
                                            .map((item) => SizedBox(
                                                  // TODO alter to favor relative sizing
                                                  width: 400,
                                                  height: 40,
                                                  child: ListTile(
                                                      title: Text(item.name),
                                                      trailing: Text(
                                                          "${item.grade!.index - 2}")),
                                                ))
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        "Strong",
                                        style: TextStyle(fontSize: 28),
                                      ),
                                      Column(
                                        children: context
                                            .watch<IndividualReport>()
                                            .strongFive
                                            .map((item) => SizedBox(
                                                  // TODO alter to favor relative sizing
                                                  width: 400,
                                                  height: 40,
                                                  child: ListTile(
                                                      title: Text(item.name),
                                                      trailing: Text(item
                                                          .average
                                                          .toStringAsPrecision(
                                                              3))),
                                                ))
                                            .toList(),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        "Weak",
                                        style: TextStyle(fontSize: 28),
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
                                                      title: Text(item.name),
                                                      trailing: Text(item
                                                          .average
                                                          .toStringAsPrecision(
                                                              3))),
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
                              child: Text(
                                "All Reports",
                                style: TextStyle(fontSize: 28),
                              ),
                            ),
                            for (GradeSheet sheet in gradeSheets)
                              ListTile(
                                trailing:
                                    Text("Grade ${sheet.overall!.index - 2}"),
                                subtitle: Text(sheet.overallComments),
                                title: Text(
                                    "${sheet.startTime.month} ${sheet.startTime.day}, ${sheet.startTime.year}"),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GradeSheetPage(
                                      gradeSheet: sheet,
                                    ),
                                  ),
                                ),
                              ),
                          ]
                        :

                        // build narrow

                        [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 20, 8, 30),
                              child: Text(
                                "Average Overall Grade: ${context.watch<IndividualReport>().overallAverage.toStringAsPrecision(3)}",
                                style: const TextStyle(fontSize: 22),
                              ),
                            ),

                            const Text(
                              "Most Recent Overall Comment:",
                              style: TextStyle(fontSize: 22),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
                              child: Text(context
                                  .watch<IndividualReport>()
                                  .mostRecentComment),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
                              child: Column(children: [
                                const Text(
                                  "Ungraded Items:",
                                  style: TextStyle(fontSize: 22),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: context
                                      .watch<IndividualReport>()
                                      .currentGrades
                                      .where(
                                          (item) => item.grade == Grade.noGrade)
                                      .map((item) => Text(item.name))
                                      .toList(),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
                              child: Column(
                                children: [
                                  const Text(
                                    "Overall Grade Over Time",
                                    style: TextStyle(fontSize: 28),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    height: 300,
                                    child: charts.TimeSeriesChart(
                                      context
                                          .watch<IndividualReport>()
                                          .overallChart,
                                      defaultRenderer: new charts
                                          .BarRendererConfig<DateTime>(),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // TOP FIVE BOTTOM FIVE

                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
                              child: Column(children: [
                                const Text(
                                  "Top",
                                  style: TextStyle(fontSize: 28),
                                ),
                                const Text(
                                  "(Category Over Time)",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Column(
                                  children: context
                                      .watch<IndividualReport>()
                                      .bestFive
                                      .map((item) => SizedBox(
                                            // TODO alter to favor relative sizing
                                            width: 400,
                                            height: 40,
                                            child: ListTile(
                                                title: Text(item.name),
                                                trailing: Text(
                                                    "${item.grade!.index - 2}")),
                                          ))
                                      .toList(),
                                ),
                              ]),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
                              child: Column(children: [
                                const Text(
                                  "Bottom",
                                  style: TextStyle(fontSize: 28),
                                ),
                                const Text(
                                  "(Category Over Time)",
                                  style: TextStyle(fontSize: 10),
                                ),
                                Column(
                                  children: context
                                      .watch<IndividualReport>()
                                      .worstFive
                                      .map((item) => SizedBox(
                                            // TODO alter to favor relative sizing
                                            width: 400,
                                            height: 40,
                                            child: ListTile(
                                                title: Text(item.name),
                                                trailing: Text(
                                                    "${item.grade!.index - 2}")),
                                          ))
                                      .toList(),
                                ),
                              ]),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
                              child: Column(
                                children: [
                                  const Text(
                                    "Strong",
                                    style: TextStyle(fontSize: 28),
                                  ),
                                  Column(
                                    children: context
                                        .watch<IndividualReport>()
                                        .strongFive
                                        .map((item) => SizedBox(
                                              // TODO alter to favor relative sizing
                                              width: 400,
                                              height: 40,
                                              child: ListTile(
                                                  title: Text(item.name),
                                                  trailing: Text(item.average
                                                      .toStringAsPrecision(3))),
                                            ))
                                        .toList(),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 30),
                              child: Column(
                                children: [
                                  const Text(
                                    "Weak",
                                    style: TextStyle(fontSize: 28),
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
                                                  title: Text(item.name),
                                                  trailing: Text(item.average
                                                      .toStringAsPrecision(3))),
                                            ))
                                        .toList(),
                                  )
                                ],
                              ),
                            ),

                            // FILLING THE REST OF THE PAGE WITH BS

                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "All Reports",
                                style: TextStyle(fontSize: 28),
                              ),
                            ),
                            for (GradeSheet sheet in gradeSheets)
                              ListTile(
                                trailing:
                                    Text("Grade ${sheet.overall!.index - 2}"),
                                subtitle: Text(sheet.overallComments),
                                title: Text(
                                    "${sheet.startTime.month} ${sheet.startTime.day}, ${sheet.startTime.year}"),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GradeSheetPage(
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
