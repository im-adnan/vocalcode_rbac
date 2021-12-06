// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
        ),
        body: Center(
          child: Text('Chat', style: TextStyle(fontSize: 60)),
        ),
      );
}
