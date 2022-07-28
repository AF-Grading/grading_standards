import 'package:app_prototype/models/cts_list.dart';
import 'package:flutter/material.dart';

// error thrown when using the name 'ReferenceMaterialsPage'
// perhaps class exists elsewhere?
class ReferenceMaterialsPages extends StatelessWidget {
  const ReferenceMaterialsPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Reference Materials"),
          bottom: TabBar(
            tabs: [
              Text("Grade Criteria"),
              Column(children: [Text("Grade"), Text("Items")]),
              Text("Proficiency Table")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: gradeDescriptions
                    .map((gD) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${gD.proficiencyGrade}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Text(
                                "${gD.description}",
                              ),
                              Divider(
                                thickness: 2,
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      title: Text(
                        "Notes",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "1. Purpose",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                            "To provide individual task items to standardize grading procedures among C-17A instructors and to focus training on specific achievable desired learning objectives (DLOs)."),
                        Divider(
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "2. General Proficiency Standards",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "a. Crewmember training standards (CTS) equate to a proficiency maneuver grade of “3” (Proficient) unless otherwise stated."),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "b. Tolerances in performance parameters are based on conditions of smooth air and a stable aircraft. Aircraft control must be smooth and positive. Momentary excursions beyond “plus or minus” or other standards are acceptable provided they are not characteristic of performance, timely corrections are made, and safety of flight is not compromised. Consider cumulative deviations when determining the overall grade."),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "c. Procedural knowledge and application must be in accordance with applicable directives and allow the sortie to be accomplished efficiently."),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "3. Job Tasks",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                              "Performance conditions and standards are specified in the following CTS table."),
                        ),
                      ],
                    ),
                  ),
                  // ListTile(
                  //   title: const Text("Grade Item",
                  //       style: TextStyle(
                  //           fontSize: 18, fontWeight: FontWeight.bold)),
                  //   subtitle: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: const [
                  //       Expanded(
                  //         child: SizedBox(child: Text("Performance")),
                  //       ),
                  //       Expanded(
                  //         child: SizedBox(child: Text("Standards")),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  for (CTSItem item in ctsItems) // title: Text(item.name),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Text(
                            item.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        /*Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text("Performance"),
                              Text("Standards"),
                            ],
                          ),*/
                        Padding(
                            padding: EdgeInsets.only(top: 14),
                            child: Text("Performance",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))),
                        Padding(
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 12),
                            child: Text(item.performance)),
                        Text("Standards",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Padding(
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text(item.standards)),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  //trailing: Text("Passing Score: ${item.passingScore.index}"),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      title: Text(
                        "Notes",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "The below table lists expected proficiency standards by crew qualification for each CTS item. If the item is not accomplished then no grade needs to be recorded, if an item is witnessed but not accomplished, record it with the grade “NG” in order to record that the pilot has at seen something accomplished."),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                            width: 150,
                            child: Text(
                              "Pilot Item",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(width: 39, child: Center(child: Text("FPC"))),
                        SizedBox(width: 39, child: Center(child: Text("FPQ"))),
                        SizedBox(width: 39, child: Center(child: Text("MP"))),
                        SizedBox(width: 39, child: Center(child: Text("IP"))),
                      ],
                    ),
                  ),
                  for (TableDescription tD in tableDescriptions)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: 150,
                              height: 50,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(tD.ctsItem))),
                          SizedBox(
                            width: 39,
                            child: Center(child: Text(tD.fpc.toString())),
                          ),
                          SizedBox(
                            width: 39,
                            child: Center(child: Text(tD.fpq.toString())),
                          ),
                          SizedBox(
                            width: 39,
                            child: Center(child: Text(tD.mp.toString())),
                          ),
                          SizedBox(
                            width: 39,
                            child: Center(child: Text(tD.ip.toString())),
                          ),
                        ],
                      ),
                    ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 30, 8, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                            width: 150,
                            child: Text("Airdrop Item",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(width: 39, child: Center(child: Text("CPAD"))),
                        SizedBox(width: 39, child: Center(child: Text("ACAD"))),
                        SizedBox(width: 39, child: Center(child: Text("ADIP"))),
                        SizedBox(width: 39, child: Center(child: Text("LDAD"))),
                      ],
                    ),
                  ),
                  for (AirDropTableDescription tD in airDropDescriptions)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: 150,
                              height: 50,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(tD.ctsItem))),
                          SizedBox(
                            width: 39,
                            child: Center(child: Text(tD.cpad.toString())),
                          ),
                          SizedBox(
                            width: 39,
                            child: Center(
                              child: Text(tD.acad.toString()),
                            ),
                          ),
                          SizedBox(
                            width: 39,
                            child: Center(
                              child: Text(tD.adip.toString()),
                            ),
                          ),
                          SizedBox(
                            width: 39,
                            child: Center(
                              child: Text(tD.ldad.toString()),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
