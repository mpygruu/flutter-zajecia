import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  Set<int> favoritesIds = {};
  bool showOnlyFavorites = false;

  void toggleShowFavorites() {
    showOnlyFavorites = !showOnlyFavorites;
    notifyListeners();
  }

  void toggleFavorite(int id) {
    if (favoritesIds.contains(id)) {
      favoritesIds.remove(id);
    } else {
      favoritesIds.add(id);
    }
    notifyListeners();
  }
}
