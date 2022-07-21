import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_prototype/models/aws_state.dart';
import 'package:app_prototype/pages/user_log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        child: context.watch<AWSState>().state == CurrentState.confirmSignIn
            ? Column(
                children: [
                  TextFormField(
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
                          print("yay2");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserLoginPage(),
                            ),
                          );
                        } else {
                          print("nay2");
                        }
                      },
                      child: Text("Verify Email"))
                ],
              )
            : Column(children: [
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(label: Text("Email")),
                ),
                TextFormField(
                  controller: _phone,
                  decoration: InputDecoration(label: Text("Phone (9 digits)")),
                ),
                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(label: Text("Password")),
                ),
                TextFormField(
                  controller: _confirmPassword,
                  decoration: InputDecoration(label: Text("Confirm Password")),
                ),
                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });

                      final registerResult =
                          await context.read<AWSState>().register(
                                email: _email.text,
                                password: _password.text,
                                phoneNumber: _phone.text,
                              );

                      setState(() {
                        _isLoading = false;
                      });

                      if (registerResult) {
                        context.read<AWSState>().state =
                            CurrentState.confirmSignIn;
                        print("yay?");
                      } else {
                        print("nay");
                      }
                    },
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text("Sign Up"))
              ]),
      ),
    );
  }
}
