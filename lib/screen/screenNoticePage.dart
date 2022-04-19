import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shgapp/screen/intro.dart';

class screenNoticePage extends StatelessWidget{
  var backColor = Color(0xFFF0F0F0);
  var textColor = Color(0xFF8A8A8A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: backColor,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //スマホ_回転_アニメーション
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(15),
                  child: Image.asset('assets/images/rotation_phone_notion_2.gif'),
                ),
              ),
              //お知らせ_テキスト
              Expanded(
                flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //テキスト_1
                      Container(
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '''Please enjoy it in portrait mode.''',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'NotoSansJP',
                              fontSize: 24,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      //テキスト_2
                      Container(
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '''※Smartphone recommended.''',
                            style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'NotoSansJP',
                              fontSize: 18,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
              ),
              //OKボタン
              Expanded(
                flex: 1,
                  child:Container(
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.height*0.3,
                    child: AspectRatio(
                      aspectRatio: 2/1,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(
                              PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation){
                                return WelcomePage();
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
                        }, child: Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NotoSansJP',
                          fontSize: 16,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape:StadiumBorder(),
                        ),
                      ),
                    ),
                  ),
              )
            ],
          ),
        )
    ) ;

  }

}