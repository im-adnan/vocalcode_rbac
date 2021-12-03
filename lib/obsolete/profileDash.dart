// ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:auth/LoginScreen.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// var name = '';

// class DashProfile extends StatefulWidget {
//   DashProfile({Key key}) : super(key: key);

//   @override
//   _DashProfileState createState() => _DashProfileState();
// }

// class _DashProfileState extends State<DashProfile> {
//   @override
//   void initState() {
//     getUser();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Text(
//             'Welcome ' + name,
//             style: TextStyle(fontSize: 30),
//           ),
//           Text('(cellnumber: ' +
//               (_auth.currentUser.phoneNumber != null
//                   ? _auth.currentUser.phoneNumber
//                   : '') +
//               ' uid:' +
//               (_auth.currentUser.uid != null ? _auth.currentUser.uid : '') +
//               ')'),
//           ElevatedButton(
//               onPressed: () => {
//                     //sign out
//                     signOut()
//                   },
//               child: Text('Sign out'))
//         ],
//       ),
//     ));
//   }

//   Future getUser() async {
//     if (_auth.currentUser != null) {
//       var cellNumber = _auth.currentUser.phoneNumber;
//       cellNumber =
//           '0' + _auth.currentUser.phoneNumber.substring(3, cellNumber.length);
//       debugPrint(cellNumber);
//       await _firestore
//           .collection('users')
//           .where('cellnumber', isEqualTo: cellNumber)
//           .get()
//           .then((result) {
//         if (result.docs.length > 0) {
//           setState(() {
//             name = result.docs[0].data()['name'];
//           });
//         }
//       });
//     }
//   }

//   signOut() {
//     //redirect
//     _auth.signOut().then((value) => Navigator.pushReplacement(context,
//         MaterialPageRoute(builder: (BuildContext context) => LoginScreen())));
//   }
// }