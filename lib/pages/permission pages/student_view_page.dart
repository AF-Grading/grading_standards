import 'package:flutter/material.dart';

class StudentViewPage extends StatefulWidget {
  @override
  _StudentViewPageState createState() => _StudentViewPageState();
}

class _StudentViewPageState extends State<StudentViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student View'),
      ),
      body: Center(
        child: Text('Student View'),
      ),
    );
  }
}