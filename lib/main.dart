import 'package:app_prototype/views/user_log_in_view.dart';
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
    ], child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  //  MyApp({Key? key}) : super(key: key);
  bool test = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (test) {
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
    } else {
      return UserLoginView();
    }
  }
}
