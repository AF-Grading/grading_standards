import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/users.dart';

class UserLoginPage extends StatefulWidget {
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  String _email = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Login'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.person,
          size: 300,
          //color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(200, 0, 200, 0),
          child: TextFormField(
            initialValue: "",
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white),
            ),
            //style: TextStyle(color: Colors.white),
            onChanged: (value) {
              _email = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(200, 0, 200, 0),
          child: TextFormField(
            initialValue: "",
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.white),
            ),
            //style: TextStyle(color: Colors.white),
            onChanged: (value) {
              _password = value;
            },
          ),
        ),
        TextButton(
            onPressed: () {
              for (User user in Users().users) {
                if (user.email == _email && user.password == _password) {
                  if (user.permission == Permission.wing_training) {
                    Navigator.pushNamed(context, '/wing_training');
                  } else if (user.permission == Permission.training_shop) {
                    Navigator.pushNamed(context, '/training_shop');
                  } else if (user.permission == Permission.instructor) {
                    Navigator.pushNamed(context, '/instructor');
                  } else if (user.permission == Permission.student) {
                    Navigator.pushNamed(context, '/student');
                  }
                  // Navigator.pushNamed(context, '/home');
                }
              }
              // print("password: $_password");
            },
            child: const Text('Login')),
      ]),
    );
  }
}
