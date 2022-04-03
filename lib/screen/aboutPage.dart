import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../components/bioCard.dart';
import '../components/favoriteCards.dart';
import '../components/index.dart';
import '../components/skillsCards.dart';

class aboutPage extends StatelessWidget {

  var backColor = Color(0xFFF0F0F0);
  var textColor = Color(0xFF8A8A8A);
  @override
  Widget build(BuildContext context) {
    //favorite_コンテンツ_リスト
    var favList = [
      //favoriteCards(favIcon, titleText, subText)
      favoriteCards('P','''Favorite''','List'),
      favoriteCards('M','''O.O''','NMIXX'),
      favoriteCards('N','''지금 우리 학교는''','NETFLIX'),
      favoriteCards('G','''BIOHAZARD4''','MetaQuest2'),
    ];
    //skill_コンテンツ_リスト
    var slillList = [
      //skillsCards(skillIcon, skillText, skillSubText)
      skillsCards(' ', 'Skills', 'List'),
      skillsCards('D', 'PowerPoint', '5'),
      skillsCards('M', 'AdobeAe', '3'),
      skillsCards('M', 'AdobePr', '3'),
      skillsCards('M', 'DavinciResolve', '2'),
      skillsCards('G', 'Unity', '2'),
      skillsCards('G', 'UE4', '1'),
      skillsCards('A', 'Dart/Flutter', '3'),
      skillsCards('A', 'css', '2'),
      skillsCards('A', 'JS(pure)', '1'),
      skillsCards('A', 'C#', '1'),

    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: backColor,
        leading: IconButton(
          onPressed: () { Navigator.pop(context); },
          icon: Icon(Icons.arrow_back_ios_new_outlined), color: Colors.black,),
        title: Text('about',style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        //color: Colors.blue,
         color: backColor,
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              //ヘッド_リンク
              Expanded(
                flex: 1,
                child:
                index(),
              ),
              Expanded(
                flex: 9,
                child: Stack(
                  children: <Widget>[
                    //背景_イメージ_テキスト
                    Container(
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.all(25),
                      child: Stack(
                        children: <Widget>[
                          //背景_イメージ
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/about_img_2.png'),
                                  fit: BoxFit.cover,
                                ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          //名前_テキスト
                          Container(
                            alignment: Alignment.topCenter,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.3,
                              padding: EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  //名前_テキスト
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height,
                                      child: FittedBox(
                                        fit:BoxFit.fitHeight,
                                          child: Text(
                                            'shugo\nです。'
                                            ,
                                            style: TextStyle(
                                              color: Colors.white30,
                                              fontFamily: 'NotoSansJP',
                                              fontSize: 640,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 5.0,
                                              height: 1.1,
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //背景img_フィルター
                          Center(
                            child: Container(
                              width:  MediaQuery.of(context).size.width,
                              height:  MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.white10,backColor],
                                    begin: Alignment(0,0.3),
                                    end: Alignment.bottomCenter,
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //コンテンツ_
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            //skills_コンテンツ
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  itemCount: slillList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index){
                                      return slillList[index];
                                    },
                                ),
                              ),
                            ),
                            //favorite_コンテンツ
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                    itemCount: favList.length,
                                    scrollDirection: Axis.horizontal,
                                      itemBuilder:  (context, index) {
                                        return favList[index];
                                      }),
                                ),
                            ),
                            //自己紹介_テキスト
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 0,horizontal: 25),
                                child: bioCard(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}