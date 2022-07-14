import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class OfflineChecker extends StatelessWidget {
  const OfflineChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Container();
    } else {
      return OfflineBuilder(
        connectivityBuilder: ((context, connected, child) {
          final bool con = connected != ConnectivityResult.none;
          return con ? const Icon(Icons.wifi) : const Icon(Icons.wifi_off);
        }),
        child: Container(),
      );
    }
  }
}
