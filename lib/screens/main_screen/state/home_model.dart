import 'package:flutter/cupertino.dart';

class HomeModel with ChangeNotifier {
  bool _isDrawerOpend = false;
  int _selectedDrawerItem = 0;

  bool get isDrawerOpend => _isDrawerOpend;

  changeDrawareState() {
    _isDrawerOpend = !_isDrawerOpend;
    notifyListeners();
  }

  int get selectedDrawerItem => _selectedDrawerItem;

  changeIndex(index) {
    _selectedDrawerItem = index;
    notifyListeners();
  }
}
