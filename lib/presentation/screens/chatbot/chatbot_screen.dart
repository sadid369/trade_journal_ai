import 'package:flutter/material.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Chatbot functionality will be implemented here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
