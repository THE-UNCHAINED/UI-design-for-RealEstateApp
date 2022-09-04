import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uidesign_home/screens/landingScreen.dart';
import 'package:uidesign_home/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "UI DESIGN",
      theme: ThemeData(
          primaryColor: COLOR_WHITE,
          accentColor: COLOR_DARK_BLUE,
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: 'Montserrat'),
      home: LandingScreen(),
    );
  }
}
