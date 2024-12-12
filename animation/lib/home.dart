// ignore_for_file: non_constant_identifier_names

import 'package:animation/models/Expane_data.dart';
import 'package:flutter/material.dart';

import 'package:animation/models/expanse_Item.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final newExpensesNameController = TextEditingController();
  final newExpensesAmountController = TextEditingController();

  void addNewExpenses() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add the expenses'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newExpensesNameController,
              decoration: const InputDecoration(hintText: 'Expense Name'),
            ),
            TextField(
              controller: newExpensesAmountController,
              decoration: const InputDecoration(hintText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: const Text('Save'),
          ),
          MaterialButton(
            onPressed: cancel,
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void save() {
    String name = newExpensesNameController.text;
    String amount = newExpensesAmountController.text;

    if (name.isNotEmpty && amount.isNotEmpty) {
      Expense newExpense = Expense(
        name: name,
        amount: amount,
        datetime: DateTime.now(),
      );

      Provider.of<ExpenseData>(context, listen: false)
          .addNewexpense(newExpense);
      Navigator.pop(context);
    }
  }

  void cancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpenses,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: value.getAllExpenseList().length,
          itemBuilder: (context, index) =>
              ListTile(title: Text(value.getAllExpenseList()[index].name)),
        ),
      ),
    );
  }
}
