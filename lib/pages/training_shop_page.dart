import 'package:app_prototype/models/application_state.dart';
import 'package:app_prototype/models/grade_enums.dart';
import 'package:app_prototype/models/grade_sheet.dart';
import 'package:app_prototype/models/grading_criterion.dart';
import 'package:app_prototype/models/user.dart';
import 'package:app_prototype/models/user_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../models/training_shop.dart';
import '../widgets/buttons/download_report.dart';
import '../widgets/date_picker.dart';
import '../widgets/stats/stats_buttons_squadrons.dart';
import '../widgets/stats/stats_vars.dart';
import 'grade_sheet_page.dart';

class TrainingShopPage extends StatefulWidget {
  TrainingShopPage({
    Key? key,
    required this.instructor,
    required this.squad,
    required this.gradeSheets,
  }) : super(key: key);

  final bool instructor;
  final String squad;
  final List<GradeSheet> gradeSheets;
  late TimeCalculate curr_value;

  _TrainingShopPageState createState() => _TrainingShopPageState();
}

class _TrainingShopPageState extends State<TrainingShopPage> {
  @override
  Widget build(BuildContext context) {
    // We create the provider here because it will change for each student
    return ChangeNotifierProvider(
      // Here we inject the Individual's gradesheets
      create: (context) => TrainingShop(
          widget.gradeSheets, context.read<List<GradingCriterion>>()),
      builder: (context, trainingShop) {
        return Scaffold(
          appBar: widget.instructor
              ? null
              : AppBar(
                  title: Text(widget.squad),
                  actions: [
                    DownloadReport(
                        gradeSheets: widget.gradeSheets,
                        users: context.read<List<UserSetting>>(),
                        filename:
                            "${widget.squad.toLowerCase().replaceAll(' ', '_')}_report"),
                  ],
                ),
          body: SingleChildScrollView(
            child: widget.gradeSheets.length == 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Text('No Data Found for This Squadron'),
                    ))
                : Column(
                    children: MediaQuery.of(context).size.width > 900
                        ? [
                            // build wide

                            // OVERALL SECTION
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Average Overall Grade by Instructor",
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: context
                                          .watch<TrainingShop>()
                                          .avgPerInstructor
                                          .map((item) {
                                        String instructor_email = item.name;
                                        String real_name = "";
                                        String? rank = "";
                                        context
                                            .watch<List<UserSetting>>()
                                            .forEach((user) {
                                          if (user.email == instructor_email) {
                                            rank = user.rank.pretty;
                                            real_name = user.name;
                                          }
                                        });

                                        return Text(
                                            "${rank} ${real_name}: ${item.average.toStringAsPrecision(3)}");
                                      }).toList(),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Start Date"),
                                    DatePicker(
                                      date: context
                                          .watch<TrainingShop>()
                                          .startDate,
                                      onChanged: (value) => setState(() {
                                        context.read<TrainingShop>().dateStart =
                                            value;
                                      }),
                                    ),
                                    Text("End Date"),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: DatePicker(
                                        date: context
                                            .watch<TrainingShop>()
                                            .endDate,
                                        onChanged: (value) => setState(() {
                                          context.read<TrainingShop>().dateEnd =
                                              value;
                                        }),
                                      ),
                                    ),
                                    StatsButtonsSquadrons(
                                      initialValue: TimeCalculate.all,
                                      validator: (value) {
                                        if (value == null) {
                                          return "Please select a value";
                                        }
                                        return null;
                                      },
                                      onChanged: (value) => setState(() {
                                        widget.curr_value = value;
                                      }),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // TOP FIVE BOTTOM FIVE

                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceEvenly,
                            //     children: [
                            //       // Column(
                            //       //   children: [
                            //       //     const Text(
                            //       //       "Top",
                            //       //       style: TextStyle(fontSize: 28),
                            //       //     ),
                            //       //     Column(
                            //       //       children: context
                            //       //           .watch<TrainingShop>()
                            //       //           .bestFive
                            //       //           .map((item) => SizedBox(
                            //       //                 // TODO alter to favor relative sizing
                            //       //                 width: 400,
                            //       //                 height: 40,
                            //       //                 child: ListTile(
                            //       //                     title: Text(item.name),
                            //       //                     trailing: Text(
                            //       //                         "${item.grade!.index - 2}")),
                            //       //               ))
                            //       //           .toList(),
                            //       //     )
                            //       //   ],
                            //       // ),
                            //       // Column(
                            //       //   children: [
                            //       //     const Text(
                            //       //       "Bottom",
                            //       //       style: TextStyle(fontSize: 28),
                            //       //     ),
                            //       //     Column(
                            //       //       children: context
                            //       //           .watch<TrainingShop>()
                            //       //           .worstFive
                            //       //           .map((item) => SizedBox(
                            //       //                 // TODO alter to favor relative sizing
                            //       //                 width: 400,
                            //       //                 height: 40,
                            //       //                 child: ListTile(
                            //       //                     title: Text(item.name),
                            //       //                     trailing: Text(
                            //       //                         "${item.grade!.index - 2}")),
                            //       //               ))
                            //       //           .toList(),
                            //       //     )
                            //       //   ],
                            //       // )
                            //     ],
                            //   ),
                            // ),

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
                                      const Text(
                                        "(highest performing 5 categories all time)",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Column(
                                        children: context
                                            .watch<TrainingShop>()
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
                                      const Text(
                                        "(lowest performing 5 categories all time)",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Column(
                                        children: context
                                            .watch<TrainingShop>()
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

                            for (GradeSheet sheet in context
                                .watch<TrainingShop>()
                                .modifiedSortedGradeSheets)
                              ListTile(
                                trailing:
                                    Text("Grade ${sheet.overall!.number}"),
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

                            // Column(children: [
                            //   for (GradeSheet sheet in gradeSheets)

                            //     // TODO: change this to names instead of emails
                            //     {

                            //     }.toList(),
                            // ])
                          ]
                        : [
                            // build narrow

                            // OVERALL SECTION
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 20, 8, 30),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Average Overall Grade by Instructor",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: context
                                        .watch<TrainingShop>()
                                        .avgPerInstructor
                                        .map((item) {
                                      String instructor_email = item.name;
                                      String real_name = "";
                                      String? rank = "";
                                      context
                                          .watch<List<UserSetting>>()
                                          .forEach((user) {
                                        if (user.email == instructor_email) {
                                          real_name = user.name;
                                          rank = user.rank.pretty;
                                        }
                                      });

                                      return Text(
                                          "${rank} ${real_name}: ${item.average.toStringAsPrecision(3)}");
                                    }).toList(),
                                  )
                                ],
                              ),
                            ),
                            Text("Start Date"),
                            DatePicker(
                              date: context.watch<TrainingShop>().startDate,
                              onChanged: (value) => setState(() {
                                context.read<TrainingShop>().dateStart = value;
                              }),
                            ),
                            Text("End Date"),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: DatePicker(
                                date: context.watch<TrainingShop>().endDate,
                                onChanged: (value) => setState(() {
                                  context.read<TrainingShop>().dateEnd = value;
                                }),
                              ),
                            ),
                            StatsButtonsSquadrons(
                              initialValue: TimeCalculate.all,
                              validator: (value) {
                                if (value == null) {
                                  return "Please select a value";
                                }
                                return null;
                              },
                              onChanged: (value) => setState(() {
                                widget.curr_value = value;
                              }),
                            ),

                            // TOP FIVE BOTTOM FIVE

                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 30),
                            //   child: Column(
                            //     children: [
                            //       const Text(
                            //         "Top",
                            //         style: TextStyle(fontSize: 28),
                            //       ),
                            //       Column(
                            //         children: context
                            //             .watch<TrainingShop>()
                            //             .bestFive
                            //             .map((item) => SizedBox(
                            //                   // TODO alter to favor relative sizing
                            //                   width: 400,
                            //                   height: 40,
                            //                   child: ListTile(
                            //                       title: Text(item.name),
                            //                       trailing: Text(
                            //                           "${item.grade!.index - 2}")),
                            //                 ))
                            //             .toList(),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 30),
                            //   child: Column(
                            //     children: [
                            //       const Text(
                            //         "Bottom",
                            //         style: TextStyle(fontSize: 28),
                            //       ),
                            //       Column(
                            //         children: context
                            //             .watch<TrainingShop>()
                            //             .worstFive
                            //             .map((item) => SizedBox(
                            //                   // TODO alter to favor relative sizing
                            //                   width: 400,
                            //                   height: 40,
                            //                   child: ListTile(
                            //                       title: Text(item.name),
                            //                       trailing: Text(
                            //                           "${item.grade!.index - 2}")),
                            //                 ))
                            //             .toList(),
                            //       )
                            //     ],
                            //   ),
                            // ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 30),
                              child: Column(
                                children: [
                                  const Text(
                                    "Strong",
                                    style: TextStyle(fontSize: 28),
                                  ),
                                  const Text(
                                    "(highest average categories during selected time period)",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Column(
                                    children: context
                                        .watch<TrainingShop>()
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
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 30),
                              child: Column(
                                children: [
                                  const Text(
                                    "Weak",
                                    style: TextStyle(fontSize: 28),
                                  ),
                                  const Text(
                                    "(lowest average categories during selected time period)",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Column(
                                    children: context
                                        .watch<TrainingShop>()
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
                            for (GradeSheet sheet in context
                                .watch<TrainingShop>()
                                .modifiedSortedGradeSheets)
                              ListTile(
                                trailing:
                                    Text("Grade ${sheet.overall!.number}"),
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
                          ]),
          ),
        );
      },
    );
  }
}
