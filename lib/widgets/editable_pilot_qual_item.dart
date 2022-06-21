import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

class EditablePilotQualItem extends StatefulWidget {
  const EditablePilotQualItem(
      {Key? key, required this.pilotQual, required this.onChanged})
      : super(key: key);

  final PilotQual pilotQual;
  final ValueChanged<PilotQual> onChanged;

  @override
  State<EditablePilotQualItem> createState() => _EditablePilotQualItemState();
}

class _EditablePilotQualItemState extends State<EditablePilotQualItem> {
  late PilotQual _pilotQual;

  @override
  void initState() {
    _pilotQual = widget.pilotQual;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //changed rotation for readability
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Pilot Qualifications:"),
          Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("FPQ"),
                Radio<PilotQual>(
                  value: PilotQual.fpq,
                  groupValue: _pilotQual,
                  onChanged: (PilotQual? value) {
                    setState(() {
                      _pilotQual = value!;
                    });
                    widget.onChanged(_pilotQual);
                  },
                ),
              ]),
          Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("FPC"),
                Radio<PilotQual>(
                  value: PilotQual.fpc,
                  groupValue: _pilotQual,
                  onChanged: (PilotQual? value) {
                    setState(() {
                      _pilotQual = value!;
                    });
                    widget.onChanged(_pilotQual);
                  },
                ),
              ]),
          Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("MP"),
                Radio<PilotQual>(
                  value: PilotQual.mp,
                  groupValue: _pilotQual,
                  onChanged: (PilotQual? value) {
                    setState(() {
                      _pilotQual = value!;
                    });
                    widget.onChanged(_pilotQual);
                  },
                ),
              ]),
          Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("IP"),
                Radio<PilotQual>(
                  value: PilotQual.ip,
                  groupValue: _pilotQual,
                  onChanged: (PilotQual? value) {
                    setState(() {
                      _pilotQual = value!;
                    });
                    widget.onChanged(_pilotQual);
                  },
                ),
              ]),
        ],
      ),
    );
    // Below is the old up and down alignment, I think it would make more sense
    //if everything is lay out left to right

    // return Column(
    //   children: [
    //     const Text("Pilot Qualification"),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: const [
    //         Text("FPQ"),
    //         Text("FPC"),
    //         Text("MP"),
    //         Text("IP"),
    //       ],
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Radio<PilotQual>(
    //           value: PilotQual.fpq,
    //           groupValue: _pilotQual,
    //           onChanged: (PilotQual? value) {
    //             setState(() {
    //               _pilotQual = value!;
    //             });
    //             widget.onChanged(_pilotQual);
    //           },
    //         ),
    //         Radio<PilotQual>(
    //           value: PilotQual.fpc,
    //           groupValue: _pilotQual,
    //           onChanged: (PilotQual? value) {
    //             setState(() {
    //               _pilotQual = value!;
    //             });
    //             widget.onChanged(_pilotQual);
    //           },
    //         ),
    //         Radio<PilotQual>(
    //           value: PilotQual.mp,
    //           groupValue: _pilotQual,
    //           onChanged: (PilotQual? value) {
    //             setState(() {
    //               _pilotQual = value!;
    //             });
    //             widget.onChanged(_pilotQual);
    //           },
    //         ),
    //         Radio<PilotQual>(
    //           value: PilotQual.ip,
    //           groupValue: _pilotQual,
    //           onChanged: (PilotQual? value) {
    //             setState(() {
    //               _pilotQual = value!;
    //             });
    //             widget.onChanged(_pilotQual);
    //           },
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
