import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../components/bioCard.dart';
import '../components/favoriteCards.dart';
import '../components/index.dart';
import '../components/skillsCards.dart';

class aboutPage extends StatefulWidget {

  @override
  State<aboutPage> createState() => _aboutPageState();
}

class _aboutPageState extends State<aboutPage> with SingleTickerProviderStateMixin{
  var backColor = Color(0xFFF0F0F0);

  var textColor = Color(0xFF8A8A8A);

  //紹介動画_リンク
  final String sourceLink = 'assets/html/view.html';

  //表示_切り替え_
  bool visibleChange = true;

  //アニメーション
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.9), end: Offset(0,0.02))
        .chain(CurveTween(curve: Curves.easeOutExpo))
        .animate(_controller);
  }

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  void _animationChange(){
    if(_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else{
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    //favorite_コンテンツ_リスト
    var favList = [
      //favoriteCards(favIcon, titleText, subText)
      favoriteCards('M','''O.O''','NMIXX'),
      favoriteCards('N','''지금 우리 학교는''','NETFLIX'),
      favoriteCards('G','''e-football''','Steam'),
    ];
    //skill_コンテンツ_リスト
    var slillList = [
      //skillsCards(skillIcon, skillText, skillSubText)
      skillsCards('M', '''AdobeAe''', '3'),
      skillsCards('M', '''AdobePr''', '3'),
      skillsCards('M', '''DavinciResolve''', '2'),
      skillsCards('C', '''Photography''', '3'),
      skillsCards('D', '''PowerPoint''', '5'),
      skillsCards('G', '''Unity''', '2'),
      skillsCards('G', '''UE4''', '1'),
      skillsCards('A', '''Dart/Flutter''', '2'),
      skillsCards('A', '''css''', '1'),
      skillsCards('A', '''JS(pure)''', '1'),
      skillsCards('A', '''C#''', '1'),

    ];

    return  Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          child: AspectRatio(
            aspectRatio: 9/19.5,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
              decoration: BoxDecoration(
                color:backColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: AspectRatio(
                aspectRatio: 9/19.5,
                child: Scaffold(
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
                    color: backColor,
                    alignment: Alignment.center,
                    child: GestureDetector(
                     onPanDown:((details) {
                       _animationChange;
                     }),
                      child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          Column(
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
                                      padding: EdgeInsets.all(0),
                                      //背景_
                                      child: Stack(
                                        children: <Widget>[
                                          //背景_イメージ
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: MediaQuery.of(context).size.height,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/about_img_3.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: BorderRadius.circular(0.0),
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
                                              height: MediaQuery.of(context).size.height*0.25,
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
                                                            // "I'm\nshugo."
                                                            ,
                                                            style: TextStyle(
                                                              color: Colors.white60,
                                                              fontFamily: 'NotoSansJP',
                                                              fontSize: 640,
                                                              fontWeight: FontWeight.w700,
                                                              letterSpacing: 5.0,
                                                              height: 1.2,
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
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //tap_イメージ
                                    Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height,
                                      child: Container(
                                        //color: Colors.red,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(0.0),
                                        padding: EdgeInsets.only(left: 150, top: 325, right: 0, bottom: 0),
                                        child: Opacity(
                                          opacity: 0.5,
                                          child: Image.asset(
                                            'assets/images/tap_img.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    //コンテンツ_
                                    SlideTransition(
                                        position: _slideAnimation,
                                        child:  Container(
                                          alignment: Alignment.bottomCenter,
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height,
                                          margin: EdgeInsets.all(0),
                                          child: Container(
                                              alignment: Alignment.center,
                                              width: MediaQuery.of(context).size.width,
                                              height: MediaQuery.of(context).size.height*0.8,
                                              decoration: BoxDecoration(
                                                  color: backColor,
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0), bottomLeft: Radius.circular(0.0), bottomRight: Radius.circular(0.0)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:  Colors.black26,
                                                      spreadRadius: 1.0,
                                                      blurRadius: 10.0,
                                                      offset: Offset(0, -2.5),
                                                    )
                                                  ]
                                              ),
                                              child: Container(
                                                  child: Column(
                                                    children: <Widget>[
                                                      //
                                                      Container(
                                                        alignment: Alignment.center,
                                                        //color: Colors.red,
                                                        height: MediaQuery.of(context).size.height*0.1,
                                                        child: Column(
                                                          children: <Widget>[
                                                            //表示非表示_ボタン
                                                            Expanded(
                                                              flex: 3,
                                                              child:  SizedBox(
                                                                width: double.infinity,
                                                                child: ElevatedButton(
                                                                    onPressed: _animationChange,
                                                                    style: ElevatedButton.styleFrom(
                                                                      primary: Colors.white.withOpacity(0),
                                                                      shadowColor: Colors.white.withOpacity(0),
                                                                    ),
                                                                    child: FittedBox(
                                                                      fit: BoxFit.fitHeight,
                                                                      child: Icon(
                                                                        Icons.keyboard_arrow_up_outlined,
                                                                        size: 64,
                                                                        color: Colors.black,
                                                                      ),
                                                                    )
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: SingleChildScrollView(
                                                          child: Container(
                                                            alignment: Alignment.bottomCenter,
                                                            width: MediaQuery.of(context).size.width,
                                                            height: MediaQuery.of(context).size.height,
                                                            padding: EdgeInsets.only(top: 0.0),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                              children: <Widget>[
                                                                //fav_skill_リスト
                                                                Expanded(
                                                                    flex: 3,
                                                                    child:  Container(
                                                                      child: Column(
                                                                        children: <Widget>[
                                                                          //テキスト_切り替え_ボタン
                                                                          Expanded(
                                                                            flex: 1,
                                                                            child:Row(
                                                                              children: <Widget>[
                                                                                //タイトル_テキスト_1
                                                                                GestureDetector(
                                                                                  onTap: (){
                                                                                    setState(() {visibleChange =! visibleChange;});
                                                                                  },
                                                                                  child: Container(
                                                                                    alignment: Alignment.bottomLeft,
                                                                                    padding: EdgeInsets.only(left: 15.0),
                                                                                    child: FittedBox(
                                                                                        fit: BoxFit.fitWidth,
                                                                                        child:
                                                                                        //true(選択)の場合
                                                                                        visibleChange == true
                                                                                            ?
                                                                                        Text(
                                                                                          'My Favorite',
                                                                                          style: TextStyle(
                                                                                            color: Colors.deepPurpleAccent.withOpacity(0.8),
                                                                                            fontFamily: 'NotoSansJP',
                                                                                            fontSize: 32,
                                                                                            letterSpacing: 1.5,
                                                                                            fontWeight: FontWeight.w700,
                                                                                          ),
                                                                                        )
                                                                                            :
                                                                                        //false(非選択)の場合
                                                                                        Text(
                                                                                          'My Favorite',
                                                                                          style: TextStyle(
                                                                                            color: Colors.deepPurpleAccent.withOpacity(0.3),
                                                                                            fontFamily: 'NotoSansJP',
                                                                                            fontSize: 24,
                                                                                            letterSpacing: 1.5,
                                                                                            fontWeight: FontWeight.w700,
                                                                                          ),
                                                                                        )
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                //タイトル_テキスト_2
                                                                                GestureDetector(
                                                                                  onTap: (){
                                                                                    setState(() {visibleChange =! visibleChange;});
                                                                                  },
                                                                                  child: Container(
                                                                                    alignment: Alignment.bottomLeft,
                                                                                    padding: EdgeInsets.only(left: 15.0),
                                                                                    child: FittedBox(
                                                                                        fit: BoxFit.fitWidth,
                                                                                        child:
                                                                                        //false(選択された)の場合
                                                                                        visibleChange == false
                                                                                            ?
                                                                                        Text(
                                                                                          'My Skill',
                                                                                          style: TextStyle(
                                                                                            color: Colors.deepPurpleAccent.withOpacity(0.8),
                                                                                            fontFamily: 'NotoSansJP',
                                                                                            fontSize: 32,
                                                                                            letterSpacing: 1.5,
                                                                                            fontWeight: FontWeight.w700,
                                                                                          ),
                                                                                        )
                                                                                            :
                                                                                        //true(非選択)の場合
                                                                                        Text(
                                                                                          'My Skill',
                                                                                          style: TextStyle(
                                                                                            color: Colors.deepPurple.withOpacity(0.3),
                                                                                            fontFamily: 'NotoSansJP',
                                                                                            fontSize: 22,
                                                                                            letterSpacing: 1.5,
                                                                                            fontWeight: FontWeight.w700,
                                                                                          ),
                                                                                        )
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          //skills_コンテンツ
                                                                          Visibility(
                                                                            visible: !visibleChange,
                                                                            child: Expanded(
                                                                              flex: 2,
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
                                                                          ),
                                                                          //favorite_コンテンツ
                                                                          Visibility(
                                                                            visible: visibleChange,
                                                                            child: Expanded(
                                                                              flex: 2,
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )
                                                                ),
                                                                //自己紹介_テキスト
                                                                Expanded(
                                                                    flex: 17,
                                                                    child: Container(
                                                                      margin: EdgeInsets.only(left: 0.0,top: 2.5, right: 0, bottom: 0.0),
                                                                      child: bioCard(),
                                                                    )
                                                                )

                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                              )
                                          ),
                                        )  ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),)
                  ),
                ),
              ),
            )

        )
    );
  }
}