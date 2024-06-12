import 'package:flutter/cupertino.dart';

class FilterNotifier extends ChangeNotifier
{
  String location = '';
  bool chosen = false;

  filterLocation({required String chosenLocation})
  {
    location = chosenLocation;
    notifyListeners();
  }
}