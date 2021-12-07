import 'package:auth/admin_screen/adminDash.dart';
import 'package:auth/common/LoginScreen.dart';
import 'package:auth/skill/screens/onboarding_screen.dart';
import 'package:auth/student_screen/studentDash.dart';
import 'package:auth/teacher_screen/teacherDash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final currentUser = _auth.currentUser;

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
          return OnBoardingScreen();
        }
        // }
      },
    );
  }

  authorizeAccess(BuildContext context) async {
    if (_auth.currentUser != null) {
      final User user = _auth.currentUser;
      final uid = user.uid;
      final DocumentSnapshot<Map<String, dynamic>> doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      final String userRole = doc.data()['userRole'];
      if (userRole == 'Admin') {
        Navigator?.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdminDash(),
          ),
        );
      } else if (userRole == 'Teacher') {
        Navigator?.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeacherDash(),
          ),
        );
      } else if (userRole == 'Student') {
        Navigator?.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentDash(),
          ),
        );
      }
    } else {
      //following line causing  LoginScreeen Loop
      // return UserManagement().signOut(context);
      return const SnackBar(content: Text('Please Login'));
    }
    //   final DocumentSnapshot<Map<String, dynamic>> document =
    //       await FirebaseFirestore.instance
    //           .collection("users")
    //           .doc(_auth.currentUser.uid != null ? _auth.currentUser.uid : '')
    //           .get();
    //   if (document.exists) {
    //     if (document.data()['userRole'] == "admin") {
    //       Navigator?.push(
    //           context, MaterialPageRoute(builder: (context) => AdminDash()));
    //     }
    //     if (document.data()['userRole'] == "teacher") {
    //       Navigator.push(
    //           context, MaterialPageRoute(builder: (context) => TeacherDash()));
    //     }
    //     if (document.data()['userRole'] == "student") {
    //       Navigator.push(
    //           context, MaterialPageRoute(builder: (context) => StudentDash()));
    //     } else {
    //       // Navigator.push(
    //       //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
    //       // print('not authorize');
    //     }
    //   }
    // }
  }

  signOut(BuildContext context) {
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
