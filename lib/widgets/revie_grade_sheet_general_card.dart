import 'package:flutter/material.dart';

class ReviewGradeSheetGeneralCard extends StatelessWidget {
  const ReviewGradeSheetGeneralCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text("General"),
        initiallyExpanded: true,
        children: [],
      ),
    );
  }
}
