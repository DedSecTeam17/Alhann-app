import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SplashModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _current = 0;

  int get current => _current;

  void changeImageIndex(int index) {
    _current = index;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', _current));
  }
}
