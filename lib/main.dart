import 'package:app_prototype/pages/not_logged_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// internal imports
import 'models/application_state.dart';
import 'models/grade_sheet.dart';
import 'models/grade_sheets.dart';
import 'models/current_flight.dart';
import 'models/theme_change.dart';
import 'models/user_setting.dart';
import 'models/users.dart';
import 'models/current_user.dart';
import 'pages/home_page_old.dart';
import 'theme/dark_mode.dart';
import 'theme/light_mode.dart';
import 'pages/user_log_in_page.dart';

Future<void> main() async {
  // ensures the initapp function runs
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApplicationState()),
      ],
      child: Phoenix(
        child: MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => GradeSheets()),
          ChangeNotifierProvider(create: (context) => CurrentFlight()),
          ChangeNotifierProvider(create: (context) => Users()),
          ChangeNotifierProvider(create: (context) => ThemeChange()),
          ChangeNotifierProvider(create: (context) => CurrentUser()),
        ], child: MyApp()),
      ),
    ),
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
      theme: light_theme,
      darkTheme: dark_theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const UserLoginPage(),
        '/home': (context) => context.watch<ApplicationState>().loginState ==
                ApplicationLoginState.loggedIn
            ? WillPopScope(
                onWillPop: () async {
                  return true;
                },
                child: Consumer<ThemeChange>(
                  builder: (context, value, child) => MultiProvider(
                    providers: [
                      StreamProvider<List<UserSetting>>(
                        create: (_) => context.read<ApplicationState>().users,
                        initialData: const [],
                      ),
                      StreamProvider<List<GradeSheet>>(
                        create: (_) =>
                            context.watch<ApplicationState>().gradeSheets,
                        initialData: const [],
                      ),
                    ],
                    child: MaterialApp(
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
              )
            : const NotLoggedInPage(),
      },
      // home: UserLoginView(),
    );
  }
}
