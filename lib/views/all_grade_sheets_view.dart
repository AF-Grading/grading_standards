import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade_sheet.dart';
import '../widgets/grade_sheet_list_tile.dart';

class AllGradeSheetsView extends StatelessWidget {
  const AllGradeSheetsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<GradeSheet>>(builder: (context, stream, _) {
      //stream.sort((a, b) => b.startTime.compareTo(a.startTime));
      return SingleChildScrollView(
        child: Column(
            children: stream.isEmpty
                ? [const Text("No Data...")]
                : stream
                    .map((gradeSheet) =>
                        GradeSheetListTile(gradeSheet: gradeSheet))
                    .toList()),
      );
    });
  }
}
