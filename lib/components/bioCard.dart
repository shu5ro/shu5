import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bioCard extends StatefulWidget{
  @override
  State<bioCard> createState() => _bioCardState();
}

class _bioCardState extends State<bioCard> {
  String defaultValue = '日本語';

  List<String> list =<String>['日本語','English', '한국어'];

  String engText =
      '''03s, studying economics at a Japanese university. 5th term of the Tobitate High School Student Course, Future Technology Talent Program. I am created videos, apps, and games with the aim of creating “A society where everyone can feel the ‘FUN' of life. Majored in economics at university in order to clarify the society (purpose) I should aim for. My best tool is PowerPoint. Recently, I have been diving into the K-pop swamp. Help.''';
  String jpText =
      '''日本の大学で経済学を学ぶ03s。トビタテ高校5期未来テクノロジー人材枠。 “誰もが生きる『おもしろさ』を感じることができる社会”を目指し、映像・アプリ・ゲームなどを制作。目指すべき社会(目的)を明確にするため、大学では経済学を専攻。エンターテイメント×社会問題解決でソリューションを模索中(ざっくり表現すると)。一番得意なツールはパワポ。最近、K-popの沼にダイブしてしまった。助けて。''';
  String koreText =
      '''일본 대학에서 경제학을 배우는 03s. 토비타테 고등학교 5기 미래 테크놀로지 인재 프레임. “모두가 사는 “재미”를 느낄 수 있는 사회”를 목표로, 영상·어플리·게임 등을 제작. 목표로 하는 사회(목적)를 명확히 하기 위해 대학에서는 경제학을 전공. 제일 특기인 툴은 파와포. 최근 K-pop의 늪에 다이빙했다. 도와주세요.''';

  void handleChange(String? newValue) {
    setState(() {
      defaultValue = newValue!;
    });
  }

  var textColor = Color(0xFF8A8A8A);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(left: 15.0, top: 2.5, right: 0.0, bottom: 0.0),
      //自己紹介_
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //タイトル_テキスト_ボタン
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                //タイトル_テキスト
                Expanded(
                  flex:2,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Who is Shugo!?',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'NotoSansJP',
                            fontSize: 32,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),),
                //言語選択_ボタン
                Expanded(
                  flex: 1,
                  child: Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(top: 10.0, left: 15.0),
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
                ),)
              ],
            ),
          ),
          //自己紹介_テキスト
           Expanded(
                flex: 14,
                child: Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.25,
                  padding: EdgeInsets.only(left: 0.0 ,top: 10.0, right: 15.0, bottom: 5.0),
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
                      fontSize: 18,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w500,
                      height: 1.8,
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}