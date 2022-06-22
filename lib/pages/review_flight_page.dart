import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/current_flight.dart';
import '../models/grade_sheet.dart';
import '../widgets/review_grade_sheet_card.dart';
import 'home_page.dart';

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
              for (GradeSheet gradeSheet
                  in context.watch<CurrentFlight>().gradeSheets)
                ReviewGradeSheetCard(gradeSheet: gradeSheet),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO consider double pop and push homepage
          context.read<CurrentFlight>().clear();
          Navigator.popUntil(context, ModalRoute.withName('/'));
          //Navigator.of(context)
          //  .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          /*Navigator.pop(context);
          //Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(title: "Standards!"),
              ));*/
        },
        tooltip: 'Increment',
        child: const Text("Finish"),
      ), // This
    );
  }
}
