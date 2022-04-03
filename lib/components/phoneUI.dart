import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//phone_ui_まとめ
class phoneUI extends StatelessWidget {
  //タイトル_テキスト
  final String PageTitle;
  //詳細_テキスト
  final String PageDetaile;

  //アイコン_テキスト
  final String PageIconText;
  phoneUI(this.PageTitle, this.PageDetaile, this.PageIconText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: <Widget>[
          Expanded(
            child: phoneTitleUi(PageTitle,PageDetaile),
          ),
          Expanded(
            child: phoneButtonsUi(PageIconText),
          )
        ],
      ),
    );
  }
}


//ui_タイトル
class phoneTitleUi extends StatefulWidget{
  final String title;
  final String detaile;
  //final String moreButton;
  phoneTitleUi(this.title,this.detaile,);

  @override
  State<phoneTitleUi> createState() => _phoneTitleUiState();
}
class _phoneTitleUiState extends State<phoneTitleUi> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

    @override
  Widget build(BuildContext context){
      return Container(
        //color: Colors.green,
        alignment: Alignment.bottomLeft,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 0 ,bottom: 25.0, left: 5.0, right: 5.0),
        margin: EdgeInsets.only(top: 5.0 ,bottom: 25.0, left: 5.0, right: 0.0),
        //タイトル(アイコン)
        child: Container(
          alignment: Alignment.bottomLeft,
          //color: Colors.blue,
          width: MediaQuery.of(context).size.width*0.5,
          height: MediaQuery.of(context).size.height*0.5,
          padding: EdgeInsets.only(top: 0 ,bottom: 5.0, left: 5.0, right: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //タイトル_
              Container(
                //color: Colors.red,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        //color: Colors.green,
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'NotoSansJP',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //詳細_テキスト
              Container(
                //color: Colors.green,
                alignment: Alignment.bottomLeft,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    widget.detaile,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'NotoSansJP',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),),
                ),
              )
            ],
          ),
        ),
      );
    }
}

//ui_ボタン
class phoneButtonsUi extends StatefulWidget{
  final String iconText;
  phoneButtonsUi(this.iconText) ;

  @override
  State<phoneButtonsUi> createState() => _phoneButtonsUiState();
}
class _phoneButtonsUiState extends State<phoneButtonsUi> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..repeat(reverse: true);
  }
  @override
  void dispose()
  {
    _animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    return Container(
      //color: Colors.red,
      alignment: Alignment.bottomRight,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 0 ,bottom: 25.0, left: 5.0, right: 0.0),
      margin: EdgeInsets.only(top: 5.0 ,bottom: 25.0, left: 0.0, right: 5.0),
      child: Container(
        alignment: Alignment.bottomCenter,
        //color: Colors.blue,
        width: MediaQuery.of(context).size.width*0.15,
        height: MediaQuery.of(context).size.height*0.5,
        //アクション_ボタン
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //アイコン_ボタン
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                //color: Colors.green,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                padding: EdgeInsets.only(top: 5.0 ,bottom: 5.0, left: 2.0, right: 2.0),
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Stack(
                      children: <Widget>[
                        //アイコン_アニメーション
                        ScaleTransition(
                          scale: _animationController.drive(
                            Tween<double>(
                              begin: 0.9,
                              end: 1.1,
                            ).chain(
                              CurveTween(
                                curve: Curves.elasticInOut,
                              ),
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child:
                            //アイコン_テキスト
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(bottom: 4.0,),
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
                                child: Text(
                                  widget.iconText,
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'NotoSansJP',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),),
                              ),
                            ),
                          ),
                        ),
                        //＋_ボタン
                        Container(
                          //  color: Colors.black,
                          alignment: Alignment.bottomCenter,
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.only(top: 10),
                          child: Icon(
                            Icons.add_circle_outlined,
                            size: 24,
                            color: Colors.white,
                          ),
                        )
                      ]
                  ),
                ),
              ),
            ),
            //評価_ボタン
            Expanded(
              child: Container(
                alignment: Alignment.center,
                //color: Colors.green,
                width: 100,
                height: 100,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //アイコン_
                    Icon(
                      Icons.favorite_outlined,
                      size: 40,
                      color: Colors.white24,
                    ),
                    //テキスト_
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          'nice',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            color: Colors.white24,
                          ),),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //shareボタン
            Expanded(
              child: Container(
                alignment: Alignment.center,
                //color: Colors.green,
                width: 100,
                height: 100,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //アイコン_
                    Icon(
                      Icons.reply_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                    //テキスト_
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          'share',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //詳細ボタン
            Expanded(
              child: Container(
                alignment: Alignment.center,
                // color: Colors.green,
                width: 100,
                height: 100,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //アイコン_
                    Icon(
                      Icons.more_horiz,
                      size: 40,
                      color: Colors.white,
                    ),
                    //テキスト_
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          'more',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}