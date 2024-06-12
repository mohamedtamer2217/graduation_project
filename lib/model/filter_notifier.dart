import 'package:flutter/cupertino.dart';

class FilterNotifier extends ChangeNotifier
{
  String location = '';
  bool chosen = false;
  int range = 0, chosenIndex = -1;

  filterLocation({required String chosenLocation})
  {
    location = chosenLocation;
    notifyListeners();
  }

  filterPriceFrom({required int fromRange})
  {
    range = fromRange;
    notifyListeners();
  }
}