import 'package:flutter/material.dart';

import '../models/grade_sheet.dart';

class EditablePilotQualItem extends StatefulWidget {
  const EditablePilotQualItem({Key? key, required this.gradeSheet})
      : super(key: key);

  final GradeSheet gradeSheet;

  @override
  State<EditablePilotQualItem> createState() => _EditablePilotQualItemState();
}

class _EditablePilotQualItemState extends State<EditablePilotQualItem> {
  PilotQual _pilotQual = PilotQual.fpq;

  @override
  void initState() {
    _pilotQual = widget.gradeSheet.pilotQual;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Pilot Qualification"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text("FPQ"),
            Text("FPC"),
            Text("MP"),
            Text("IP"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Radio<PilotQual>(
              value: PilotQual.fpq,
              groupValue: _pilotQual,
              onChanged: (PilotQual? value) {
                setState(() {
                  _pilotQual = value!;
                });
              },
            ),
            Radio<PilotQual>(
              value: PilotQual.fpc,
              groupValue: _pilotQual,
              onChanged: (PilotQual? value) {
                setState(() {
                  _pilotQual = value!;
                });
              },
            ),
            Radio<PilotQual>(
              value: PilotQual.mp,
              groupValue: _pilotQual,
              onChanged: (PilotQual? value) {
                setState(() {
                  _pilotQual = value!;
                });
              },
            ),
            Radio<PilotQual>(
              value: PilotQual.ip,
              groupValue: _pilotQual,
              onChanged: (PilotQual? value) {
                setState(() {
                  _pilotQual = value!;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
