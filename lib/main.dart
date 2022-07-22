import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_prototype/amplifyconfiguration.dart';
import 'package:app_prototype/models/ModelProvider.dart';
import 'package:app_prototype/models/aws_state.dart';
import 'package:app_prototype/pages/not_logged_in_page.dart';
import 'package:app_prototype/pages/auth/register_page.dart';
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
import 'pages/auth/not_authorized_page.dart';
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
        ChangeNotifierProvider(create: (context) => AWSState()),
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
  final _dataStorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
  final AmplifyAPI _apiPlugin = AmplifyAPI();
  final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();
  AuthSession _initialState = AuthSession(isSignedIn: false);

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      // add Amplify plugins
      await Amplify.addPlugins([_dataStorePlugin, _apiPlugin, _authPlugin]);
      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);
      final session = await Amplify.Auth.fetchAuthSession();

      if (session.isSignedIn) {
        final AuthUser authUser = await Amplify.Auth.getCurrentUser();
        await Amplify.DataStore.observeQuery(User.classType)
            .listen((QuerySnapshot<User> snapshot) {
          context.read<CurrentUser>().setUser = snapshot.items
              .firstWhere((user) => user.email == authUser.username);
        });
      }

      setState(() {
        _initialState = session;
      });
    } catch (e) {
      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      print('An error occurred while configuring Amplify: $e');
    }
  }

  //  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AWSState>(
      builder: (context, appState, child) {
        return MaterialApp(
          theme: light_theme,
          darkTheme: dark_theme,
          themeMode: context.watch<CurrentUser>().user != null
              ? context.watch<CurrentUser>().user!.themeMode!.themeMode!
              : ThemeMode.system,
          //initialRoute: _initialState.isSignedIn ? '/home' : '/',

          home: _initialState.isSignedIn
              ? MultiProvider(
                  providers: [
                    StreamProvider<List<UserSetting>>(
                      create: (_) => context.read<ApplicationState>().users,
                      initialData: const [],
                    ),
                    StreamProvider<List<User>>(
                      create: (_) => appState.users,
                      initialData: const [],
                    ),
                    /*FutureProvider<Stream<User>>(
                        create: (context) =>
                            context.read<AWSState>().currentUser,
                        initialData: null)*/
                  ],
                  child: HomePageOld(
                    title: "Flying Standards",
                    permission: 4, //user!.permission!.length,
                  ),
                )
              : const UserLoginPage(),
          /*routes: {
            '/home': (context) => //appState.state == CurrentState.loggedIn
                WillPopScope(
                  onWillPop: () async {
                    return true;
                  },
                  child: /*Consumer<ThemeChange>(
                          builder: (context, value, child) =>*/
                      MultiProvider(
                    providers: [
                      StreamProvider<List<UserSetting>>(
                        create: (_) => context.read<ApplicationState>().users,
                        initialData: const [],
                      ),
                      FutureProvider<User?>(
                        initialData: null,
                        create: (context) => appState.currentUser,
                      )
                      //create: (context) =>
                      //CurrentUser(user: appState.currentUser)),

                      /*StreamProvider<List<GradeSheet>>(
                          create: (_) =>
                              context.watch<ApplicationState>().gradeSheets,
                          initialData: const [],
                        ),*/
                    ],
                    child: Consumer<User?>(
                      builder: ((context, currentUser, child) {
                        //User? user = currentUser.user;
                        return currentUser != null
                            ? MaterialApp(
                                title: 'AF Grading Standards',
                                // themeMode: ThemeMode.light,
                                theme: light_theme,
                                darkTheme: dark_theme,
                                // themeMode: value.mode,
                                themeMode: currentUser.themeMode!.themeMode!,
                                home: HomePageOld(
                                  title: "Flying Standards",
                                  permission: 4, //user!.permission!.length,
                                ),
                              )
                            : MaterialApp(
                                title: 'AF Grading Standards',
                                // themeMode: ThemeMode.light,
                                theme: light_theme,
                                darkTheme: dark_theme,
                                // themeMode: value.mode,
                                //themeMode: context.watch<CurrentUser>().theme,
                                home: const NotAuthorizedPage(),
                              );
                      }),
                    ),
                  ),
                  //),
                ),
            '/': (context) => const UserLoginPage()
          },*/
          // home: UserLoginView(),
        );
      },
    );
  }
}
