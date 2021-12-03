// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../RBAC/usrmgnt.dart';

class TeacherDash extends StatefulWidget {
  const TeacherDash({Key key}) : super(key: key);

  @override
  _TeacherDashState createState() => _TeacherDashState();
}

class _TeacherDashState extends State<TeacherDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher'),
      ),
      body: Center(
        child: Text('Teacher'),
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
