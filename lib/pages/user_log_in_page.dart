import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../models/application_state.dart';
import '../models/user.dart';
import '../models/users.dart';
import '/models/CurrentUser.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";
  bool _logInFail = false;
  String _error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Login'),
      ),
      // Single Child Scroll View allows the keyboard to not overflow
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                Icons.person,
                size: 300,
                //color: Colors.white,
              ),
              _error == ""
                  ? Container()
                  : Text(
                      _error,
                      style: const TextStyle(color: Colors.red),
                    ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator: MultiValidator([
                    EmailValidator(errorText: "Not a valid email"),
                    RequiredValidator(errorText: "Email is required"),
                  ]),
                  initialValue: "",
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: const OutlineInputBorder(),
                    errorText:
                        _logInFail ? "Email or password is incorrect" : null,
                    // labelStyle: TextStyle(color: Colors.white),
                  ),
                  //style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    _email = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator: MinLengthValidator(1,
                      errorText: "Password must be at least 1 characters"),
                  initialValue: "",
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    errorText:
                        _logInFail ? "Email or password is incorrect" : null,
                    //labelStyle: TextStyle(color: Colors.white),
                  ),
                  //style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    _password = value;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // Firebase Auth
                    context
                        .read<ApplicationState>()
                        .signInWithEmailAndPassword(_email, _password, (e) {
                      setState(() {
                        _error = "Unable to login";
                      });
                    }).then(
                      (value) {
                        if (_error == "") {
                          for (User user in Users().users) {
                            if (user.email == _email &&
                                user.password == _password) {
                              setState(() {
                                _logInFail = false;
                              });

                              CurrentUser().setUser = user;

                              context.read<CurrentUser>().setUser = user;

                              if (user.permission.index >=
                                  Permission.student.index) {
                                Navigator.popAndPushNamed(context, '/home');
                              }
                            } else {
                              setState(() {
                                _logInFail = true;
                              });
                            }
                          }
                        }
                      },
                    );
                  },
                  child: const Text('Login')),
            ]),
          ),
        ),
      ),
    );
  }
}
