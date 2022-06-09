import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shgapp/screen/aboutPage.dart';
import 'package:shgapp/screen/screenNoticePage.dart';


void main() {
  runApp(const MyApp());
}

//白_カラー
final MaterialColor materialWhite = const MaterialColor(
  0xFFF0F0F0,
  const <int, Color>{
    50: const Color(0xFFF0F0F0),
    100: const Color(0xFFF0F0F0),
    200: const Color(0xFFF0F0F0),
    300: const Color(0xFFF0F0F0),
    400: const Color(0xFFF0F0F0),
    500: const Color(0xFFF0F0F0),
    600: const Color(0xFFF0F0F0),
    700: const Color(0xFFF0F0F0),
    800: const Color(0xFFF0F0F0),
    900: const Color(0xFFF0F0F0),
  },
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shuご.',
      theme: ThemeData(
        primarySwatch: materialWhite,
        fontFamily: 'NotoSansJP',
      ),
      home: screenNoticePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
