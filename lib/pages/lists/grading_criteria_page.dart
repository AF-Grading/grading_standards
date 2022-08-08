import 'package:app_prototype/models/grading_parameter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/grading_criterion.dart';
import '../add_edit/barrel.dart';

class GradingCriteriaPage extends StatelessWidget {
  const GradingCriteriaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Grading Critera"),
            GestureDetector(
              child: const Icon(
                Icons.add,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddEditGradingCriterionPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Consumer<List<GradingCriterion>>(
        builder: (context, stream, _) {
          final myList = stream;
          myList.sort((a, b) => a.id.compareTo(b.id));
          return SingleChildScrollView(
            child: Column(
              children: stream.isEmpty
                  ? [const Text("No Data...")]
                  : stream
                      .map(
                        (criterion) => ListTile(
                          leading: Text("${criterion.id}"),
                          title: Text(criterion.criterion),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEditGradingCriterionPage(
                                gradingCriterion: criterion,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
          );
        },
      ),
    );
  }
}
