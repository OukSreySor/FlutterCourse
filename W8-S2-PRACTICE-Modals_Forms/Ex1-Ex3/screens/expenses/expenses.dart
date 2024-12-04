import 'package:flutter/material.dart';
 
import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];

  void onExpenseRemoved(Expense expense) {
    // store removed expense temporarily
    final removedExpense = expense;
    setState(() {
      _registeredExpenses.remove(expense);
    });
    // clear any existing snack bar before displaying a new one
    ScaffoldMessenger.of(context).clearSnackBars();

    // dispay snack bar with undo action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo', 
          onPressed: () {
            setState(() {
              _registeredExpenses.add(removedExpense);
            });
          },
        ),
        duration: const Duration(seconds: 3),
      )
    );
  }

  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }
 

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(onCreated: onExpenseCreated,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPressed,
          )
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: _registeredExpenses.isEmpty 
        ? const Center(
            child: Text(
              'No expenses found. Start adding some!',
            ),
          )
        : ExpensesList(expenses: _registeredExpenses, onExpenseRemoved: onExpenseRemoved,),
    );
  }
}
