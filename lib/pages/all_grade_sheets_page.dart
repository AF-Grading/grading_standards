import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_prototype/amplifyconfiguration.dart';
import 'package:app_prototype/models/ModelProvider.dart';
import 'package:app_prototype/widgets/grade_sheet_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/application_state.dart';
import '../views/all_grade_sheets_view.dart';
import '/pages/add_edit_grade_sheet_page.dart';

class AllGradeSheetsPage extends StatefulWidget {
  const AllGradeSheetsPage({Key? key}) : super(key: key);

  @override
  State<AllGradeSheetsPage> createState() => _AllGradeSheetsPageState();
}

class _AllGradeSheetsPageState extends State<AllGradeSheetsPage> {
  late StreamSubscription<QuerySnapshot<GradeSheet>> _subscription;
  // loading ui state - initially set to a loading state
  bool _isLoading = true;

  // list of Todos - initially empty
  // NOTE: USES A DIFFERENT MODEL
  List<GradeSheet> _gradesheets = [];

  // amplify plugins
  final _dataStorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
  final AmplifyAPI _apiPlugin = AmplifyAPI();
  final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();

  @override
  void initState() {
    // kick off app initialization
    _initializeApp();

    super.initState();
  }

  @override
  void dispose() {
    // to be filled in a later step
    super.dispose();
  }

  Future<void> _initializeApp() async {
    // configure Amplify
    await _configureAmplify();

    // after configuring Amplify, update loading ui state to loaded state
    _subscription = Amplify.DataStore.observeQuery(GradeSheet.classType)
        .listen((QuerySnapshot<GradeSheet> snapshot) {
      setState(() {
        if (_isLoading) _isLoading = false;
        _gradesheets = snapshot.items;
      });
    });
  }

  Future<void> _configureAmplify() async {
    try {
      // add Amplify plugins
      await Amplify.addPlugins([_dataStorePlugin, _apiPlugin, _authPlugin]);
      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
      // await Amplify.configure(amplifyconfig);
    } catch (e) {
      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      print('An error occurred while configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("All Grade Sheets"),
            GestureDetector(
              child: const Icon(
                Icons.add,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddEditGradeSheetPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      //body: const AllGradeSheetsView());
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : GradeSheetsList(gradesheets: _gradesheets),
    );
  }
}

class GradeSheetsList extends StatelessWidget {
  const GradeSheetsList({
    required this.gradesheets,
    Key? key,
  }) : super(key: key);

  final List<GradeSheet> gradesheets;

  @override
  Widget build(BuildContext context) {
    return gradesheets.isNotEmpty
        ? ListView(
            padding: const EdgeInsets.all(8),
            children: gradesheets
                .map((sheet) => SheetListTile(gradeSheet: sheet))
                .toList())
        : const Center(
            child: Text('Tap button below to add a sheet!'),
          );
  }
}

class SheetListTile extends StatelessWidget {
  const SheetListTile({required this.gradeSheet});
  final GradeSheet gradeSheet;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(gradeSheet.missionNum),
    );
  }
}
