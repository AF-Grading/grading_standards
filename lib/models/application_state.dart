import 'package:app_prototype/models/Squadrons.dart';
import 'package:app_prototype/models/user_setting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'grade_sheet.dart';

enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  noUser,
  register,
  password,
  loggedIn,
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }
  Future<void> init() async {
    FirebaseFirestore.instance.settings =
        const Settings(persistenceEnabled: true);

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        //if (_userSetting != null) {
        _loginState = ApplicationLoginState.loggedIn;
        //}
      } else {
        if (_loginState != ApplicationLoginState.noUser)
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

  Future<void> editGradeSheet(GradeSheet gradeSheet) {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be logged in');
    }
    // yikes: uses where to get email, then updates
    return FirebaseFirestore.instance
        .collection('Gradesheets')
        .withConverter(
            fromFirestore: GradeSheet.fromFirestore,
            toFirestore: (GradeSheet setting, _) => setting.toFirestore())
        .where("id", isEqualTo: gradeSheet.id)
        .get()
        .then((value) => FirebaseFirestore.instance
            .collection('Gradesheets')
            .withConverter(
                fromFirestore: GradeSheet.fromFirestore,
                toFirestore: (GradeSheet setting, _) => setting.toFirestore())
            .doc(value.docs[0].id)
            .update(gradeSheet.toFirestore()));
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
  set loginState(ApplicationLoginState state) {
    _loginState = state;
    notifyListeners();
  }

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

  Stream<List<Squadron>> get squads {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be logged in');
    }
    return FirebaseFirestore.instance.collection('Squadrons').snapshots().map(
        (docs) =>
            docs.docs.map((doc) => Squadron.fromFirestore(doc, null)).toList());
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
      final val = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (val.user != null) getUserSetting(val.user!.email);
      /* .then((value) {
        FirebaseFirestore.instance
            .collection('Users')
            .withConverter(
                fromFirestore: UserSetting.fromFirestore,
                toFirestore: (UserSetting userSetting, _) =>
                    userSetting.toFirestore())
            .where("email", isEqualTo: email)
            .get()
            .then((value) {
          return value.docs.isEmpty ? null : value.docs.first.data();
        }).then((value) {
          if (value != null) {
            _userSetting = value;
            _mode = value.themeMode.mode!;
            _loginState = ApplicationLoginState.loggedIn;
          } else {
            print("whad");
            _loginState = ApplicationLoginState.noUser;
            notifyListeners();
          }
        });
      }); */
      return true;
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      return false;
    }
  }

  Future<void> getUserSetting(String? email) async {
    final userSetting = await FirebaseFirestore.instance
        .collection('Users')
        .withConverter(
            fromFirestore: UserSetting.fromFirestore,
            toFirestore: (UserSetting userSetting, _) =>
                userSetting.toFirestore())
        .where("email", isEqualTo: email)
        .get()
        .then((value) {
      return value.docs.isEmpty ? null : value.docs.first.data();
    });

    if (userSetting != null) {
      _userSetting = userSetting;
      _mode = userSetting.themeMode.mode!;
      _loginState = ApplicationLoginState.loggedIn;
    } else {
      _loginState = ApplicationLoginState.noUser;
    }

    notifyListeners();
  }

  UserSetting? _userSetting;
  ThemeMode _mode = ThemeMode.system;

  /*set setUser(User value) {
    _currentUser = value;
    notifyListeners();
  }*/

  set userSetting(UserSetting value) {
    _userSetting = value;
    _mode = value.themeMode.mode!;
    notifyListeners();
  }

  ThemeMode get mode => _mode;

  set mode(ThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }

  UserSetting get user => _userSetting!;

  //User get user => _currentUser;

  //String get email => _userSetting!.email;

  //Permission get permission => _userSetting!.permission;

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<String> register(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      _loginState = ApplicationLoginState.loggedOut;
      FirebaseAuth.instance.signOut();
      notifyListeners();
      return "";
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
      return e.code;
    }
  }

  void signOut() {
    _userSetting = null;
    _mode = ThemeMode.system;
    _loginState = ApplicationLoginState.loggedOut;
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}

extension LightModeFromString on String {
  ThemeMode? get mode {
    switch (this) {
      case "system":
        return ThemeMode.system;
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
    }
    return null;
  }
}
