import 'package:flutter/material.dart';

class AllUserPage extends StatefulWidget {
  const AllUserPage({ Key key }) : super(key: key);

  @override
  _AllUserPageState createState() => _AllUserPageState();
}

class _AllUserPageState extends State<AllUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: const Center(
        child: Text('All Users'),
      ),
    );
  }
}
