import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Settings functionality will be implemented here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
