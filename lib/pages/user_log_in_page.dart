import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_prototype/models/aws_state.dart';
import 'package:app_prototype/pages/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../models/User.dart';
import '../models/application_state.dart';
import '../models/grade_enums.dart';
//import '../models/user.dart';
import '../models/users.dart';
import '../models/current_user.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
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
              child: context.watch<AWSState>().state ==
                      CurrentState.confirmSignIn
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                              "A verification text has been sent to the phone number on file."),
                        ),
                        Pinput(
                          length: 6,
                          autofocus: true,
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          onCompleted: (pin) async {
                            final res = await context
                                .read<AWSState>()
                                .confirmSignInPhoneVerification(pin);

                            /*bool withoutErrors = await context
                                .read<ApplicationState>()
                                .signInWithEmailAndPassword(
                                    _email.text, _password.text, (e) {
                              setState(() {
                                //_error
                                _error = e.message;
                              });
                            });*/
                            /*if (res) {
                              await Amplify.DataStore.observeQuery(
                                      User.classType)
                                  .listen((QuerySnapshot<User> snapshot) {
                                context.read<CurrentUser>().setUser = snapshot
                                    .items
                                    .firstWhere((user) => user.email == _email);
                                context.read<AWSState>().state =
                                    CurrentState.loggedIn;
                              });
                            } else {
                              _formKey.currentState!.validate();
                            }*/
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<AWSState>()
                                .signInWithPhoneVerification(
                                    _email.text, _password.text, (e) {
                              setState(() {
                                _error = e.message;
                              });
                            });
                          },
                          child: Text(
                            "Resend Code",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                              validator: MultiValidator([
                                EmailValidator(errorText: "Not a valid email"),
                                RequiredValidator(
                                    errorText: "Email is required"),
                              ]),
                              controller: _email,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: const OutlineInputBorder(),
                                errorText: _logInFail
                                    ? "Email or password is incorrect"
                                    : null,
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextFormField(
                              controller: _password,
                              validator: MinLengthValidator(6,
                                  errorText:
                                      "Password must be at least 6 characters"),
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: const OutlineInputBorder(),
                                errorText: _logInFail
                                    ? "Email or password is incorrect"
                                    : null,
                              ),
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () async {
                                    final signInSuccess = await context
                                        .read<AWSState>()
                                        .signInWithPhoneVerification(
                                            _email.text, _password.text, (e) {
                                      setState(() {
                                        _error = e.message;
                                      });
                                    });

                                    if (signInSuccess) {
                                      context.read<AWSState>().state =
                                          CurrentState.confirmSignIn;
                                    }
                                  },
                                  child: const Text('Login')),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Or sign up",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ])),
        ),
      ),
    );
  }
}
