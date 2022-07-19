import 'package:app_prototype/pages/phone_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../models/application_state.dart';
import '../models/user.dart';
import '../models/current_user.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = "";
  String _password = "";
  bool _logInFail = false;
  String? _error = "";
  String? _validator(String? value) {
    if (value == "") {
      return "Please type an email";
    }
    if (_error != "") {
      return _error;
    }
    return null;
  }

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
            key: _formKey,
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
                      _error!,
                      style: const TextStyle(color: Colors.red),
                    ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  validator:
                      _validator /*MultiValidator([
                    EmailValidator(errorText: "Not a valid email"),
                    RequiredValidator(errorText: "Email is required"),
                  ])*/
                  ,
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
                  onPressed: () async {
                    // Firebase Auth
                    Future<bool> withoutErrors = context
                        .read<ApplicationState>()
                        .signInWithEmailAndPassword(_email, _password, (e) {
                      setState(() {
                        //_error
                        _error = e.message;
                      });
                    });
                    if (await withoutErrors) {
                      context
                          .read<ApplicationState>()
                          .fetchCurrentUserSettings(_email)
                          .then((value) =>
                              context.read<CurrentUser>().userSetting = value)
                          .then(
                        (value) {
                          if (value.permission.index >=
                              Permission.student.index) {
                            //TODO bring it back
                            //Navigator.popAndPushNamed(context, '/home');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PhoneVerificationPage(),
                              ),
                            );
                          } else {
                            setState(() {
                              _logInFail = true;
                            });
                          }

                          /*for (User user in Users().users) {
                            if (user.email == _email &&
                                user.password == _password) {
                              setState(() {
                                _logInFail = false;
                              });

                              CurrentUser().setUser = user;

                              context.read<CurrentUser>().setUser = user;*/

                          // }
                          // }
                        },
                      );
                    } else {
                      _formKey.currentState!.validate();
                    }
                  },
                  child: const Text('Login')),
            ]),
          ),
        ),
      ),
    );
  }
}
