import 'package:app_prototype/models/CurrentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/grade_sheet.dart';
import '../models/user.dart';
import '../models/users.dart';
import '../widgets/search_users_form_field.dart';

class AddEditGradeSheetPage extends StatefulWidget {
  const AddEditGradeSheetPage({Key? key, this.gradeSheet, this.instructor})
      : super(key: key);

  final GradeSheet? gradeSheet;
  final User? instructor;
  @override
  State<AddEditGradeSheetPage> createState() => _AddEditGradeSheetPageState();
}

class _AddEditGradeSheetPageState extends State<AddEditGradeSheetPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  User? _student;
  late User? _instructor;

  @override
  void initState() {
    _instructor = widget.instructor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add/Edit"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: const Text("Overall"),
                  children: [
                    _student != null
                        ? Row(
                            children: [
                              Text(_student!.name),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _student = null;
                                    });
                                  },
                                  child: const Text("Reselect"))
                            ],
                          )
                        : SearchUsersFormField(
                            labelText: "Student Name",
                            users: context.watch<Users>().users,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please select a student from dropdown";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (student) {
                              setState(() {
                                _student = context
                                    .read<Users>()
                                    .users
                                    .firstWhere((user) => user.name == student);
                              });
                            },
                          ),
                    //context.watch<CurrentUser>().user.permission.index > 2
                    _instructor != null
                        ? Row(
                            children: [
                              Text(_instructor!.name),
                              // only certain permissions can select an instructor that isnt themselves
                              context.watch<CurrentUser>().permission.index > 2
                                  ? ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _instructor = null;
                                        });
                                      },
                                      child: const Text("Reselect"))
                                  : Container(),
                            ],
                          )
                        : SearchUsersFormField(
                            labelText: "Instructor Name",
                            users: context.watch<Users>().users,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please select an instructor from dropdown";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (instructor) {
                              setState(() {
                                _instructor = context
                                    .read<Users>()
                                    .users
                                    .firstWhere(
                                        (user) => user.name == instructor);
                              });
                            },
                          ),
                  ],
                ),
              ),
              Card(
                child: ExpansionTile(
                  title: Text("Grade Items"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
