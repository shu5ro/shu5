import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shgapp/screen/pageController.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contactPage.dart';


//導入ページ
class WelcomePage extends StatefulWidget {
  WelcomePage();

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}
class _WelcomePageState extends State<WelcomePage> {
  String urlText = '';
  late var shuWidth = MediaQuery.of(context).size.width*0.3;
  late var shuHeigh = MediaQuery.of(context).size.width*0.3;
  double shuRadius = 35.0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9/19.5,
      child: Scaffold(
        body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //背景_gif
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/star_animation_2.gif'),
            fit: BoxFit.cover,
          )
        ),
        child: AspectRatio(
          aspectRatio: 9/19.5,
          child: Stack(
            children: [
              //スクロール_スマホ枠
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                        //tap_イメージ
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Container(
                            //color: Colors.red,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.only(left: 150, top: 0, right: 0, bottom: 350),
                            child: Opacity(
                              opacity: 0.25,
                            child: Image.asset(
                              'assets/images/tap_img.png',
                            ),
                          ),
                          ),
                        )
                  ],
                ),
              ),
              //バージョン_bottom_テキスト
              Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  '©2022shugo',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'NotoSansJP',
                    fontSize: 16,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              //ファースト_ページ
              AspectRatio(
               aspectRatio: 9/19.5,
               child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //名前_アイコン
                      ElevatedButton(
                        //ページ_遷移
                        onPressed: (){
                          Navigator.of(context).push(
                            PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) {
                                  return HomeController();},
                                transitionDuration: Duration(milliseconds: 700),
                                transitionsBuilder:
                                    (context, animation, secondaryAnimation, child){
                                  return ScaleTransition(
                                    scale: animation.drive(
                                      Tween<double>(
                                          begin: 0.0,
                                          end: 1.0).chain(CurveTween(
                                        curve: Curves.easeInOutQuint,
                                      ),
                                      ),
                                    ),
                                    child: child,
                                  );
                                }
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white.withOpacity(0),
                          shadowColor: Colors.black.withOpacity(0),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              AspectRatio(
                                aspectRatio: 1/1,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  padding: EdgeInsets.all(20),
                                  child: Image.asset('assets/images/name_icon_animation.gif'),
                                ),
                              ),
                              //名前_タイトル
                              AspectRatio(
                                aspectRatio: 1/1,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  child: AspectRatio(
                                    aspectRatio: 4/1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        padding: EdgeInsets.only(left: 2.0,top: 8.0, right: 0.0, bottom: 8.0),
                                        child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: Text(
                                              'shuご.',
                                              style: TextStyle(
                                                fontFamily: 'NotoSansJP',
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                letterSpacing: 2.5,
                                              ),)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //sns_リンク
                      Container(
                        alignment: Alignment.bottomCenter,
                        width: MediaQuery.of(context).size.width*0.5,
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //YT_リンクボタン
                            Expanded(
                              flex: 1,
                              child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: ElevatedButton(
                                          onPressed:(){
                                            urlText = 'https://www.youtube.com/';
                                            _launchInBrowser(urlText);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shape:StadiumBorder(),
                                            side: BorderSide(color: Colors.black, width: 2,)
                                          ),
                                          child: Text(
                                            'YT',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ),
                                ),
                              ),
                            ),
                            //IG_リンクボタン
                            Expanded(
                              flex: 1,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.fitHeight,
                                    child: SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: ElevatedButton(
                                        onPressed:(){
                                          urlText = 'https://www.instagram.com/shu5_003/';
                                          _launchInBrowser(urlText);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shape:StadiumBorder(),
                                            side: BorderSide(color: Colors.black, width: 2,)
                                        ),
                                        child: Text(
                                          'IG',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //more_リンクボタン
                            Expanded(
                              flex: 1,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: ElevatedButton(
                                        onPressed: (){
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
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shape:StadiumBorder(),
                                            side: BorderSide(color: Colors.black, width: 2,)
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.fitHeight,
                                          child: Icon(
                                            Icons.more_horiz_outlined,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    );
  }

  //urlランチャー
  _launchInBrowser(String urlText) async {
    var url = urlText;
    if (await canLaunch(url)){
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw '404';
    }
  }
}