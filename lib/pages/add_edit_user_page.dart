import 'package:app_prototype/models/user_setting.dart';
import 'package:app_prototype/models/users.dart';
import 'package:app_prototype/widgets/rank_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/application_state.dart';
import '../models/grade_enums.dart';
import '../models/user.dart';
import '../widgets/ad_qual_form_field.dart';
import '../widgets/form_fields/barrel.dart';
import '../widgets/permission_form_field.dart';
import '../widgets/pilot_qual_form_field.dart';

class AddEditUserPage extends StatefulWidget {
  const AddEditUserPage({Key? key, this.user}) : super(key: key);

  final UserSetting? user;

  @override
  State<AddEditUserPage> createState() => _AddEditUserPageState();
}

class _AddEditUserPageState extends State<AddEditUserPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double _spaceBetween = 150;

  late bool _isEditing;

  // gathers errors from the database response
  String _error = "";
  String? _validator(String? value) {
    if (value == "") {
      return "Please type an email";
    }
    if (_error != "") {
      return _error;
    }
    return null;
  }

  late final TextEditingController _name =
      TextEditingController(text: widget.user?.name);
  late final TextEditingController _email =
      TextEditingController(text: widget.user?.email);
  late String? _squad = widget.user?.squad ?? null;
  late Permission? _permission = widget.user?.permission;
  late Rank? _rank = widget.user?.rank;
  late AdQual? _adQual = widget.user?.adQual;
  late PilotQual? _pilotQual = widget.user?.pilotQual;

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: _spaceBetween, child: const Text("Name: ")),
                    Flexible(
                      child: TextFormField(
                        controller: _name,
                        validator: (value) {
                          if (value == "") {
                            return "Please enter a name";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _isEditing
                    ? Row(
                        children: [
                          SizedBox(
                              width: _spaceBetween, child: Text("Email: ")),
                          Text(_email.text),
                        ],
                      )
                    : Row(
                        children: [
                          SizedBox(
                              width: _spaceBetween,
                              child: const Text("Email: ")),
                          Flexible(
                            child: TextFormField(
                              controller: _email,
                              decoration: const InputDecoration(
                                labelText: "Email",
                              ),
                              validator: _validator,
                              onChanged: (_) {
                                // get rid of any db errors after the user starts
                                // altering this text
                                setState(() {
                                  _error = "";
                                });
                              },
                            ),
                          ),
                        ],
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: _spaceBetween,
                      child: const Text("Squadron: "),
                    ),
                    SquadronFormField(
                        initialValue: _squad,
                        validator: (value) {
                          if (value == null) {
                            return "Please select a value";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _squad = value;
                          });
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: _spaceBetween, child: const Text("Rank: ")),
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                        width: _spaceBetween,
                        child: const Text("Airdrop Qualification: ")),
                    AdQualFormField(
                      initialValue: _adQual,
                      validator: (value) {
                        if (value == null) {
                          return "Please select a value";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _adQual = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                        width: _spaceBetween,
                        child: const Text("Pilot Qualification: ")),
                    PilotQualFormField(
                      initialValue: _pilotQual,
                      validator: (value) {
                        if (value == null) {
                          return "Please select a value";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _pilotQual = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                        width: _spaceBetween,
                        child: const Text("Permissions: ")),
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              // if adding a new user, verify the email does not already exist
              if (!_isEditing) {
                /* var code = context
                    .read<ApplicationState>()
                    .register(_email.text, "password", (e) {});
                if (await code == "") { */
                /*String id = context.read<Users>().updateById(
                        User(
                          //id: widget.user?.id,
                          name: _name.text,
                          rank: _rank!,
                          squad: _squad.text,
                          email: _email.text,
                          permission: _permission,
                          password: widget.user?.password,
                        ),
                      );*/
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("User Added"),
                  ),
                );
                context.read<ApplicationState>().addUserSetting(UserSetting(
                      name: _name.text,
                      rank: _rank!,
                      squad: _squad!,
                      email: _email.text,
                      adQual: _adQual!,
                      pilotQual: _pilotQual!,
                      permission: _permission,
                    ));
                Navigator.pop(context);
                /* } else {
                  setState(() {
                    code.then((value) {
                      _error = value;
                      // revalidate the form
                      _formKey.currentState!.validate();
                    });
                  });
                } */
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("User Edited"),
                  ),
                );
                context.read<ApplicationState>().editUserSetting(UserSetting(
                      name: _name.text,
                      rank: _rank!,
                      squad: _squad!,
                      email: _email.text,
                      adQual: _adQual!,
                      pilotQual: _pilotQual!,
                      permission: _permission,
                    ));
                Navigator.pop(context);
              }
            }
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
