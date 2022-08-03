import 'package:app_prototype/models/Squadrons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'pages/auth/barrel.dart';

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
  bool _isLoading = true;
  @override
  initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    FirebaseAuth.instance.userChanges().listen((user) async {
      if (user != null) {
        final userSetting = await FirebaseFirestore.instance
            .collection('Users')
            .withConverter(
                fromFirestore: UserSetting.fromFirestore,
                toFirestore: (UserSetting userSetting, _) =>
                    userSetting.toFirestore())
            .where("email", isEqualTo: user.email)
            .get()
            .then(
              (value) => value.docs.first.data(),
            );

        context.read<CurrentUser>().userSetting = userSetting;
      }
    });

    setState(() {
      _isLoading = false;
    });
  }

  //  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: ((context, appState, child) {
        return _isLoading
            ? SplashPage()
            : MaterialApp(
                theme: light_theme,
                darkTheme: dark_theme,
                themeMode: context.watch<CurrentUser>().mode,
                home: appState.loginState == ApplicationLoginState.loggedIn
                    ? MultiProvider(
                        providers: [
                            StreamProvider<List<UserSetting>>(
                              create: (_) =>
                                  context.read<ApplicationState>().users,
                              initialData: const [],
                            ),
                            StreamProvider<List<GradeSheet>>(
                              create: (_) =>
                                  context.watch<ApplicationState>().gradeSheets,
                              initialData: const [],
                            ),
                            StreamProvider<List<Squadron>>(
                              create: (_) =>
                                  context.watch<ApplicationState>().squads,
                              initialData: const [],
                            ),
                          ],
                        child: HomePageOld(
                            title: "Flying Standards", permission: 2)
                        //context.watch<CurrentUser>().permission.index),
                        )
                    : const UserLoginPage(),
                /*initialRoute: '/',
          routes: {
            '/': (context) => const UserLoginPage(),
            '/home': (context) => context
                        .watch<ApplicationState>()
                        .loginState ==
                    ApplicationLoginState.loggedIn
                ? WillPopScope(
                    onWillPop: () async {
                      return true;
                    },
                    child: Consumer<ThemeChange>(
                      builder: (context, value, child) => MultiProvider(
                        providers: [
                          StreamProvider<List<UserSetting>>(
                            create: (_) =>
                                context.read<ApplicationState>().users,
                            initialData: const [],
                          ),
                          StreamProvider<List<GradeSheet>>(
                            create: (_) =>
                                context.watch<ApplicationState>().gradeSheets,
                            initialData: const [],
                          ),
                          StreamProvider<List<Squadron>>(
                            create: (_) =>
                                context.watch<ApplicationState>().squads,
                            initialData: const [],
                          ),
                        ],
                        child: MaterialApp(
                          title: 'Grading Standards',
                          // themeMode: ThemeMode.light,
                          theme: light_theme,
                          darkTheme: dark_theme,
                          // themeMode: value.mode,
                          themeMode: context.watch<CurrentUser>().mode,
                          home: HomePageOld(
                              title: "Flying Standards",
                              permission: context
                                  .watch<CurrentUser>()
                                  .permission
                                  .index),
                        ),
                      ),
                    ),
                  )
                : const NotLoggedInPage(),
          },*/
                // home: UserLoginView(),
              );
      }),
    );
  }
}
