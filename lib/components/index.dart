import 'package:flutter/material.dart';
import 'package:shgapp/components/pageTransition.dart';
import 'package:shgapp/screen/aboutPage.dart';
import 'package:shgapp/screen/intro.dart';
import 'package:shgapp/screen/worksPage.dart';

import '../screen/contactPage.dart';

class index extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return //境界線_
      Container(
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                color: Colors.black45,
                width: 2,
              ),
              bottom: BorderSide(
                color: Colors.black45,
                width: 2,
              )
          ),
        ),
        child: Container(
          //color: Colors.white,
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(left: 0.0, top: 8.0, right: 0.0, bottom: 8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //リンク_マーク
                GestureDetector(
                  //画面遷移
                  onTap: (){
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return WelcomePage();
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
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.symmetric(vertical: 0,horizontal: 5.0),
                    child: Column(
                      children: <Widget>[
                        //アイコン_
                        Expanded(
                          flex: 8,
                          child: Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              //円にするやつ
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black38, width: 2,),
                            ),
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Icon(
                                  Icons.bookmark_outlined,
                                  color: Colors.black38,
                              ),
                            ),
                          ),
                        ),
                        //下_テキスト
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin:EdgeInsets.only(left: 0.0, top: 1.5, right: 0.0, bottom: 0.0),
                            child:FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                'index',
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //aboutページ_リンクボタン
                pageTransition(aboutPage(),'A', 'about'),
                //worksページ_リンクボタン
                pageTransition(worksPage(),'W', 'works'),
                //contactページ_リンクボタン
                pageTransition(contactPage(),'C', 'contact'),
              ],
            ),
          ),
        ),
      );
  }

}