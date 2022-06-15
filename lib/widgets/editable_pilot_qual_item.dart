import 'package:flutter/material.dart';

import '../models/grade_sheet.dart';

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
                widget.onChanged(_pilotQual);
              },
            ),
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
          ],
        ),
      ],
    );
  }
}
