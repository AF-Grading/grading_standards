import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import 'GradeItem.dart';

class GradeItems extends ChangeNotifier {
  GradeItems() {
    Amplify.DataStore.observeQuery(GradeItem.classType)
        .listen((QuerySnapshot<GradeItem> snapshot) {
      _gradeItems = snapshot.items;
      notifyListeners();
    });
  }

  List<GradeItem> _gradeItems = [];

  List<GradeItem> get gradeItems => _gradeItems;
}
