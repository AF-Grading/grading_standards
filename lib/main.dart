import 'package:app_prototype/models/CurrentUser.dart';
import 'package:app_prototype/models/individual_report.dart';
import 'package:app_prototype/views/individual_reports_view.dart';
import 'package:app_prototype/pages/user_log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'models/grade_sheets.dart';
import 'models/current_flight.dart';
import 'models/theme_change.dart';
import 'models/users.dart';
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
      ChangeNotifierProvider(
        create: (context) => Users(),
      ),
      ChangeNotifierProvider(create: (context) => ThemeChange()),
      ChangeNotifierProvider(create: (context) => CurrentUser(),)
    ], child: Phoenix(child: MyApp())),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  //  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.blue),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => UserLoginPage(),
        '/home': (context) => WillPopScope(
              onWillPop: () async {
                return true;
              },
              child: Consumer<ThemeChange>(
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
                  home: HomePage(title: 'Grading Standards!!!!!'),
                ),
              ),
            ),
      },
      // home: UserLoginView(),
    );
  }
}
