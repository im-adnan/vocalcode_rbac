// // ignore_for_file: file_names

// import 'package:flutter/material.dart';

// import '../RBAC/usrmgnt.dart';

// class GuestDash extends StatefulWidget {
//   const GuestDash({Key key}) : super(key: key);

//   @override
//   _GuestDashState createState() => _GuestDashState();
// }

// class _GuestDashState extends State<GuestDash> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Guest'),
//       ),
//       body: Center(
//         child: Text('Guest'),
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
//               title: Text('Logout'),
//               onTap: () {
//                 UserManagement().signOut(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
