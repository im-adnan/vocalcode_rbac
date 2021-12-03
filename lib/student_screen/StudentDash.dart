// ignore_for_file: file_names

import 'package:auth/profile/page/profile_page.dart';
import 'package:auth/common/PaymentScreen.dart';
import 'package:flutter/material.dart';
import '../event_screen/CalenderScreen.dart';
import 'ChatScreen.dart';
import 'FeedScreen.dart';
import 'HomeScreen.dart';
import '../common/ProfileScreen.dart';

class StudentDash extends StatefulWidget {
  @override
  _StudentDashState createState() => _StudentDashState();
}

class _StudentDashState extends State<StudentDash> {
  int currentIndex = 0;
  final screens = [
    HomeScreen(),
    // PaymentScreen(),
    FeedScreen(),
    CalenderScreen(),
    ChatScreen(),
    // ProfileScreen(),
    ProfilePage(),
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
            icon: Icon(Icons.home),
            label: 'Home',
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
            icon: Icon(Icons.chat),
            label: 'chat',
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
