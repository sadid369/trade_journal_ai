import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Report functionality will be implemented here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
