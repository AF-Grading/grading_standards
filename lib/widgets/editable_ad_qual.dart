import 'package:flutter/material.dart';

import '../models/grade_sheet.dart';

class EditableADQual extends StatefulWidget {
  const EditableADQual(
      {Key? key, required this.adQual, required this.onChanged})
      : super(key: key);

  final AdQual adQual;
  final ValueChanged<AdQual> onChanged;

  @override
  State<EditableADQual> createState() => _EditableADQualState();
}

class _EditableADQualState extends State<EditableADQual> {
  late AdQual _adQual;

  @override
  void initState() {
    _adQual = widget.adQual;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Ad Qualification"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text("none"),
            Text("ldad"),
            Text("adip"),
            Text("acad"),
            Text("cpad"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Radio<AdQual>(
              value: AdQual.none,
              groupValue: _adQual,
              onChanged: (AdQual? value) {
                setState(() {
                  _adQual = value!;
                });
                widget.onChanged(_adQual);
              },
            ),
            Radio<AdQual>(
              value: AdQual.ldad,
              groupValue: _adQual,
              onChanged: (AdQual? value) {
                setState(() {
                  _adQual = value!;
                });
                widget.onChanged(_adQual);
              },
            ),
            Radio<AdQual>(
              value: AdQual.adid,
              groupValue: _adQual,
              onChanged: (AdQual? value) {
                setState(() {
                  _adQual = value!;
                });
                widget.onChanged(_adQual);
              },
            ),
            Radio<AdQual>(
              value: AdQual.acad,
              groupValue: _adQual,
              onChanged: (AdQual? value) {
                setState(() {
                  _adQual = value!;
                });
                widget.onChanged(_adQual);
              },
            ),
            Radio<AdQual>(
              value: AdQual.cpad,
              groupValue: _adQual,
              onChanged: (AdQual? value) {
                setState(() {
                  _adQual = value!;
                });
                widget.onChanged(_adQual);
              },
            ),
          ],
        ),
      ],
    );
  }
}
