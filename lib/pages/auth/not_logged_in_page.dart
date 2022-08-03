import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

import '../../models/application_state.dart';

class NotLoggedInPage extends StatelessWidget {
  const NotLoggedInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Not Logged In")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: const Text(
                    "No User found. Please inform the higher office of your email address and an account will be made for you.")),
            ElevatedButton(
                onPressed: () {
                  context.read<ApplicationState>().signOut();
                  Phoenix.rebirth(context);
                },
                child: Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
