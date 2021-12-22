// ignore_for_file: file_names

import 'package:auth/common/studentsList.dart';
import 'package:auth/profile/page/profile_page.dart';
import 'package:flutter/material.dart';
import '../event_screen/CalenderScreen.dart';
import 'CallScreen.dart';
import 'FeedScreen.dart';
import 'HomeScreen.dart';
import '../common/ProfileScreen.dart';

class TeacherDash extends StatefulWidget {
  @override
  _TeacherDashState createState() => _TeacherDashState();
}

class _TeacherDashState extends State<TeacherDash> {
  int currentIndex = 0;
  final screens = [
    const StudentsList(),
    FeedScreen(),
    CalenderScreen(),
    CallScreen(),
    ProfileScreen(),
    // ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.blueAccent,
        // selectedItemColor: Colors.white,
        // unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.child_care),
            label: 'Students',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert_sharp),
            label: 'Feed',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: 'Schedule',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_made),
            label: 'Call',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
            backgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
