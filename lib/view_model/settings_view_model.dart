import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  String _currencySymbol = '\$'; 
  double _budget = 0.0; 

  String get currencySymbol => _currencySymbol;
  double get budget => _budget;

  
  void updateCurrencySymbol(String symbol) {
    _currencySymbol = symbol;
    notifyListeners();
  }

  
  void updateBudget(double newBudget) {
    _budget = newBudget;
    notifyListeners();
  }
}
