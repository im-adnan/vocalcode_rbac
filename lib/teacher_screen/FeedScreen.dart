// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Feeds'),
        ),
        body: Center(
          child: Text(
            'Feeds',
            style: TextStyle(fontSize: 60),
          ),
        ),
      );
}
