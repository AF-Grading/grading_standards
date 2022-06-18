import 'package:app_prototype/models/grade_sheet.dart';
import 'package:flutter/material.dart';

class EditableSortieType extends StatefulWidget {
  const EditableSortieType(
      {Key? key, required this.sortieType, required this.onChanged})
      : super(key: key);

  final SortieType sortieType;
  final ValueChanged<SortieType> onChanged;

  @override
  State<EditableSortieType> createState() => _EditableSortieTypeState();
}

class _EditableSortieTypeState extends State<EditableSortieType> {
  late SortieType _sortieType;

  @override
  void initState() {
    _sortieType = widget.sortieType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // changed rotation for readability
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text("Ad Qualification:"),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text("local"),
            Radio<SortieType>(
              value: SortieType.local,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
                widget.onChanged(_sortieType);
              },
            ),
          ],
        ),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text("ima"),
            Radio<SortieType>(
              value: SortieType.ims,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
                widget.onChanged(_sortieType);
              },
            ),
          ],
        ),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text("mission"),
            Radio<SortieType>(
              value: SortieType.mission,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
                widget.onChanged(_sortieType);
              },
            ),
          ],
        ),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text("ost"),
            Radio<SortieType>(
              value: SortieType.ost,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
                widget.onChanged(_sortieType);
              },
            ),
          ],
        ),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text("instmtSim"),
            Radio<SortieType>(
              value: SortieType.instmtSim,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
                widget.onChanged(_sortieType);
              },
            ),
          ],
        ),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text("mmp"),
            Radio<SortieType>(
              value: SortieType.mmp,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
                widget.onChanged(_sortieType);
              },
            ),
          ],
        ),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text("lfe"),
            Radio<SortieType>(
              value: SortieType.lfe,
              groupValue: _sortieType,
              onChanged: (SortieType? value) {
                setState(() {
                  _sortieType = value!;
                });
                widget.onChanged(_sortieType);
              },
            ),
          ],
        ),
      ]),
    );

    // Below is the old column version

    // return Column(
    //   children: [
    //     const Text("Sortie Type"),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: const [
    //         Text("local"),
    //         Text("ims"),
    //         Text("mission"),
    //         Text("ost"),
    //         Text("instmtSim"),
    //         Text("mmp"),
    //         Text("lfe"),
    //       ],
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Radio<SortieType>(
    //           value: SortieType.local,
    //           groupValue: _sortieType,
    //           onChanged: (SortieType? value) {
    //             setState(() {
    //               _sortieType = value!;
    //             });
    //             widget.onChanged(_sortieType);
    //           },
    //         ),
    //         Radio<SortieType>(
    //           value: SortieType.ims,
    //           groupValue: _sortieType,
    //           onChanged: (SortieType? value) {
    //             setState(() {
    //               _sortieType = value!;
    //             });
    //             widget.onChanged(_sortieType);
    //           },
    //         ),
    //         Radio<SortieType>(
    //           value: SortieType.mission,
    //           groupValue: _sortieType,
    //           onChanged: (SortieType? value) {
    //             setState(() {
    //               _sortieType = value!;
    //             });
    //             widget.onChanged(_sortieType);
    //           },
    //         ),
    //         Radio<SortieType>(
    //           value: SortieType.ost,
    //           groupValue: _sortieType,
    //           onChanged: (SortieType? value) {
    //             setState(() {
    //               _sortieType = value!;
    //             });
    //             widget.onChanged(_sortieType);
    //           },
    //         ),
    //         Radio<SortieType>(
    //           value: SortieType.instmtSim,
    //           groupValue: _sortieType,
    //           onChanged: (SortieType? value) {
    //             setState(() {
    //               _sortieType = value!;
    //             });
    //             widget.onChanged(_sortieType);
    //           },
    //         ),
    //         Radio<SortieType>(
    //           value: SortieType.mmp,
    //           groupValue: _sortieType,
    //           onChanged: (SortieType? value) {
    //             setState(() {
    //               _sortieType = value!;
    //             });
    //             widget.onChanged(_sortieType);
    //           },
    //         ),
    //         Radio<SortieType>(
    //           value: SortieType.lfe,
    //           groupValue: _sortieType,
    //           onChanged: (SortieType? value) {
    //             setState(() {
    //               _sortieType = value!;
    //             });
    //             widget.onChanged(_sortieType);
    //           },
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
