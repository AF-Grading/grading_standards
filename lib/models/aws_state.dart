import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';

enum CurrentState { notLoggedIn, verifyPhone, confirmSignIn, loggedIn }

class AWSState with ChangeNotifier {
  CurrentState _state = CurrentState.notLoggedIn;

  CurrentState get state => _state;

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

  Future<void> signInWithPhoneVerification(
    String username,
    String password,
  ) async {
    await Amplify.Auth.signIn(
      username: username,
      password: password,
    );
  }

  Future<void> confirmSignInPhoneVerification(String otpCode) async {
    await Amplify.Auth.confirmSignIn(
      confirmationValue: otpCode,
    );
  }
}
