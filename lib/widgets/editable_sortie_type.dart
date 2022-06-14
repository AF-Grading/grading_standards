import 'package:app_prototype/models/grade_sheet.dart';
import 'package:flutter/material.dart';

class EditableSortieType extends StatefulWidget {
  const EditableSortieType({Key? key, required this.sortieType})
      : super(key: key);

  final SortieType sortieType;

  @override
  State<EditableSortieType> createState() => _EditableSortieTypeState();
}

class _EditableSortieTypeState extends State<EditableSortieType> {
  SortieType _sortieType = SortieType.local;

  @override
  void initState() {
    _sortieType = widget.sortieType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Sortie Type"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text("local"),
            Text("ims"),
            Text("mission"),
            Text("ost"),
            Text("instmtSim"),
            Text("mmp"),
            Text("lfe"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Radio<SortieType>(
              value: SortieType.local,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
              },
            ),
            Radio<SortieType>(
              value: SortieType.ims,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
              },
            ),
            Radio<SortieType>(
              value: SortieType.mission,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
              },
            ),
            Radio<SortieType>(
              value: SortieType.ost,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
              },
            ),
            Radio<SortieType>(
              value: SortieType.instmtSim,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
              },
            ),
            Radio<SortieType>(
              value: SortieType.mmp,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
              },
            ),
            Radio<SortieType>(
              value: SortieType.lfe,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
