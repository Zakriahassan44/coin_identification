import 'package:coin_identification/Model/coin_model.dart';
import 'package:coin_identification/Utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteCoinsProvider with ChangeNotifier {
  final Box<CoinModel> _box = Hive.box<CoinModel>("coinCollection");

  List<CoinModel> getFavorite() {
    return _box.values.toList();
  }

  bool isFavorite(CoinModel model) {
    return _box.containsKey(model.id);
  }

  void toggleFavorite(CoinModel model) {
    if (isFavorite(model)) {
      _box.delete(model.id);
      toast("Remove Successfully");
    } else {
      _box.put(model.id, model);
      toast("Add to Collection Successfully");
    }
    notifyListeners();
  }
}
