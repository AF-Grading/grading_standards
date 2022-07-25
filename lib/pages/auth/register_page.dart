import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_prototype/models/aws_state.dart';
import 'package:app_prototype/pages/user_log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _error = "";
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final TextEditingController _confirmEmail = TextEditingController();

  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  // Returns true while awaiting result of register function
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Form(
        key: _registerKey,
        child: context.watch<AWSState>().state == CurrentState.verifyPhone
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text("Confirm Email Address:")),
                  ),
                  Pinput(
                    length: 6,
                    autofocus: true,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    onCompleted: (pin) async {
                      final confirmResult = await context
                          .read<AWSState>()
                          .confirmSignUpPhoneVerification(_email.text, pin);

                      if (confirmResult) {
                        Navigator.pop(context);
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserLoginPage(),
                          ),
                        );*/
                      }

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
                  /*TextFormField(
                    controller: _confirmEmail,
                    decoration: InputDecoration(label: Text("")),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final confirmResult = await context
                            .read<AWSState>()
                            .confirmSignUpPhoneVerification(
                                _email.text, _confirmEmail.text);

                        if (confirmResult) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserLoginPage(),
                            ),
                          );
                        }
                      },
                      child: Text("Verify Email"))*/
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Alter sign up details",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            : Column(children: [
                _error != ""
                    ? Text(
                        _error,
                        style: TextStyle(color: Colors.red),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _email,
                    validator: MultiValidator([
                      EmailValidator(errorText: "Not a valid email"),
                      RequiredValidator(errorText: "Email is required")
                    ]),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: const OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _phone,
                    keyboardType: TextInputType.phone,
                    validator: MultiValidator([
                      MinLengthValidator(9,
                          errorText:
                              'Please type a 9 digit phone number (pattern: XXXXXXXXX)'),
                      RequiredValidator(errorText: "Phone is required")
                    ]),
                    decoration: InputDecoration(
                      label: Text("Phone (9 digits)"),
                      border: const OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _password,
                    obscureText: true,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'password is required'),
                      MinLengthValidator(8,
                          errorText: 'password must be at least 8 digits long'),
                      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                          errorText:
                              'passwords must have at least one special character')
                    ]),
                    decoration: InputDecoration(
                      label: Text("Password"),
                      border: const OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _confirmPassword,
                    obscureText: true,
                    validator: (val) =>
                        MatchValidator(errorText: "Passwords do not match")
                            .validateMatch(val!, _password.text),
                    decoration: InputDecoration(
                      label: Text("Confirm Password"),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          if (this._registerKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });

                            await context.read<AWSState>().register(
                                email: _email.text,
                                password: _password.text,
                                phoneNumber: _phone.text,
                                errorCallback: (e) {
                                  setState(() {
                                    _error = e.message;
                                  });
                                });

                            setState(() {
                              _isLoading = false;
                            });
                          }
                        },
                        child: Text("Sign Up"))
              ]),
      ),
    );
  }
}
