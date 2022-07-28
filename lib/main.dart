import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_prototype/amplifyconfiguration.dart';
import 'package:app_prototype/models/ModelProvider.dart';
import 'package:app_prototype/models/aws_state.dart';
import 'package:app_prototype/models/cts_items.dart';
import 'package:app_prototype/models/grade_sheets_2.dart';
import 'package:app_prototype/models/Squadrons.dart';
import 'package:app_prototype/pages/not_logged_in_page.dart';
import 'package:app_prototype/pages/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// internal imports
import 'models/Users.dart';
import 'models/application_state.dart';
import 'models/grade_items.dart';
import 'models/grade_sheet.dart';
import 'models/grade_sheets.dart';
import 'models/current_flight.dart';
import 'models/theme_change.dart';
import 'models/user_setting.dart';
import 'models/current_user.dart';
import 'pages/auth/not_authorized_page.dart';
import 'pages/home_page_old.dart';
import 'pages/signed_in_page.dart';
import 'pages/spash_page.dart';
import 'theme/dark_mode.dart';
import 'theme/light_mode.dart';
import 'pages/user_log_in_page.dart';

GetIt getIt = GetIt.instance;

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
          ChangeNotifierProvider(create: (context) => CtsItems()),
          ChangeNotifierProvider(create: (context) => GradeItems()),
          ChangeNotifierProvider(create: (context) => ThemeChange()),
          ChangeNotifierProvider(create: (context) => CurrentUser()),
          ChangeNotifierProvider(create: (context) => GradeSheets2()),
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

  bool _isLoading = true;

  @override
  initState() {
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

      // TODO Remove this
      /*if (session.isSignedIn) {
        final AuthUser authUser = await Amplify.Auth.getCurrentUser();
        await Amplify.DataStore.observeQuery(User.classType)
            .listen((QuerySnapshot<User> snapshot) {
          context.read<CurrentUser>().setUser = snapshot.items
              .firstWhere((user) => user.email == authUser.username);
        });
      }*/

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
    return _isLoading ? SplashPage() : SignedInPage();
  }
}
