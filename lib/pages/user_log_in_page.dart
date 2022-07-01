import 'package:app_prototype/models/CurrentUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../models/user.dart';
import '../models/users.dart';

class UserLoginPage extends StatefulWidget {
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";
  bool _logInFail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Login'),
      ),
      body: Center(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.person,
              size: 300,
              //color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(200, 0, 200, 0),
              child: TextFormField(
                validator: MultiValidator([
                  EmailValidator(errorText: "Not a valid email"),
                  RequiredValidator(errorText: "Email is required"),
                ]),
                initialValue: "",
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
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
              padding: EdgeInsets.fromLTRB(200, 20, 200, 0),
              child: TextFormField(
                validator: MinLengthValidator(1,
                    errorText: "Password must be at least 1 characters"),
                initialValue: "",
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
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
                  for (User user in Users().users) {
                    if (user.email == _email && user.password == _password) {
                      setState(() {
                        _logInFail = false;
                      });
                      if (user.permission.index >= Permission.student.index) {
                        Navigator.popAndPushNamed(context, '/home');
                      }
                    } else {
                      setState(() {
                        _logInFail = true;
                      });
                    }
                  }
                },
                child: const Text('Login')),
          ]),
        ),
      ),
    );
  }
}
