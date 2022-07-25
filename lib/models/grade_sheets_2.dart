import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_prototype/models/GradeSheet.dart';
import 'package:flutter/material.dart';

class GradeSheets2 with ChangeNotifier {
  Stream<List<GradeSheet>> get gradeSheets =>
      Amplify.DataStore.observeQuery(GradeSheet.classType)
          .map((event) => event.items.toList());
}
