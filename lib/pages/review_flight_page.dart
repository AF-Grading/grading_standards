import 'package:app_prototype/pages/home_page_old.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/application_state.dart';
import '../models/current_flight.dart';
import '../models/grade_sheet.dart';
import '../models/grade_sheets.dart';
import '../theme/light_mode.dart';
import '../widgets/revie_grade_sheet_general_card.dart';
import '../widgets/review_grade_sheet_card.dart';

class ReviewFlightPage extends StatelessWidget {
  const ReviewFlightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Flight"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: context.read<CurrentFlight>().reviewKey,
          child: Column(
            children: [
              ReviewGradeSheetGeneralCard(),
              for (GradeSheet gradeSheet
                  in context.watch<CurrentFlight>().gradeSheets)
                ReviewGradeSheetCard(
                  gradeSheet: gradeSheet,
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (context
              .read<CurrentFlight>()
              .reviewKey
              .currentState!
              .validate()) {
            context.read<CurrentFlight>().updateAll();
            for (GradeSheet sheet
                in context.read<CurrentFlight>().gradeSheets) {
              context.read<GradeSheets>().addSheet(sheet);
              context.read<ApplicationState>().addGradeSheet(sheet);
            }
            // gets rid of all the flight pages and pushes the home page
            // TODO throws an error: popped
            context.read<CurrentFlight>().clear();

            Navigator.popUntil(
              context,
              ModalRoute.withName('/'),
            );
          }
        },
        //tooltip: 'Increment',
        child: const Text("Finish"),
      ),
    );
  }
}
