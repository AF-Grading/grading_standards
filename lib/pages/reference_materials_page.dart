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
          bottom: const TabBar(
            tabs: [
              Text("Grade Criteria"),
              Text("Items"),
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
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      title: Text("Notes"),
                      children: [
                        Text(
                            "1. Purpose — To provide individual task items to standardize grading procedures among C-17A instructors and to focus training on specific achievable desired learning objectives (DLOs)."),
                        Text("2. General Proficiency Standards"),
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
                        Text(
                            "3. Job Tasks — Performance conditions and standards are specified in the following CTS table."),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text("Grade Item"),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Expanded(
                          child: SizedBox(child: Text("Performance")),
                        ),
                        Expanded(
                          child: SizedBox(child: Text("Standards")),
                        )
                      ],
                    ),
                  ),
                  for (CTSItem item in ctsItems)
                    ListTile(
                      title: Text(item.name),
                      subtitle: Column(
                        children: [
                          /*Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text("Performance"),
                              Text("Standards"),
                            ],
                          ),*/
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child:
                                      SizedBox(child: Text(item.performance))),
                              Expanded(
                                  child: SizedBox(child: Text(item.standards))),
                            ],
                          ),
                        ],
                      ),
                      //trailing: Text("Passing Score: ${item.passingScore.index}"),
                    ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      title: Text("Notes"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "1. The below table lists expected proficiency standards by crew qualification for each CTS item. If the item is not accomplished then no grade needs to be recorded, if an item is witnessed but not accomplished, record it with the grade “NG” in order to record that the pilot has at seen something accomplished."),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: SizedBox(width: 150, child: Text("CTSItem")),
                        ),
                        Text("FPC"),
                        Text("FPQ"),
                        Text("MP"),
                        Text("IP"),
                      ],
                    ),
                  ),
                  for (TableDescription tD in tableDescriptions)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child:
                                SizedBox(width: 150, child: Text(tD.ctsItem)),
                          ),
                          Text(tD.fpc.toString()),
                          Text(tD.fpq.toString()),
                          Text(tD.mp.toString()),
                          Text(tD.ip.toString()),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: SizedBox(width: 100, child: Text("CTSItem")),
                        ),
                        Text("CPAD"),
                        Text("ACAD"),
                        Text("ADIP"),
                        Text("LDAD"),
                      ],
                    ),
                  ),
                  for (AirDropTableDescription tD in airDropDescriptions)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child:
                                SizedBox(width: 150, child: Text(tD.ctsItem)),
                          ),
                          Text(tD.cpad.toString()),
                          Text(tD.acad.toString()),
                          Text(tD.adip.toString()),
                          Text(tD.ldad.toString()),
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
