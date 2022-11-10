import 'package:flutter/cupertino.dart';

class FavoriteProvider with ChangeNotifier {
  final List<String> _favouriteList = [];
  List<String> get favouriteList => _favouriteList;

  bool isExist(String value) {
    final check = _favouriteList.contains(value);
    return check;
  }

  void addOrRemoveFavorite(String value) {
    if (isExist(value)) {
      _favouriteList.remove(value);
    } else {
      _favouriteList.add(value);
    }

    notifyListeners();
  }
}
