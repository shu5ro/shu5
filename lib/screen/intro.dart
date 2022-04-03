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
    return Scaffold(
      body: Stack(
        children: [
          //背景_gif
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/star_animation.gif'),
                  fit: BoxFit.cover,
                )
            ),
          ),
          //スクロール_スマホ枠
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //ブランク_
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                //スマホ_枠_tap_イメージ
                Stack(
                  children: [
                    //スマホ_枠_イメージ
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.only(left: 0.0, top: 15.0, right: 15.0, bottom: 0.0),
                      child: Image.asset('assets/images/phone_2.png',),
                    ),
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
                        child: Image.asset(
                          'assets/images/tap_img.png',
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          //ファースト_ページ
          Container(
            //color: Colors.green,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //名前_アイコン
                GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return HomeController();
                  }));
                },
                  child: Container(
                    //color: Colors.yellow,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1/1,
                          child: Container(
                            //color: Colors.blue,
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
                            //color: Colors.green,
                            alignment: Alignment.bottomCenter,
                            child: AspectRatio(
                              aspectRatio: 4/1,
                              child: Container(
                                alignment: Alignment.center,
                                //color: Colors.red,
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
                  //color: Colors.orange,
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
                        child: GestureDetector(
                          onTap:(){
                            urlText = 'https://www.youtube.com/';
                            _launchInBrowser(urlText);
                          },
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                              alignment: Alignment.center,
                              width: 60,
                              height: 60,
                              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                //円にするやつ
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 2,),
                                //borderRadius: BorderRadius.circular(15),
                              ),
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
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
                      //IG_リンクボタン
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap:(){
                            urlText = 'https://www.youtube.com/';
                            _launchInBrowser(urlText);
                          },
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                              alignment: Alignment.center,
                              width: 60,
                              height: 60,
                              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                //円にするやつ
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 2,),
                                //borderRadius: BorderRadius.circular(15),
                              ),
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
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
                      //more_リンクボタン
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap:(){
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
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                              alignment: Alignment.center,
                              width: 60,
                              height: 60,
                              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                //円にするやつ
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 2,),
                                //borderRadius: BorderRadius.circular(15),
                              ),
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
                                child: Icon(
                                  Icons.more_horiz_outlined,
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
        ],
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