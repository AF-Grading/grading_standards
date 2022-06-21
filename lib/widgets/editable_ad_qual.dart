import 'package:flutter/material.dart';

import '../models/grade_enums.dart';

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
    // changed rotation for readability
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Ad Qualification:"),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text("None"),
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
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text("ldad"),
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
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text("adip"),
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
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text("acad"),
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
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text("cpad"),
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
      ),
    );

    // below is the old column style

    // return Column(
    //   children: [
    //     const Text("Ad Qualification"),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: const [
    //         Text("none"),
    //         Text("ldad"),
    //         Text("adip"),
    //         Text("acad"),
    //         Text("cpad"),
    //       ],
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Radio<AdQual>(
    //           value: AdQual.none,
    //           groupValue: _adQual,
    //           onChanged: (AdQual? value) {
    //             setState(() {
    //               _adQual = value!;
    //             });
    //             widget.onChanged(_adQual);
    //           },
    //         ),
    //         Radio<AdQual>(
    //           value: AdQual.ldad,
    //           groupValue: _adQual,
    //           onChanged: (AdQual? value) {
    //             setState(() {
    //               _adQual = value!;
    //             });
    //             widget.onChanged(_adQual);
    //           },
    //         ),
    //         Radio<AdQual>(
    //           value: AdQual.adid,
    //           groupValue: _adQual,
    //           onChanged: (AdQual? value) {
    //             setState(() {
    //               _adQual = value!;
    //             });
    //             widget.onChanged(_adQual);
    //           },
    //         ),
    //         Radio<AdQual>(
    //           value: AdQual.acad,
    //           groupValue: _adQual,
    //           onChanged: (AdQual? value) {
    //             setState(() {
    //               _adQual = value!;
    //             });
    //             widget.onChanged(_adQual);
    //           },
    //         ),
    //         Radio<AdQual>(
    //           value: AdQual.cpad,
    //           groupValue: _adQual,
    //           onChanged: (AdQual? value) {
    //             setState(() {
    //               _adQual = value!;
    //             });
    //             widget.onChanged(_adQual);
    //           },
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
