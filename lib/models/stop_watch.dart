import 'package:flutter/foundation.dart';

class MyStopWatch extends ChangeNotifier {
  Stopwatch _stopwatch = Stopwatch();

  void start() {
    _stopwatch.start();
    notifyListeners();
  }

  void reset() {
    _stopwatch.reset();
    notifyListeners();
  }

  int get elapsedMilliseconds {
    return _stopwatch.elapsedMilliseconds;
  }
}
