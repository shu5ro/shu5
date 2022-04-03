import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shgapp/components/worksCards.dart';
import '../components/index.dart';

class worksPage extends StatelessWidget {

  var backColor = Color(0xFFF0F0F0);
  var textColor = Color(0xFF8A8A8A);

  @override
  Widget build(BuildContext context) {
    //works_コンテンツ_リスト
   var imageList = [
     //worksCards(firstIcon, frontImg, title, summary, url),
     worksCards('mov_i', 'assets/images/works.png', 'タイトル', '概要', 'https://www.youtube.com/watch?v=c9RzZpV460k&list=RDTnzGqfxLSEY&index=8'),
     worksCards('mov_i', 'assets/images/works.png', 'テキスト', '概要', 'https://www.youtube.com/watch?v=c9RzZpV460k&list=RDTnzGqfxLSEY&index=8'),

     ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: backColor,
        leading: IconButton(
                  onPressed: () { Navigator.pop(context); },
                  icon: Icon(Icons.arrow_back_ios_new_outlined), color: Colors.black,),
        title: Text('works',style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        color: backColor,
        child: Column(
          children: [
            //ヘッド_リンク
            Expanded(
              flex: 1,
              child:
             index(),
            ),
            //コンテンツ一覧
            Expanded(
              flex: 9,
              child: Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: imageList,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}