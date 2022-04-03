import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shgapp/screen/worksDetalePage.dart';
import 'package:url_launcher/url_launcher.dart';

//works_カード
class worksCards extends StatelessWidget {
  final String frontImg;
  final String title;
  final String summary;
  final String url;
  final String firstIcon;
  worksCards(this.firstIcon, this.frontImg, this.title, this.summary, this.url);

  var backColor = Color(0xFFF0F0F0);
  var textColor = Color(0xFF8A8A8A);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => worksDetaile(iconName:firstIcon ,titleText: title, mainImg: frontImg, summaryText: summary, urlText: url),
          ),
        );

      },
      child: Stack(
        children: [
         Hero(
          tag: '$frontImg+$title',
          child: Container(
            //color: Colors.red,
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.5,
            padding: EdgeInsets.all(2.0),
            child: Container(
              //padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: <Widget>[
                  //サムネ_イメージ
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(frontImg),
                  ),
                  //イメージ_カバー
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black12,
                  ),
                  //テキスト
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Container(
                        //color: Colors.red,
                        alignment: Alignment.bottomLeft,
                        height: 50,
                        //margin: EdgeInsets.only(left: 10.0, top: 15.0, right: 15.0,bottom: 0.0),
                        padding: EdgeInsets.only(left: 10.0,top: 15.0,right: 15.0,bottom: 5.0),
                        child: Row(
                          children: [
                            //_アイコン
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left: 5,top: 2,right: 5,bottom: 0),
                              child: //動画の場合
                              firstIcon == 'mov_i'
                                  ? Icon(
                                Icons.live_tv_outlined,
                                size: 24,
                                color: Colors.white,
                              ) :
                              //アプリの場合
                              firstIcon == 'app_i'
                                  ? Icon(
                                Icons.phone_iphone_outlined,
                                size: 24,
                                color: Colors.white,
                              ) :
                              //webアプリ・サイトの場合
                              firstIcon == 'web_i'
                                  ? Icon(
                                Icons.language_outlined,
                                size: 24,
                                color: Colors.white,
                              ) :
                              //ゲームの場合
                              firstIcon == 'game_i'
                                  ? Icon(
                                Icons.sports_esports_outlined,
                                size: 24,
                                color: Colors.white,
                              ) :
                              //プロジェクトの場合
                              firstIcon == 'proj_i'
                                  ? Icon(
                                Icons.insert_invitation_outlined,
                                size: 24,
                                color: Colors.white,
                              ) :
                              //その他の場合
                              firstIcon == 'oth_i'
                                  ? Icon(
                                Icons.category_outlined,
                                size: 24,
                                color: Colors.white,
                              ) :
                              //エラー場合
                              Icon(
                                Icons.circle_outlined,
                                size: 24,
                                color: Colors.white,),
                            ),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: 'NotoSansJP',
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]
      ),
    );
  }

}