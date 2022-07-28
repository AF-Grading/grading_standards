import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import 'CTSItem.dart';

class CtsItems extends ChangeNotifier {
  CtsItems() {
    Amplify.DataStore.observeQuery(CTSItem.classType)
        .listen((QuerySnapshot<CTSItem> snapshot) {
      _ctsItems = snapshot.items;
      notifyListeners();
    });

    Amplify.Hub.listen([HubChannel.Auth], (hubEvent) async {
      switch (hubEvent.eventName) {
        case 'SIGNED_IN':
          await Amplify.DataStore.observeQuery(CTSItem.classType)
              .listen((QuerySnapshot<CTSItem> snapshot) {
            _ctsItems = snapshot.items;
            notifyListeners();
          });
          break;
        case 'SIGNED_OUT':
          print('USER IS SIGNED OUT');
          break;
        case 'SESSION_EXPIRED':
          print('SESSION HAS EXPIRED');
          break;
        case 'USER_DELETED':
          print('USER HAS BEEN DELETED');
          break;
      }
    });
  }

  List<CTSItem> _ctsItems = [];

  List<CTSItem> get ctsItems => _ctsItems;
}
