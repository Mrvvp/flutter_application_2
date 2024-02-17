import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/expense_model.dart';
import 'package:flutter_application_2/model/income_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<Income> incomes = [];
  List<Expense> expenses = [];

  double get currentBalance {
    double totalIncome = incomes.fold(0, (sum, income) => sum + income.amount);
    double totalExpense = expenses.fold(0, (sum, expense) => sum + expense.amount);
    return totalIncome - totalExpense;
  }

  double get totalIncome {
    return incomes.fold(0, (sum, income) => sum + income.amount);
  }

  double get totalExpenses {
    return expenses.fold(0, (sum, expense) => sum + expense.amount);
  }

  void addIncome(double amount, DateTime date) {
    incomes.add(Income( amount: amount, type: '', date: date));
    notifyListeners();
  }

  void addExpense(double amount, DateTime date, String category) {
    expenses.add(Expense( amount: amount, type: '', date: date));
    notifyListeners();
  }
}
