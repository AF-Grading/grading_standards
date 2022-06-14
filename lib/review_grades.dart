import 'package:flutter/material.dart';

import 'models/cts_list.dart';

// will probably not use this class
// instead favoring the edit_grade_sheet_page
class ReviewGrades extends StatelessWidget {
  const ReviewGrades({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Grade Sheet"),
      ),
      body: Column(
        children: [
          const Text("Student Name: John Doe"),
          SizedBox(
            height: 300,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: ctsItems.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                    width: 200,
                    child: ListTile(
                        title: Text(ctsItems[index].name),
                        leading:
                            Text(ctsItems[index].passingScore.toString())));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ReviewGrades()));
        },
        tooltip: 'Increment',
        child: const Text("Finish"),
      ), // This
    );
  }
}
