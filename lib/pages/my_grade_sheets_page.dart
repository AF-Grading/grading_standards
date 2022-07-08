import 'package:flutter/material.dart';

import '/pages/add_edit_grade_sheet_page.dart';
import '/views/grade_sheets_view.dart';

class MyGradeSheetsPage extends StatelessWidget {
  const MyGradeSheetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("My Grade Sheets"),
              GestureDetector(
                child: const Icon(
                  Icons.add,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddEditGradeSheetPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: const GradeSheetsView(
          isInstructor: true,
        ));
  }
}
