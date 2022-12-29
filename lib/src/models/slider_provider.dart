import 'package:flutter/foundation.dart';

class SliderProvider with ChangeNotifier {
  double _value = 100;
  set value(double value) {
    _value = value;
    notifyListeners();
  }

  double get value => _value;

  bool _enabled = true;
  bool get enabled => _enabled;

  set enabled(bool value) {
    _enabled = value;
    notifyListeners();
  }
}
