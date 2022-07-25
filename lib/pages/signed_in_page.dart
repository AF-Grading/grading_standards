import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_prototype/pages/user_log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/GradeSheet.dart';
import '../models/User.dart';
import '../models/application_state.dart';
import '../models/aws_state.dart';
import '../models/current_user.dart';
import '../models/user_setting.dart';
import '../theme/dark_mode.dart';
import '../theme/light_mode.dart';
import 'home_page_old.dart';

// TODO Not really a page: provides flow for log ins
class SignedInPage extends StatefulWidget {
  const SignedInPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignedInPage> createState() => _SignedInPageState();
}

class _SignedInPageState extends State<SignedInPage> {
  AuthSession _initialState = AuthSession(isSignedIn: false);

  bool _isLoading = true;

  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
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
        //_initialState = session;
        if (session.isSignedIn) {
          context.read<AWSState>().state = CurrentState.loggedIn;
        }
        _isLoading = false;
      });
    } catch (e) {
      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      setState(() {
        print("no longer loading");
        _isLoading = false;
      });
      print('An error occurred while configuring Amplify: $e');
    }
  }

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

          home: appState.state == CurrentState.loggedIn
              ? MultiProvider(
                  providers: [
                    StreamProvider<List<UserSetting>>(
                      create: (_) => context.read<ApplicationState>().users,
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
