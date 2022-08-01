import 'dart:async';

import 'package:amplify_api/model_subscriptions.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_prototype/models/ModelProvider.dart';
import 'package:app_prototype/models/User.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum CurrentState { loggedOut, verifyPhone, confirmSignIn, loggedIn }

class AWSState with ChangeNotifier {
  /*AWSState() {
    //init();
  }*/

  /*Future<void> init() async {
    final session = await Amplify.Auth.fetchAuthSession();

    print("We in here");
    print(session);

    if (session.isSignedIn) {
      _state = CurrentState.loggedIn;
      print("logged it");
      notifyListeners();
    }
  }*/

  CurrentState _state = CurrentState.loggedOut;

  CurrentState get state => _state;

  Future<String?> get email async {
    if (_state == CurrentState.loggedIn) {
      final user = await Amplify.Auth.getCurrentUser();

      return user.username;
    }
  }

  get authUser async {
    return await Amplify.Auth.getCurrentUser();
  }

  Future<Stream<User>> get currentUser async {
    //if (_state == CurrentState.loggedIn) {
    final authUser = await Amplify.Auth.getCurrentUser();
    return Amplify.DataStore.observeQuery(User.classType).map((event) =>
        event.items.firstWhere((user) =>
            user.name ==
            authUser
                .username)); //await Amplify.DataStore.observeQuery(User.classType).first;
    /*.listen((QuerySnapshot<User> snapshot) {
      user =
          snapshot.items.firstWhere((user) => user.email == authUser.username);
      //print("In it $user");
    });*/

    //if (ha.onDone(() {})) {}
    //print(authUser.username);
    //return user.items.firstWhere((user) => user.email == authUser.username);
    //}
    //return null;
  }

  Stream<List<User>> get users {
    return Amplify.DataStore.observeQuery(User.classType)
        .map((event) => event.items.toList());
  }

  Stream<List<GradeSheet>> get gradeSheets {
    return Amplify.DataStore.observeQuery(GradeSheet.classType)
        .map((event) => event.items.toList());
  }

  Stream<List<CTSItem>> get ctsItems {
    return Amplify.DataStore.observeQuery(CTSItem.classType)
        .map((event) => event.items.toList());
  }

  Future<void> addCtsItem(CTSItem item) async {
    Amplify.DataStore.save(item);
  }

  Future<void> addUser(User item) async {
    Amplify.DataStore.save(item);
  }

  Future<void> addGradeSheet(GradeSheet item) async {
    Amplify.DataStore.save(item);
  }

  Future<void> addGradeItem(GradeItem item) async {
    Amplify.DataStore.save(item);
  }

  Future<String> getSquad(String squadronID) async {
    final squad = await Amplify.DataStore.query(
      Squadron.classType,
      where: Squadron.ID.eq(squadronID),
    );

    return squad.first.name;
  }

  /*Stream<User?> get currentUser async* {
    final AuthUser authUser = await Amplify.Auth.getCurrentUser();
    User? user; //Amplify.DataStore.observeQuery(User.classType).map((event) =>
    //event.items.firstWhere((user) => user.name == authUser.username));

    await Amplify.DataStore.observeQuery(User.classType)
        .listen((QuerySnapshot<User> snapshot) {
      user =
          snapshot.items.firstWhere((user) => user.email == authUser.username);
      //print("In it $user");
    });
    yield user;
  }*/

  Future<void> updateUserTheme(User user, ThemeMode themeMode) async {
    final updatedUser = user.copyWith(themeMode: themeMode.name);
    await Amplify.DataStore.save(updatedUser);
  }

  set state(CurrentState state) {
    _state = state;
    notifyListeners();
  }

  Future<bool> register({
    required String email,
    required String password,
    required String phoneNumber,
    required void Function(AuthException e) errorCallback,
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
      if (res.isSignUpComplete) {
        _state = CurrentState.verifyPhone;
        notifyListeners();
      }
      return res.isSignUpComplete;
    } on AuthException catch (e) {
      errorCallback(e);
      return false;
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
    void Function(AuthException e) errorCallback,
  ) async {
    try {
      await Amplify.Auth.signIn(
        username: username,
        password: password,
      );
      return true;
    } on AuthException catch (e) {
      errorCallback(e);
      return false;
    }
  }

  Future<bool> confirmSignInPhoneVerification(String otpCode) async {
    SignInResult res = await Amplify.Auth.confirmSignIn(
      confirmationValue: otpCode,
    );

    if (res.isSignedIn) {
      _state = CurrentState.loggedIn;
      notifyListeners();
    }
    return res.isSignedIn;
  }

  Future<void> signOut() async {
    await Amplify.Auth.signOut();
    _state = CurrentState.loggedOut;
    notifyListeners();
  }
}
