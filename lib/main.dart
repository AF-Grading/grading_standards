import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/grade_sheets.dart';
import 'models/current_flight.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => GradeSheets(),
      ),
      ChangeNotifierProvider(
        create: (context) => CurrentFlight(),
      )
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: const HomePage(title: 'Grading Standards!!!!!'),
    );
  }
}
