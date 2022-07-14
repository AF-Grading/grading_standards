import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../models/application_state.dart';
import '../../models/grade_sheet.dart';
import '../../models/grade_sheets.dart';

class SyncButton extends StatelessWidget {
  const SyncButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var drafts = context.read<GradeSheets>().drafts;
        for (GradeSheet sheet in drafts) {
          context.read<ApplicationState>().addGradeSheet(sheet);
        }
      },
      child: const Icon(Icons.sync),
    );
  }
}
