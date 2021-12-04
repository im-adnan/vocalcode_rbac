// ignore_for_file: file_names
// import 'dart:convert';
// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// import '../common/allusers.dart';
// import 'usrmgnt.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({Key key}) : super(key: key);

//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             const UserAccountsDrawerHeader(
//               accountName: Text('User'),
//               accountEmail: Text('number'),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Text('U'),
//               ),
//             ),
//             ListTile(
//               title: Text('All User Page'),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => AllUserPage()));
//               },
//             ),
//             ListTile(
//               title: Text('AdminArea'),
//               onTap: () {
//                 UserManagement().authorizeAccess(context);
//               },
//             ),
//             ListTile(
//               title: Text('Logout'),
//               onTap: () {
//                 // signOut();
//                 UserManagement().signOut(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       body: const Center(
//         child: Text('Dashboard'),
//       ),
//     );
//   }
// }
