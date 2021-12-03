import 'package:flutter/material.dart';

import '../RBAC/usrmgnt.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: Center(
        child: Text('Admin'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('User'),
              accountEmail: Text('number'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('U'),
              ),
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                UserManagement().signOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
