import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// internal imports
import 'models/application_state.dart';
import 'models/grade_sheets.dart';
import 'models/current_flight.dart';
import 'models/theme_change.dart';
import 'models/users.dart';
import 'models/CurrentUser.dart';
import 'pages/home_page_old.dart';
import 'theme/dark_mode.dart';
import 'theme/light_mode.dart';
import 'pages/user_log_in_page.dart';

void main() {
  runApp(
    Phoenix(
      child: MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => ApplicationState()),
        ChangeNotifierProvider(create: (context) => GradeSheets()),
        ChangeNotifierProvider(create: (context) => CurrentFlight()),
        ChangeNotifierProvider(create: (context) => Users()),
        ChangeNotifierProvider(create: (context) => ThemeChange()),
        ChangeNotifierProvider(create: (context) => CurrentUser())
      ], child: MyApp()),
    ),
  );
}

// class Test extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<Test> {
//   @override
//   //  MyApp({Key? key}) : super(key: key);
//   // This widget is the root of your application.

//   @override
//   Widget build(BuildContext context) {
//     context.read<CurrentUser>().setUser = User(
//       name: "test",
//       rank: Rank.secondLt,
//       squad: '',
//       id: '',
//       email: "test",
//       password: "test",
//       permission: Permission.wing_training,
//     );
//     return MaterialApp(
//       theme: light_theme,
//       darkTheme: dark_theme,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => Consumer<ThemeChange>(
//                 builder: (context, value, child) => MaterialApp(
//                   title: 'Flutter Demo',
//                   // themeMode: ThemeMode.light,
//                   theme: light_theme,
//                   darkTheme: dark_theme,
//                   // themeMode: value.mode,
//                   themeMode: context.watch<ThemeChange>().mode,
//                   home: HomePageOld(
//                       title: "Flying Standards",
//                       permission:
//                           context.watch<CurrentUser>().permission.index),
//                 ),
//               ),

//       },
//       // home: UserLoginView(),
//     );
//   }
// }

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
      theme: light_theme,
      darkTheme: dark_theme,
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
                  theme: light_theme,
                  darkTheme: dark_theme,
                  // themeMode: value.mode,
                  themeMode: context.watch<ThemeChange>().mode,
                  home: HomePageOld(
                      title: "Flying Standards",
                      permission:
                          context.watch<CurrentUser>().permission.index),
                ),
              ),
            ),
      },
      // home: UserLoginView(),
    );
  }
}
