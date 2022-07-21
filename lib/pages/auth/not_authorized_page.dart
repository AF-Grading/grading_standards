import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/aws_state.dart';

class NotAuthorizedPage extends StatelessWidget {
  const NotAuthorizedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Not Authorized. Contact your higher office or IT services to finish activating the account."),
            ElevatedButton(
                onPressed: () {
                  context.read<AWSState>().signOut();
                },
                child: Text("Log Out"))
          ],
        ),
      )),
    );
  }
}
