import 'package:app_prototype/models/grading_parameter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/grading_criterion.dart';
import '../add_edit/barrel.dart';

class GradingParametersPage extends StatelessWidget {
  const GradingParametersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Grading Parameters"),
            GestureDetector(
              child: const Icon(
                Icons.add,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditGradingParameterPage(
                      gradingCriteria: context.read<List<GradingCriterion>>(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Consumer<List<GradingParameter>>(
        builder: (context, stream, _) =>
            //stream.sort((a, b) => b.startTime.compareTo(a.startTime));
            SingleChildScrollView(
          child: Column(
              children: stream.isEmpty
                  ? [const Text("No Data...")]
                  : stream
                      .map((gradingParam) => ListTile(
                            title: Text(gradingParam.paramName),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddEditGradingParameterPage(
                                  gradingParameter: gradingParam,
                                  gradingCriteria:
                                      context.read<List<GradingCriterion>>(),
                                ),
                              ),
                            ),
                          ))
                      .toList()),
        ),
      ),
    );
  }
}
