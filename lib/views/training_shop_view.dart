import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade_sheets.dart';
import '../pages/training_shop_page.dart';

// TODO obtain from elsewhere
List<String> squads = [
  "62nd Operations Group",
  "4th Airlift Squadron",
  "7th Airlift Squadron",
  "8th Airlift Squadron"
];

class TrainingShopView extends StatelessWidget {
  const TrainingShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: squads.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Center(child: Text(squads[index])),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingShopPage(
                      squad: squads[index],
                      // pass the gradeSheets that this user is a student of
                      gradeSheets: context.watch<GradeSheets>().gradeSheets),
                ),
              );
            },
          );
        });
  }
}
