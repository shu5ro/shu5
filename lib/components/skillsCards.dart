import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shgapp/screen/worksDetalePage.dart';
import 'package:url_launcher/url_launcher.dart';

class skillsCards extends StatelessWidget{

  final String skillIcon;
  final String skillText;
  final String skillSubText;

  var textColor = Color(0xFF8A8A8A);
  String oneSkill = '■□□□□';
  String twoSkill = '■■□□□';
  String threeSkill = '■■■□□';
  String fourSkill = '■■■■□';
  String fiveSkill = '■■■■■';
  skillsCards(this.skillIcon, this.skillText, this.skillSubText);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 19.5/9,
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 50,
        margin: EdgeInsets.only(left: 5.0, top: 10.0, right: 5.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.black,
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
                    color: Colors.black,
                    //円にするやつ
                    shape: BoxShape.circle,
                  ),
                padding: EdgeInsets.all(8.0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Icon(
                    //music_アイコン
                    skillIcon == 'M'
                        ?
                    Icons.movie_outlined
                    :
                    //app_アイコン
                    skillIcon == 'A'
                        ?
                    Icons.computer_outlined
                    :
                    //coding_アイコン
                    skillIcon== 'W'
                        ?
                    Icons.language_outlined
                    :
                    //3d_アイコン
                    skillIcon == 'G'
                        ?
                    Icons.view_in_ar_outlined
                    :
                    //design_アイコン
                    skillIcon == 'D'
                        ?
                    Icons.brush_outlined
                    :
                    //cam_アイコン
                    skillIcon == 'C'
                        ?
                    Icons.photo_camera_outlined
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
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //タイトル_テキスト
                    Expanded(
                      flex: 6,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        height: 250,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: SelectableText(
                            skillText,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSansJP',
                              fontWeight: FontWeight.w600,
                              fontSize: 24
                            ),
                          ),
                        ),
                      ),
                    ),
                    //サブ_テキスト
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                        skillSubText == '1'
                              ?
                          oneSkill
                              :
                        skillSubText == '2'
                              ?
                          twoSkill
                              :
                        skillSubText == '3'
                              ?
                          threeSkill
                              :
                        skillSubText == '4'
                              ?
                          fourSkill
                              :
                        skillSubText == '5'
                              ?
                          fiveSkill
                              :
                          skillSubText,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
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