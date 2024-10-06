import 'package:flutter/material.dart';

class Chathistory extends StatefulWidget {
  const Chathistory({super.key});

  @override
  State<Chathistory> createState() => _ChathistoryState();
}

class _ChathistoryState extends State<Chathistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('history'),),
    );
  }
}