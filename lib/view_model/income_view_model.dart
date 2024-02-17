import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/income_model.dart';

class IncomeViewModel extends ChangeNotifier {
  List<Income> _incomeList = [];

  List<Income> get incomeList => _incomeList;

  void addIncome(double amount, String type, DateTime date) {
    _incomeList.add(Income(amount: amount, type: type, date: date));
    notifyListeners();
  }

  void editIncome(int index, double amount, String type, DateTime date) {
    if (index >= 0 && index < _incomeList.length) {
      _incomeList[index] = Income(amount: amount, type: type, date: date);
      notifyListeners();
    }
  }

  void deleteIncome(int index) {
    if (index >= 0 && index < _incomeList.length) {
      _incomeList.removeAt(index);
      notifyListeners();
    }
  }
}
