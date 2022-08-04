import 'package:flutter/material.dart';

import '../models/cts_list.dart';

class ProficencyTablePopup extends StatelessWidget {
  const ProficencyTablePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Proficiency Grade",
                style: TextStyle(color: Theme.of(context).primaryColor)),
            content: SingleChildScrollView(
              child: Column(
                children: MediaQuery.of(context).size.width > 900
                    ? [
                        //big screen
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text("Table Description",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Divider(
                                thickness: 4,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        for (TableDescription tD in tableDescriptions)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(tD.ctsItem),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text("FPC"),
                                        Text(tD.fpc.toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("FPQ"),
                                        Text(tD.fpq.toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("MP"),
                                        Text(tD.mp.toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("IP"),
                                        Text(tD.ip.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: Text(
                                  "Air Drop Description",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              Divider(
                                thickness: 4,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        // Text("CPAD"),
                        // Text("ACAD"),
                        // Text("ADIP"),
                        // Text("LDAD"),
                        for (AirDropTableDescription tD in airDropDescriptions)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(tD.ctsItem),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text("CPAD"),
                                        Text(tD.cpad.toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("ACAD"),
                                        Text(tD.acad.toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("ADIP"),
                                        Text(tD.adip.toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("LDAD"),
                                        Text(tD.ldad.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                              ],
                            ),
                          ),
                      ]
                    : [
                        //small screen
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text("Table Description",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              Divider(
                                thickness: 4,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        for (TableDescription tD in tableDescriptions)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(tD.ctsItem),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text("FPC"),
                                        Text(tD.fpc.toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("FPQ"),
                                        Text(tD.fpq.toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("MP"),
                                        Text(tD.mp.toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("IP"),
                                        Text(tD.ip.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: Text(
                                  "Air Drop Description",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              Divider(
                                thickness: 4,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        // Text("CPAD"),
                        // Text("ACAD"),
                        // Text("ADIP"),
                        // Text("LDAD"),
                        for (AirDropTableDescription tD in airDropDescriptions)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(tD.ctsItem),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text("CPAD"),
                                        Text(tD.cpad.toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("ACAD"),
                                        Text(tD.acad.toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("ADIP"),
                                        Text(tD.adip.toString()),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("LDAD"),
                                        Text(tD.ldad.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                ),
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
      child: MediaQuery.of(context).size.width > 600
          ? const Text("Proficiency Table",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          : const Text("Proficiency Table",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    );
  }
}
