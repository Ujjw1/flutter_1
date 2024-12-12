// ignore_for_file: non_constant_identifier_names

import 'package:animation/models/expanse_item.dart';
import 'package:flutter/material.dart';
import 'package:animation/models/date_time_helper.dart';

class ExpenseData extends ChangeNotifier {
  List<Expense> overallExpenseList = [];

  List<Expense> getAllExpenseList() {
    return overallExpenseList;
  }

  void addNewexpense(Expense NewExpense) {
    overallExpenseList.add(NewExpense);
  }

  void deleteExpense(Expense Expanse) {
    overallExpenseList.remove(Expanse);
  }

  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  DateTime? startoverweekDate() {
    DateTime? startofweek;

    DateTime today = DateTime.now();
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'sunday') {
        startofweek = today.subtract(Duration(days: i));
      }
    }
    return startofweek;
  }

  Map<String, double> calculateDailyExpenses() {
    Map<String, double> dailyExpensesSummary = {};
    for (var expense in overallExpenseList) {
      String date = coverDateTimeintoString(expense.datetime);
      double amount = double.parse(expense.amount);

      if (dailyExpensesSummary.containsKey(date)) {
        double currentAmount = dailyExpensesSummary[date]!;
        currentAmount += amount;
        dailyExpensesSummary[date] = currentAmount;
      } else {
        dailyExpensesSummary.addAll({date: amount});
      }
    }
    return dailyExpensesSummary;
  }
}
