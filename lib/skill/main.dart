import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skill/components/constants.dart';
import 'package:skill/screens/home_screen.dart';
import 'package:skill/screens/login_screen.dart';
import 'package:skill/screens/onboarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'VocalCode',
        //home: OnboardingScreen(),
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          fontFamily: GoogleFonts.lato().fontFamily,
          // scaffoldBackgroundColor: Colors.white,
        ),
        routes: {
          "/": (context) => OnBoardingScreen(),
          "/login": (context) => LoginScreen(),
          "/home": (context) => Home(),
        },
      );
}
