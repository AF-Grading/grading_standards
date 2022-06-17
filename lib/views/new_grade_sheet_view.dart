import 'package:app_prototype/models/cts_list.dart';
import 'package:flutter/material.dart';

class NewGradeSheetView extends StatelessWidget {
  const NewGradeSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // change this part into a scrollable content
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
            const Text("Add another student..."),
          ],
        ),
        Row(
          children: const [
            Text("Pre-select Grading Paramaters:"),
            SizedBox(
              width: 200,
              child: ListTile(
                title: Text("Free Select"),
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
                title: Text("All"),
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
                title: Text("Formation and Airdrop"),
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
          height: 400,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 4,
              // changed the size of child aspect ratio to 4 so we can see the titles clearly
              // we still need to change it so the box aligns neatly though
            ),
            itemCount: ctsItems.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                  width: 200,
                  height: 200,
                  child: SizedBox(
                      width: 50,
                      height: 200,
                      child: ListTile(
                          title: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                            ),
                            onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(ctsItems[index].name),
                                content: Text(ctsItems[index].standards),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () => Navigator.pop(
                                          context, 'Back to grading'),
                                      child: const Text("Back to grading"))
                                ],
                              ),
                            ),
                            child: Text(ctsItems[index].name),
                          ),
                          leading:
                              const Checkbox(value: false, onChanged: null))));
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
