import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Appearance',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildAppearanceSettings(context),
            SizedBox(height: 20.0),
            Text(
              'Behavior',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildBehaviorSettings(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppearanceSettings(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Theme',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildThemeDropdown(),
            SizedBox(height: 10.0),
            Text(
              'Currency Symbol',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildCurrencySymbolInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeDropdown() {
    return DropdownButton<String>(
      items: [
        DropdownMenuItem(child: Text('Light'), value: 'light'),
        DropdownMenuItem(child: Text('Dark'), value: 'dark'),
      ],
      onChanged: (String? value) {},
      value: 'light',
    );
  }

  Widget _buildCurrencySymbolInput() {
    return TextFormField(
      initialValue: '\$',
      decoration: InputDecoration(
        labelText: 'Currency Symbol',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {},
    );
  }

  Widget _buildBehaviorSettings(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Behavior settings...',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
