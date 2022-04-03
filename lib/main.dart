import 'package:flutter/material.dart';
import 'package:shgapp/components/swipeNavi.dart';
import 'package:shgapp/components/worksCards.dart';
import 'package:shgapp/screen/aboutPage.dart';
import 'package:shgapp/screen/contactPage.dart';
import 'package:shgapp/screen/pageController.dart';
import 'package:shgapp/screen/worksPage.dart';
import 'screen/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      //home: HomeController(),
      //home: SwipeNavigation(),
      //home: worksPage(),
      //home: aboutPage(),
      //home: contactPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
