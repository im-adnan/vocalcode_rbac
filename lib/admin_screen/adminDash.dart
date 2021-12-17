// ignore_for_file: file_names

import 'package:auth/common/studentsList.dart';
import 'package:auth/common/teacherList.dart';
import 'package:flutter/material.dart';

import 'CoursesMaker.dart';
import '../common/ProfileScreen.dart';

class AdminDash extends StatefulWidget {
  @override
  _AdminDashState createState() => _AdminDashState();
}

class _AdminDashState extends State<AdminDash> {
  int currentIndex = 0;
  final screens = [
    // CourseMaker(),
    MyHomePage(),
    StudentsList(),
    TeachersList(),
    // Calendar(),
    // ChatScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_care),
            label: 'Students',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Teachers',
            backgroundColor: Colors.green,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.calendar_today_rounded),
          //   label: 'Schedule',
          //   backgroundColor: Colors.orange,
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'SignOut',
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
