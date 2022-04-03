import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shgapp/screen/worksDetalePage.dart';
import 'package:url_launcher/url_launcher.dart';

class bioCard extends StatefulWidget{
  @override
  State<bioCard> createState() => _bioCardState();
}

class _bioCardState extends State<bioCard> {
  String defaultValue = 'English';

  List<String> list =<String>['English','日本語', '한국어'];

  String engText =
      '''03s, studying International Environmental Economics at a university in Japan. 5th term of Tobitate High School, Future Technology Talent Program. I am working to create a society where everyone can feel the fun of living, and is involved in planning videos, applications, games, and other projects. In order to clarify my goal, I am majored in International Environmental Economics at university. Recently, I have dived into the K-pop swamp. Help.''';
  String jpText =
      '''日本の大学で環境経済学を学ぶ03s。トビタテ高校5期未来テクノロジー人材枠。“誰もが生きる『おもしろさ』を感じることができる社会”を目指し、映像・アプリ・ゲームなどの企画に励む。目指すべき社会像を明確にするため、大学では国際環境経済を専攻。最近,K-popの沼にダイブしてしまった。助けて。''';
  String koreText =
      '''일본 대학에서 환경경제학을 배우는 03s. 토비타테 고등학교 5기 미래 테크놀로지 인재 프레임. “모두가 사는 '재미'를 느낄 수 있는 사회'를 목표로 영상·앱·게임 등의 기획에 힘쓰는다. 목표로 하는 사회(목적)를 명확히 하기 위해 대학에서는 국제환경경제를 전공. 최근 K-pop의 늪에 다이브했다. 도와주세요.
''';

  void handleChange(String? newValue) {
    setState(() {
      defaultValue = newValue!;
    });
  }

  var textColor = Color(0xFF8A8A8A);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.35,
      margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0)),
      ),
      //自己紹介_
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //ヘッダー_
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                //タイトル_テキスト
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15.0),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'こんにちは',
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
                //言語選択_ボタン
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(left: 5.0),
                  child: DropdownButton<String>(
                    value: defaultValue,
                    onChanged: handleChange,
                    items: list.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                            value,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NotoSansJP',
                        ),),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          //自己紹介_テキスト
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.25,
              padding: EdgeInsets.only(left: 25.0 ,top: 0.0, right: 25.0, bottom: 5.0),
              child: SingleChildScrollView(
                child: Text(
                  //英語の場合
                defaultValue == 'English'
                    ? engText
                :
                    //日本語の場合
                defaultValue == '日本語'
                    ? jpText
                :
                    //韓国語の場合
                defaultValue == '한국어'
                    ? koreText
                :
                engText,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'NotoSansJP',
                    fontSize: 16,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                    height: 1.8,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}