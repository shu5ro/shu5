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
      return ElevatedButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => worksDetaile(iconName:firstIcon ,titleText: title, mainImg: frontImg, summaryText: summary, urlText: url),
          ),
        );
      },
        style: ElevatedButton.styleFrom(
          primary: Colors.white.withOpacity(0),
          shadowColor: Colors.black.withOpacity(0),
          shape:StadiumBorder(),
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
        ),
      child: Stack(
        children: [
         Hero(
          tag: '$frontImg+$title',
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 0,top: 5,right: 10,bottom: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: <Widget>[
                  //サムネ_イメージ
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                          //角丸_
                          borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: AssetImage(frontImg),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  //イメージ_カバー
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      //角丸_
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.black12 ,
                    ),
                  ),
                  //テキスト
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      height: 50,
                      padding: EdgeInsets.only(left: 10.0,top: 0.0,right: 2.5,bottom: 5.0),
                      child: Row(
                        children: [
                          //_アイコン
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Container(
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.only(left: 0,top: 0,right: 5,bottom: 5),
                                padding: EdgeInsets.all(2.5),
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
                                //ARの場合
                                firstIcon == 'ar_i'
                                    ? Icon(
                                  Icons.view_in_ar_outlined,
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
                                //賞の場合
                                firstIcon == 'pri_i'
                                    ? Icon(
                                  Icons.star_outlined,
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
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
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