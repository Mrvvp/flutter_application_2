import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  String _currencySymbol = '\$'; // Default currency symbol
  double _budget = 0.0; // Default budget

  String get currencySymbol => _currencySymbol;
  double get budget => _budget;

  // Update currency symbol
  void updateCurrencySymbol(String symbol) {
    _currencySymbol = symbol;
    notifyListeners();
  }

  // Update budget
  void updateBudget(double newBudget) {
    _budget = newBudget;
    notifyListeners();
  }
}
