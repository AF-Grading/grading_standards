import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/grade_sheets.dart';
import 'models/current_flight.dart';
import 'models/theme_change.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => GradeSheets(),
      ),
      ChangeNotifierProvider(
        create: (context) => CurrentFlight(),
      ),
      ChangeNotifierProvider(create: (context) => ThemeChange()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChange>(
      builder: (context, value, child) => MaterialApp(
        title: 'Flutter Demo',
        // themeMode: ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: value.mode,
        // themeMode: context.watch<ThemeChange>().mode,
        home: const HomePage(title: 'Grading Standards!!!!!'),
      ),
    );
  }
}
