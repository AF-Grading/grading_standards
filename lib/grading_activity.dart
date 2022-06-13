import 'package:app_prototype/review_grades.dart';
import 'package:flutter/material.dart';

class GradingActivity extends StatefulWidget {
  const GradingActivity({Key? key}) : super(key: key);

  @override
  State<GradingActivity> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GradingActivity> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              "Proficiency Standards Table Popup | Proficiency Grade Description Popup | Duration: 1:12"),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Overall Grade',
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Profile',
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Overall Comments',
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Recommendation/Next',
                ),
              ),
            ),
            Card(
              child: Row(
                children: [
                  const SizedBox(
                    width: 300,
                    child: ListTile(
                        leading: Text("CTS No: 1"),
                        title: Text("Communcation Skills")),
                  ),
                  const SizedBox(width: 150, child: Text("Passing Score: 2")),
                  const Text("Grade: "),
                  DropdownButton(items: null, onChanged: null),
                  const SizedBox(width: 150, child: Text("Comments: ")),
                  const SizedBox(
                    width: 100,
                    child: Icon(Icons.question_mark),
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                children: [
                  const SizedBox(
                    width: 300,
                    child: ListTile(
                        leading: Text("CTS No: 2"),
                        title: Text("Systems Knowledge")),
                  ),
                  const SizedBox(width: 150, child: Text("Passing Score: 2")),
                  const Text("Grade: "),
                  DropdownButton(items: null, onChanged: null),
                  const SizedBox(width: 150, child: Text("Comments: ")),
                  const SizedBox(
                    width: 100,
                    child: Icon(Icons.question_mark),
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                children: [
                  const SizedBox(
                    width: 300,
                    child: ListTile(
                        leading: Text("CTS No: 8"),
                        title: Text("Defensive System Setup")),
                  ),
                  const SizedBox(width: 150, child: Text("Passing Score: 3")),
                  const Text("Grade: "),
                  DropdownButton(items: null, onChanged: null),
                  const SizedBox(width: 150, child: Text("Comments: ")),
                  const SizedBox(
                    width: 100,
                    child: Icon(Icons.question_mark),
                  ),
                ],
              ),
            ),
            const ListTile(
              title: Text("Unused grades"),
              trailing: Icon(Icons.arrow_drop_down_circle_sharp),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ReviewGrades()));
          },
          tooltip: 'Increment',
          child: const Text("Review"),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
