import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/application_state.dart';
import '../models/grade_sheet.dart';
import '../views/all_grade_sheets_view.dart';
import '/pages/add_edit_grade_sheet_page.dart';

class AllGradeSheetsPage extends StatelessWidget {
  const AllGradeSheetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("All Grade Sheets"),
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
        body: const AllGradeSheetsView());
  }
}
