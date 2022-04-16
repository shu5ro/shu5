import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shgapp/screen/worksDetalePage.dart';
import 'package:url_launcher/url_launcher.dart';

class favoriteCards extends StatelessWidget{
  final String favIcon;
  final String titleText;
  final String subText;

  var textColor = Color(0xFF8A8A8A);
  favoriteCards(this.favIcon, this.titleText, this.subText);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 19.5/9,
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(10.0),
            ),
        child: Row(
          children: <Widget>[
            //icon_
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(2.5),
                child: Container(
                  alignment: Alignment.center,
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    //円にするやつ
                    shape: BoxShape.circle,
                    //border: Border.all(color: Colors.white, width: 2,),
                  ),
                  padding: EdgeInsets.all(5.0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Icon(
                    //music_アイコン
                    favIcon == 'M'
                        ?
                    Icons.album_outlined
                    :
                    //NF_アイコン
                    favIcon == 'N'
                        ?
                    Icons.monitor_outlined
                    :
                    //game_アイコン
                    favIcon== 'G'
                        ?
                    Icons.sports_esports_outlined
                    :
                    //その他_アイコン
                    Icons.push_pin_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              ),
            ),
            //コンテンツ_テキスト
            Expanded(
              flex: 2,
              child: Container(
                //color: Colors.green,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(1.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //タイトル_テキスト
                    Expanded(
                      flex: 4,
                      child: Container(
                        //color: Colors.blue,
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: SelectableText(
                              titleText,
                            maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSansJP',
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //サブ_テキスト
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            subText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
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
    );
  }

}