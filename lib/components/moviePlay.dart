import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:shgapp/screen/aboutPage.dart';

class moviePlayPage extends StatefulWidget {
  final String viewType;
  final String mediaSource;
  moviePlayPage(this.viewType ,this.mediaSource);

  @override
  State<moviePlayPage> createState() => _moviePlayPageState();
}

class _moviePlayPageState extends State<moviePlayPage> {
  @override
  Widget build(BuildContext context) {

    ui.platformViewRegistry.registerViewFactory(
        widget.viewType,
            (int id) => html.IFrameElement()
          ..width = MediaQuery.of(context).size.width.toString()
          ..height = MediaQuery.of(context).size.width.toString()
          ..style.width = '100%'
          ..style.height = '100%'

          ..src =widget.mediaSource
          ..style.border = 'none'
    );

    return AspectRatio(
      aspectRatio: 9/19.5,
      child: Container(
        alignment: Alignment.center,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  //背景_
                  image: DecorationImage(
                    image: AssetImage('assets/images/star_animation_2.gif'),
                    fit: BoxFit.cover,
                  )
                ),
                //背景_カバー
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black26,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  //紹介動画_埋め込み
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.8,
                    child: HtmlElementView(
                      viewType: widget.viewType,
                    ),
                  ),
                ),
              ),
              //戻る_ボタン
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(10.0),
                child: IconButton(
                  onPressed: () { Navigator.pop(context); },
                  icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white24,
                      size: 32,
                  ),
                   ),
              ),
              //閉じる_ボタン
              Container(
                alignment: Alignment.topRight,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(10.0),
                //color: Colors.red,
                child: IconButton(
                  //ページ遷移_
                  onPressed: (){
                    Navigator.of(context).push(
                        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation){
                          return aboutPage();
                        },
                            transitionDuration: Duration(milliseconds: 500),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              final double begin = 0.0;
                              final double end = 1.0;
                              final Animatable<double> tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
                              final Animation<double> doubleAnimation = animation.drive(tween);
                              return FadeTransition(
                                opacity: doubleAnimation,
                                child: child,
                              );
                            })
                    );
                  },
                  icon: Icon(
                    Icons.close_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}