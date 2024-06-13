import 'package:flutter/widgets.dart';

class TokenNotifier extends ChangeNotifier
{
  double price = 0;
  int chosenTokens = 0;

  changePriceByToken({required int tokens, required int currentPrice})
  {
    chosenTokens = tokens;
    price = (currentPrice / 20) * tokens;
    notifyListeners();
  }
}