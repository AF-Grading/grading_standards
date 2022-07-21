import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_prototype/models/User.dart';
import 'package:flutter/foundation.dart';

enum CurrentState { loggedOut, verifyPhone, confirmSignIn, loggedIn }

class AWSState with ChangeNotifier {
  AWSState() {
    init();
  }

  Future<void> init() async {
    final session = await Amplify.Auth.fetchAuthSession();

    if (session.isSignedIn) {
      _state = CurrentState.loggedIn;
      notifyListeners();
    }
  }

  CurrentState _state = CurrentState.loggedOut;

  CurrentState get state => _state;

  Future<String?> get email async {
    if (_state == CurrentState.loggedIn) {
      final user = await Amplify.Auth.getCurrentUser();

      return user.username;
    }
  }

  Future<User?> get currentUser async {
    if (_state == CurrentState.loggedIn) {
      final authUser = await Amplify.Auth.getCurrentUser();
      User? user;
      await Amplify.DataStore.observeQuery(User.classType)
          .listen((QuerySnapshot<User> snapshot) {
        user = snapshot.items.firstWhere((user) => user.email == authUser);
      });

      return user;
    }
    return null;
  }

  set state(CurrentState state) {
    _state = state;
    notifyListeners();
  }

  Future<bool> register({
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      //Map<String, String> userAttributes = {'name': name};
      SignUpResult res = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(
          userAttributes: <CognitoUserAttributeKey, String>{
            CognitoUserAttributeKey.email: email,
            // US NUMBERS ONLY
            CognitoUserAttributeKey.phoneNumber: "+1${phoneNumber}",
          },
        ),
      );
      return res.isSignUpComplete;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<bool> confirmSignUpPhoneVerification(
      String username, String otpCode) async {
    SignUpResult res = await Amplify.Auth.confirmSignUp(
      username: username,
      confirmationCode: otpCode,
    );
    return res.isSignUpComplete;
  }

  Future<bool> signInWithPhoneVerification(
    String username,
    String password,
  ) async {
    SignInResult res = await Amplify.Auth.signIn(
      username: username,
      password: password,
    );
    return res.isSignedIn;
  }

  Future<bool> confirmSignInPhoneVerification(String otpCode) async {
    SignInResult res = await Amplify.Auth.confirmSignIn(
      confirmationValue: otpCode,
    );
    return res.isSignedIn;
  }

  Future<void> signOut() async {
    await Amplify.Auth.signOut();
    _state = CurrentState.loggedOut;
    notifyListeners();
  }
}
