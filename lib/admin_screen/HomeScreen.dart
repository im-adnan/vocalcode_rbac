// ignore_for_file: file_names

import 'package:auth/common/PaymentScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home', style: TextStyle(fontSize: 60)),
      ),
      floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.check),
          backgroundColor: new Color(0xFFE57373),
          onPressed: () {
            return PaymentScreen();
          }));
}
