import 'package:app_prototype/models/application_state.dart';
import 'package:app_prototype/models/grade_enums.dart';
import 'package:app_prototype/models/user.dart';
import 'package:app_prototype/models/user_setting.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
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
        child: Column(children: [
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

                      String e = await context
                          .read<ApplicationState>()
                          .register(_email.text, _password.text, (e) {
                        setState(() {
                          _error = e.code;
                        });
                      });

                      if (e.isEmpty) {
                        /* context.read<ApplicationState>().addUserSetting(
                            UserSetting(
                                name: "Test User",
                                rank: Rank.secondLt,
                                squad: "4th Airlift Squad",
                                email: _email.text,
                                adQual: AdQual.cpad,
                                pilotQual: PilotQual.fpq,
                                permission: Permission.wing_training)); */
                        Navigator.pop(context);
                      }

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
