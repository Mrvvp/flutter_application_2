import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildChart(context),
          SizedBox(height: 20.0),
          _buildExpenseBreakdown(context),
          SizedBox(height: 20.0),
          _buildIncomeBreakdown(context),
        ],
      ),
    );
  }

  Widget _buildChart(BuildContext context) {
    
    return Container(
      height: 200.0,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        'Chart Placeholder',
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );
  }

  Widget _buildExpenseBreakdown(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Expense Breakdown',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildCategoryItem('Food', '\$500'),
            _buildCategoryItem('Rent', '\$800'),
            _buildCategoryItem('Transportation', '\$200'),
           
          ],
        ),
      ),
    );
  }

  Widget _buildIncomeBreakdown(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Income Breakdown',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildSourceItem('Salary', '\$3000'),
            _buildSourceItem('Freelance', '\$500'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String category, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(category),
        Text(amount),
      ],
    );
  }

  Widget _buildSourceItem(String source, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(source),
        Text(amount),
      ],
    );
  }
}
