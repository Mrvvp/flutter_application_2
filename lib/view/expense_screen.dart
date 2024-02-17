import 'package:flutter/material.dart';

class ExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense'),
      ),
      body: Column(
        children: <Widget>[
          _buildTransactionList(context),
          _buildAddTransactionButton(context),
        ],
      ),
    );
  }

  Widget _buildTransactionList(BuildContext context) {
    List<ExpenseTransaction> expenseTransactions = [];

    return Expanded(
      child: ListView.builder(
        itemCount: expenseTransactions.length,
        itemBuilder: (context, index) {
          final transaction = expenseTransactions[index];
          return ListTile(
            title: Text(
                '${transaction.type} - \$${transaction.amount.toStringAsFixed(2)}'),
            subtitle: Text('Date: ${transaction.date.toString()}'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.pushNamed(context, '/edit_expense',
                    arguments: transaction);
              },
            ),
            onLongPress: () {
              _showDeleteConfirmationDialog(context, transaction);
            },
          );
        },
      ),
    );
  }

  Widget _buildAddTransactionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/add_expense');
      },
      child: Icon(Icons.add),
    );
  }

  Future<void> _showDeleteConfirmationDialog(
      BuildContext context, ExpenseTransaction transaction) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Transaction'),
          content: Text('Are you sure you want to delete this transaction?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

class ExpenseTransaction {
  final String type;
  final double amount;
  final DateTime date;

  ExpenseTransaction(
      {required this.type, required this.amount, required this.date});
}
