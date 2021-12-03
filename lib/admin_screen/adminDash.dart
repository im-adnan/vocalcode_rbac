import 'package:flutter/material.dart';

import '../RBAC/usrmgnt.dart';

class AdminDash extends StatefulWidget {
  const AdminDash({Key key}) : super(key: key);

  @override
  _AdminDashState createState() => _AdminDashState();
}

class _AdminDashState extends State<AdminDash> {
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
