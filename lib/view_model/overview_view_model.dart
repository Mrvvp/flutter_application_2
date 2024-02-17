import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/expense_model.dart';
import 'package:flutter_application_2/model/income_model.dart';

class OverviewViewModel extends ChangeNotifier {
  List<Income> _incomeList = [];
  List<Expense> _expenseList = [];

  List<Income> get incomeList => _incomeList;
  List<Expense> get expenseList => _expenseList;

  
  void generateSampleData() {
    _incomeList = [
      Income(amount: 2000, type: 'Salary', date: DateTime(2022, 1, 1)),
      Income(amount: 1500, type: 'Freelance', date: DateTime(2022, 1, 5)),
     
    ];

    _expenseList = [
      Expense(amount: 100, type: 'Food', date: DateTime(2022, 1, 2)),
      Expense(amount: 50, type: 'Transportation', date: DateTime(2022, 1, 3)),
      
    ];

    notifyListeners();
  }

  double get totalIncome {
    return _incomeList.fold(0, (sum, income) => sum + income.amount);
  }

  double get totalExpenses {
    return _expenseList.fold(0, (sum, expense) => sum + expense.amount);
  }


  Map<String, double> get expensesBreakdown {
    Map<String, double> breakdown = {};

    _expenseList.forEach((expense) {
      if (breakdown.containsKey(expense.type)) {
        breakdown[expense.type] = (breakdown[expense.type] ?? 0) + expense.amount;
      } else {
        breakdown[expense.type] = expense.amount;
      }
    });

    return breakdown;
  }


  Map<String, double> get incomeBreakdown {
    Map<String, double> breakdown = {};

    _incomeList.forEach((income) {
      if (breakdown.containsKey(income.type)) {
        breakdown[income.type] = (breakdown[income.type] ?? 0) + income.amount;
      } else {
        breakdown[income.type] = income.amount;
      }
    });

    return breakdown;
  }

  void filterDataByDateRange(DateTime startDate, DateTime endDate) {
    _incomeList = _incomeList
        !.where((income) => income.date.isAfter(startDate) && income.date.isBefore(endDate))
        .toList();

    _expenseList = _expenseList
        !.where((expense) => expense.date.isAfter(startDate) && expense.date.isBefore(endDate))
        .toList();

    notifyListeners();
  }
}
