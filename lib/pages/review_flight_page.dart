import 'package:app_prototype/pages/home_page_old.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/application_state.dart';
import '../models/current_flight.dart';
import '../models/grade_enums.dart';
import '../models/grade_sheet.dart';
import '../models/grade_sheets.dart';
import '../models/user.dart';
import '../models/user_setting.dart';
import '../theme/light_mode.dart';
import '../widgets/revie_grade_sheet_general_card.dart';
import '../widgets/review_grade_sheet_card.dart';

class ReviewFlightPage extends StatelessWidget {
  const ReviewFlightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool keyBoardIsOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final gradeSheets = context.watch<CurrentFlight>().gradeSheets;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Flight"),
      ),
      body: Form(
        key: context.read<CurrentFlight>().reviewKey,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).canvasColor,
              // Removes the back button
              automaticallyImplyLeading: false,
              // Keeps the text at the Top of the screen
              pinned: true,
              elevation: 0,
              title: Text("General",
                  style: TextStyle(color: Theme.of(context).primaryColorDark)),
            ),
            SliverToBoxAdapter(
              child: ReviewGradeSheetGeneralCard(),
            ),
            /*SliverAppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              // Removes the back button
              automaticallyImplyLeading: false,
              // Keeps the text at the Top of the screen
              pinned: true,
              elevation: 0,
              expandedHeight: 80,
              title: Text(context
                  .watch<List<UserSetting>>()
                  .firstWhere((user) =>
                      user.email ==
                      context.watch<CurrentFlight>().gradeSheets[0].studentId)
                  .name),
            ),
            SliverToBoxAdapter(
              child: ReviewGradeSheetCard(
                gradeSheet: gradeSheets[0],
              ),
            ),
            gradeSheets.length > 1
                ? SliverAppBar(
                    backgroundColor: Theme.of(context).backgroundColor,
                    // Removes the back button
                    automaticallyImplyLeading: false,
                    // Keeps the text at the Top of the screen
                    pinned: true,
                    elevation: 0,
                    expandedHeight: 80,
                    title: Text(context
                        .watch<List<UserSetting>>()
                        .firstWhere((user) =>
                            user.email ==
                            context
                                .watch<CurrentFlight>()
                                .gradeSheets[1]
                                .studentId)
                        .name),
                  )
                : SliverToBoxAdapter(),*/
            for (GradeSheet gradeSheet
                in context.watch<CurrentFlight>().gradeSheets) ...[
              SliverAppBar(
                backgroundColor: Theme.of(context).canvasColor,
                // Removes the back button
                automaticallyImplyLeading: false,
                // Keeps the text at the Top of the screen
                pinned: true,
                elevation: 0,
                title: Text(
                    context
                        .watch<List<UserSetting>>()
                        .firstWhere(
                            (user) => user.email == gradeSheet.studentId,
                            orElse: () => UserSetting(
                                name: "f",
                                rank: Rank.capt,
                                squad: "squad",
                                email: "email",
                                adQual: AdQual.acad,
                                pilotQual: PilotQual.fpc))
                        .name,
                    style:
                        TextStyle(color: Theme.of(context).primaryColorDark)),
              ),
              SliverToBoxAdapter(
                  child: ReviewGradeSheetCard(
                gradeSheet: gradeSheet,
              )),
            ],
            // Space for the RaisedButton
            SliverToBoxAdapter(
                child: SizedBox(
              height: 100,
            ))
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: !keyBoardIsOpen,
        child: FloatingActionButton(
          onPressed: () {
            if (context
                .read<CurrentFlight>()
                .reviewKey
                .currentState!
                .validate()) {
              context.read<CurrentFlight>().updateAll();
              for (GradeSheet sheet
                  in context.read<CurrentFlight>().gradeSheets) {
                context.read<GradeSheets>().addSheet(sheet);
                // TODO if no internet, make sure sheet is draft and dont add
                context.read<ApplicationState>().addGradeSheet(sheet);
              }
              context.read<CurrentFlight>().clear();
              // gets rid of all the flight pages and pushes the home page
              Navigator.popUntil(
                context,
                ModalRoute.withName('/'),
              );
            }
          },
          //tooltip: 'Increment',
          child: const Text("Finish"),
        ),
      ),
    );
  }
}
