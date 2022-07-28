import 'package:app_prototype/models/ModelProvider.dart';
import 'package:app_prototype/models/aws_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEditCtsItemPage extends StatefulWidget {
  const AddEditCtsItemPage({Key? key}) : super(key: key);

  @override
  State<AddEditCtsItemPage> createState() => _AddEditCtsItemPageState();
}

class _AddEditCtsItemPageState extends State<AddEditCtsItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add/Edit Item")),
      body: Center(child: Text("Implement me!")),
      floatingActionButton: FloatingActionButton(
        child: Text("Finish"),
        onPressed: () {
          context.read<AWSState>().addCtsItem(CTSItem(
                name: "Communication Skills",
                performance:
                    "Effectively expresses thoughts or information. Convey information logically, with explanation, in a professional manner.",
                standards:
                    "Utilizes support aids and briefings to convey information and communicate at recipients' comprehension level(s). Leaves no doubt as to information presented and is clear, concise, listens, interprets, is efficient, and receives feedback. IP Only: Demonstrates an ability to instruct others in an efficient and effective manner.",
                fpc: Grade.INTRODUCTORY,
                fpq: Grade.FAMILIAR,
                mp: Grade.PROFICIENT,
                ip: Grade.PROFICIENT,
              ));
          Navigator.pop(context);
        },
      ),
    );
  }
}
