import 'package:app_prototype/models/grade_sheet.dart';
import 'package:app_prototype/widgets/spaced_item.dart';
import 'package:flutter/material.dart';

import '../widgets/slivers/sliver_title_bar.dart';

class FlightView2 extends StatefulWidget {
  const FlightView2({Key? key, required this.gradeSheet, required this.params})
      : super(key: key);

  final GradeSheet gradeSheet;
  final String params;

  @override
  State<FlightView2> createState() => _FlightView2State();
}

class _FlightView2State extends State<FlightView2>
    with AutomaticKeepAliveClientMixin {
  bool _overallError = false;
  bool _gradesError = false;

  final TextEditingController _overall = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverTitleBar(
          "Overall",
          hasErrors: _overallError,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SpacedItem(
                name: "Overall Comments",
                child: TextFormField(
                  controller: _overall,
                  validator: (value) {
                    if (value == null) {
                      _overallError = true;
                      return "Please type a comment";
                    }
                    //context.read<Cu
                    return null;
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
