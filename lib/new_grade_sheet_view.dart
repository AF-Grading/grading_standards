import 'package:app_prototype/models/cts_list.dart';
import 'package:flutter/material.dart';

class NewGradeSheetView extends StatelessWidget {
  const NewGradeSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            const Text("Student Name:"),
            const Icon(Icons.search),
            SizedBox(
              width: 200,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter a name or ID',
                ),
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Text("Preselect Grading Paramaters:"),
            SizedBox(
              width: 200,
              child: ListTile(
                title: const Text("Free Select"),
                leading: Radio(
                  onChanged: null,
                  groupValue: null,
                  value: null,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ListTile(
                title: const Text("All"),
                leading: Radio(
                  onChanged: null,
                  groupValue: null,
                  value: null,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ListTile(
                title: const Text("Formation and Airdrop"),
                leading: Radio(
                  onChanged: null,
                  groupValue: null,
                  value: null,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 300,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 6,
            ),
            itemCount: gradeItems.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                  width: 200,
                  height: 100,
                  child: ListTile(
                      title: Text(gradeItems[index].name),
                      leading: const Checkbox(value: false, onChanged: null)));
            },
          ),
        ),
        const Text("Pilot Qualifications:"),
        const Text("Weather:"),
        const Text("Day/Night:"),
        const Text("Sortie Type:")
      ],
    );
  }
}
