import 'dart:html';
import 'package:flutter/material.dart';
import 'package:shgapp/components/phoneUI.dart';
import 'package:shgapp/components/swipeNavi.dart';
import 'package:shgapp/screen/aboutPage.dart';
import 'package:shgapp/screen/contactPage.dart';
import 'package:shgapp/screen/worksPage.dart';

import '../components/moviePlay.dart';


//ページコントローラー
class HomeController extends StatefulWidget{
  @override
  State<HomeController> createState() => _HomeControllerState();
}
class _HomeControllerState extends State<HomeController> {
  late PageController controller;

  @override
  void initState(){
    controller = PageController();
    super.initState();
  }
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            //ページ管理(スマホ画面) 19.5：9
            Center(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: AspectRatio(
                  aspectRatio: 9/19.5,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: PageView(
                      controller: controller,
                      scrollDirection: Axis.vertical,
                      children:<Widget> [
                        AboutPage(),
                        WorksPage(),
                        ContactPage(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //スワイプ_ナビ
            SwipeNavigation(),
          ]
      ),
    );
  }
}

//aboutページ
class AboutPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9/19.5,
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              //about_画面遷移
              onTap: (){
                Navigator.of(context).push(
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return moviePlayPage('intro-mov',
                            'https://www.youtube-nocookie.com/embed/Na0uhOOLwAg',
                        );
                      },
                      transitionDuration: Duration(milliseconds: 700),
                      transitionsBuilder: (context,animation,secondAnimation, child) {
                        final Offset begin = Offset(1.0, 0.0);
                        final Offset end = Offset.zero;
                        final Animatable<Offset> tween = Tween(
                            begin: begin, end: end)
                            .chain(CurveTween(curve: Curves.ease));
                        final Animation<Offset> offsetAnimation = animation.drive(
                            tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      }
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                    children:<Widget>[
                      //背景img
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          //角丸_
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              image: AssetImage('assets/images/about_animation_3.gif'),
                              fit: BoxFit.fitHeight,
                            )
                        ),
                      ),
                      //背景img_フィルター
                      Center(
                        child: Container(
                          width:  MediaQuery.of(context).size.width,
                          height:  MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            //角丸_
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: LinearGradient(
                              colors: [Colors.white10,Colors.black87],
                              begin: Alignment(0,0.5),
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      //縦動画ui
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          //角丸_
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: phoneUI(
                          //タイトル
                            "about",
                            //短文説明
                            "私について/나에 대해서",
                            //アイコン_テキスト
                            "a"
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
        )
    );
  }
}

//worksページ
class WorksPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          //works_画面遷移
          onTap: (){
            Navigator.of(context).push(
              PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return worksPage();
                  },
                  transitionDuration: Duration(milliseconds: 700),
                  transitionsBuilder: (context,animation,secondAnimation, child) {
                    final Offset begin = Offset(1.0, 0.0);
                    final Offset end = Offset.zero;
                    final Animatable<Offset> tween = Tween(
                        begin: begin, end: end)
                        .chain(CurveTween(curve: Curves.ease));
                    final Animation<Offset> offsetAnimation = animation.drive(
                        tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  }
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
                children:<Widget>[
                  //背景img
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      //角丸_
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/works_animation_3.gif'),
                          fit: BoxFit.fitHeight,
                        )
                    ),
                  ),
                  //背景img_フィルター
                  Center(
                    child: Container(
                      width:  MediaQuery.of(context).size.width,
                      height:  MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        //角丸_
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                            colors: [Colors.white10,Colors.black38],
                            begin: Alignment(0,0.5),
                            end: Alignment.bottomCenter,
                          )
                      ),
                    ),
                  ),
                  //縦動画ui
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      //角丸_
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: phoneUI(
                      //タイトル
                        "works",
                        //短文説明
                        "つくったもの/만든 것",
                        //アイコン_テキスト
                        "w"
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }

}

//contactページ
class ContactPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: GestureDetector(
          //contact_画面遷移
          onTap: (){
            Navigator.of(context).push(
              PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return contactPage();
                  },
                  transitionDuration: Duration(milliseconds: 700),
                  transitionsBuilder: (context,animation,secondAnimation, child) {
                    final Offset begin = Offset(1.0, 0.0);
                    final Offset end = Offset.zero;
                    final Animatable<Offset> tween = Tween(
                        begin: begin, end: end)
                        .chain(CurveTween(curve: Curves.ease));
                    final Animation<Offset> offsetAnimation = animation.drive(
                        tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  }
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
                children:<Widget>[
                  //背景img
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      //角丸_
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/contact_animation_4.gif'),
                          fit: BoxFit.fitHeight,
                        )
                    ),
                  ),
                  //背景img_フィルター
                  Center(
                    child: Container(
                      width:  MediaQuery.of(context).size.width,
                      height:  MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        //角丸_
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                            colors: [Colors.white10,Colors.black38],
                            begin: Alignment(0,0.5),
                            end: Alignment.bottomCenter,
                          )
                      ),
                    ),
                  ),
                  //縦動画ui
                  Container(
                    decoration: BoxDecoration(
                      //角丸_
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    alignment: Alignment.center,
                    child: phoneUI(
                      //タイトル
                        "contact",
                        //短文説明
                        "連絡先/연락처",
                        //アイコン_テキスト
                        "c"
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }

}