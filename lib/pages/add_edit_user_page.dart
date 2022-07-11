import 'package:app_prototype/models/users.dart';
import 'package:app_prototype/pages/users_page.dart';
import 'package:app_prototype/widgets/rank_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../widgets/permission_form_field.dart';

class AddEditUserPage extends StatefulWidget {
  const AddEditUserPage({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  State<AddEditUserPage> createState() => _AddEditUserPageState();
}

class _AddEditUserPageState extends State<AddEditUserPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late bool _isEditing;

  late final TextEditingController _name =
      TextEditingController(text: widget.user?.name);
  late final TextEditingController _email =
      TextEditingController(text: widget.user?.email);
  late final TextEditingController _squad =
      TextEditingController(text: widget.user?.squad);
  late Permission? _permission = widget.user?.permission;
  late Rank? _rank = widget.user?.rank;

  @override
  void initState() {
    _isEditing = widget.user != null ? true : false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
            title:
                _isEditing ? const Text("Edit User") : const Text("Add User")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _isEditing
                  ? Text(_name.text)
                  : TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        labelText: "Name",
                      ),
                      validator: (value) {
                        if (value == null) {
                          return "Please enter a name";
                        }
                        return null;
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
                validator: (value) {
                  if (value == null) {
                    return "Please enter an Email";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _squad,
                decoration: const InputDecoration(
                  labelText: "Squadron",
                ),
                validator: (value) {
                  if (value == null) {
                    return "Please enter a Squadron";
                  }
                  return null;
                },
              ),
            ),
            RankFormField(
              initialValue: _rank,
              validator: (value) {
                if (value == null) {
                  return "Please select a value";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _rank = value;
                });
              },
            ),
            PermissionFormField(
              initialValue: _permission,
              validator: (value) {
                if (value == null) {
                  return "Please select a value";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _permission = value;
                });
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              String id = context.read<Users>().updateById(
                    User(
                      id: widget.user?.id,
                      name: _name.text,
                      rank: _rank!,
                      squad: _squad.text,
                      email: _email.text,
                      permission: _permission,
                      password: widget.user?.password,
                    ),
                  );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("User Updated"),
                ),
              );
              Navigator.pop(context);
              /*Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UsersPage(
                      users: context
                          .read<GradeSheets>()
                          .gradeSheets
                          .firstWhere((sheet) => sheet.id == id),
                    ),
                  ),
                );*/
            }
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
