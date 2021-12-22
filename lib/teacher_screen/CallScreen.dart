// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Call'),
        ),
        body: Center(
          child: Text('Calls Coming Soon', style: TextStyle(fontSize: 60)),
        ),
      );
}
