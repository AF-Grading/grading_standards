import 'package:flutter/material.dart';

// error thrown when using the name 'ReferenceMaterialsPage'
// perhaps class exists elsewhere?
class ReferenceMaterialsPages extends StatelessWidget {
  const ReferenceMaterialsPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ref"),
      ),
      body: const Center(
        child: Text("Reference Materials Page"),
      ),
    );
  }
}
