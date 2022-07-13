import 'package:app_prototype/models/user_setting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';
import 'grade_sheet.dart';

enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn,
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }
  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
      } else {
        _loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  Future<DocumentReference> addGradeSheet(GradeSheet gradeSheet) {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be logged in');
    }

    return FirebaseFirestore.instance
        .collection('Gradesheets')
        .add(gradeSheet.toFirestore());
  }

  Future<DocumentReference> addUserSetting(UserSetting userSetting) {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be logged in');
    }

    return FirebaseFirestore.instance
        .collection('Users')
        .add(userSetting.toFirestore());
  }

  Future<void> editUserSetting(UserSetting userSetting) {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be logged in');
    }
    // yikes: uses where to get email, then updates
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter(
            fromFirestore: UserSetting.fromFirestore,
            toFirestore: (UserSetting setting, _) => setting.toFirestore())
        .where("email", isEqualTo: userSetting.email)
        .get()
        .then((value) => FirebaseFirestore.instance
            .collection('Users')
            .withConverter(
                fromFirestore: UserSetting.fromFirestore,
                toFirestore: (UserSetting setting, _) => setting.toFirestore())
            .doc(value.docs[0].id)
            .update(userSetting.toFirestore()));
  }

  Future<UserSetting> fetchCurrentUserSettings(String email) {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be logged in');
    }

    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter(
            fromFirestore: UserSetting.fromFirestore,
            toFirestore: (UserSetting userSetting, _) =>
                userSetting.toFirestore())
        .where("email", isEqualTo: email)
        .get()
        .then(
          (value) => value.docs.first.data(),
        );
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  String? _email;
  String? get email => _email;
  Stream<List<UserSetting>> get users {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be logged in');
    }
    return FirebaseFirestore.instance.collection('Users').snapshots().map(
        (docs) => docs.docs
            .map((doc) => UserSetting.fromFirestore(doc, null))
            .toList());
  }

  Stream<List<GradeSheet>> get gradeSheets {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be logged in');
    }
    return FirebaseFirestore.instance.collection('Gradesheets').snapshots().map(
        (docs) => docs.docs
            .map((doc) => GradeSheet.fromFirestore(doc, null))
            .toList());
  }

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  Future<bool> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        _loginState = ApplicationLoginState.loggedIn;
        notifyListeners();
      });
      return true;
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      return false;
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<String> register(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return "";
    } on FirebaseAuthException catch (e) {
      return e.code;
      //return false;
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
