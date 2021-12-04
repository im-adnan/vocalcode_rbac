import 'package:auth/admin_screen/adminDash.dart';
import 'package:auth/common/LoginScreen.dart';
import 'package:auth/common/ProfileScreen.dart';
import 'package:auth/student_screen/StudentDash.dart';
import 'package:auth/teacher_screen/teacherDash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/widgets.dart';

import '../common/allusers.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
var name = '';

class UserManagement {
  Widget handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        // if (snapshot.hasData) {
        //   return const DashboardScreen();
        // } else {
        if (snapshot.hasData == authorizeAccess(context)) {
          return UserManagement().authorizeAccess(context);
        } else {
          return LoginScreen();
        }
      },
    );
  }

  authorizeAccess(BuildContext context) async {
    final User user = FirebaseAuth.instance.currentUser;
    final uid = user.uid;

    final DocumentSnapshot<Map<String, dynamic>> document =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    if (document.exists) {
      if (document.data()['role'] == "admin") {
        Navigator?.push(context,
            MaterialPageRoute(builder: (context) => const AdminDash()));
      }
      if (document.data()['role'] == "teacher") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TeacherDash()));
      }
      if (document.data()['role'] == "student") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StudentDash()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AllUserPage()));
      }
      print('not authorize');
    }
  }

  signOut(BuildContext context) async {
    //redirect
    _auth.signOut().then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }
}

// ONBOARDING SCREEN CAN BE DYNAMICALLYY SHOWN BY THIS
// authorizeAccess(BuildContext context) async {
//     final User user = await FirebaseAuth.instance.currentUser;
//     final String uid = user.uid;
//     final DocumentSnapshot document = await FirebaseFirestore.instance.collection("users").doc(uid).get();
//     if(document.exists) {
//       Navigator.of(context).pushReplacementNamed('/dashboard');
//     } else {
//       Navigator.of(context).pushReplacementNamed('/onboarding');
//     }
//   }