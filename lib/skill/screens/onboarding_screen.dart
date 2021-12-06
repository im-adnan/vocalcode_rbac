import 'package:auth/common/LoginScreen.dart';
import 'package:auth/skill/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';


class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
            pages: [
              PageViewModel(
                title: 'Welcome to VOCALCODE',
                body: 'We Teach English.',
                image: buildImage('assets/images/ebook.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Welcome to VOCALCODE',
                body: 'We Teach English.',
                image: buildImage('assets/images/libre.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Welcome to VOCALCODE',
                body: 'We Teach English.',
                image: buildImage('assets/images/manthumbs.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Welcome to VOCALCODE',
                body: 'We Teach English.',
                image: buildImage('assets/images/learn.png'),
                decoration: getPageDecoration(),
              ),
            ],
            globalFooter: RoundedButton(
              text: "Continue with Phone",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            showDoneButton: false,
            showSkipButton: false,
            showNextButton: false,
            dotsDecorator: getDotDecoration(),
            onChange: (index) => print('Page $index selected'),
            skipFlex: 0,
            nextFlex: 0),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(6).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(20),
        pageColor: Colors.white,
      );
}
