import 'package:flutter/material.dart';

class IncomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income'),
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
    
    List<IncomeTransaction> incomeTransactions = [];

    return Expanded(
      child: ListView.builder(
        itemCount: incomeTransactions.length,
        itemBuilder: (context, index) {
          final transaction = incomeTransactions[index];
          return ListTile(
            title: Text('${transaction.type} - \$${transaction.amount.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
             
                Navigator.pushNamed(context, '/edit_income', arguments: transaction);
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
    return ElevatedButton(
      onPressed: () {
      
        Navigator.pushNamed(context, '/add_income');
      },
      child: Text('Add Income Transaction'),
    );
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context, IncomeTransaction transaction) async {
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

class IncomeTransaction {
  final String type;
  final double amount;

  IncomeTransaction({required this.type, required this.amount});
}
