import 'package:flutter/material.dart';

import 'package:flutter_application_2/model/expense_model.dart';

class ExpenseViewModel extends ChangeNotifier {
  List<Expense> _expenseList = [];

  List<Expense> get expenseList => _expenseList;

  void addExpense(double amount, String type, DateTime date) {
    _expenseList.add(Expense(amount: amount, type: type, date: date));
    notifyListeners();
  }

  void editExpense(int index, double amount, String type, DateTime date) {
    if (index >= 0 && index < _expenseList.length) {
      _expenseList[index] = Expense(amount: amount, type: type, date: date);
      notifyListeners();
    }
  }

  void deleteExpense(int index) {
    if (index >= 0 && index < _expenseList.length) {
      _expenseList.removeAt(index);
      notifyListeners();
    }
  }
}
