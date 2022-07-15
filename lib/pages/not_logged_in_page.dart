import 'package:flutter/material.dart';

class NotLoggedInPage extends StatelessWidget {
  const NotLoggedInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Not Logged In")),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: const Text("Go To Login"),
      )),
    );
  }
}
