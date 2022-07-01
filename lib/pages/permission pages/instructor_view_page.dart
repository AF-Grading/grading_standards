import 'package:flutter/material.dart';

class InstructorViewPage extends StatefulWidget {
  @override
  _InstructorViewPageState createState() => _InstructorViewPageState();
}

class _InstructorViewPageState extends State<InstructorViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructor View'),
      ),
      body: Center(
        child: Text('Instructor View'),
      ),
    );
  }
}