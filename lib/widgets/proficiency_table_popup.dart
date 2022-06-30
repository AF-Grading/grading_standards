import 'package:flutter/material.dart';

class ProficencyTablePopup extends StatelessWidget {
  const ProficencyTablePopup({Key? key}) : super(key: key);

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
                children: [
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
                          child: SizedBox(width: 150, child: Text("CTSItem")),
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
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.pop(context, 'Back to grading'),
                  child: const Text("Back to grading"))
            ],
          ),
        );
      },
      child: const Text("Proficiency Table"),
    );
  }
}

List<TableDescription> tableDescriptions = [
  TableDescription("Communication Skill", 1, 2, 3, 3),
  TableDescription("Systems Knowledge", 2, 2, 3, 3),
  TableDescription("Combat Governing Documents", 1, 2, 3, 3),
  TableDescription(
      "Threat Analysis & Mitigation/Intel Integration", 1, 2, 3, 3),
  TableDescription("Mission Planning", 2, 2, 3, 3),
];

List<AirDropTableDescription> airDropDescriptions = [
  AirDropTableDescription(
      "Formation Operations - Visual Procedures", 2, 3, 3, 4),
];

class TableDescription {
  final String ctsItem;
  final int fpc;
  final int fpq;
  final int mp;
  final int ip;
  TableDescription(this.ctsItem, this.fpc, this.fpq, this.mp, this.ip);
}

class AirDropTableDescription {
  final String ctsItem;
  final int cpad;
  final int acad;
  final int adip;
  final int ldad;
  AirDropTableDescription(
      this.ctsItem, this.cpad, this.acad, this.adip, this.ldad);
}
