import 'dart:html';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class SwipeNavigation extends StatefulWidget{
  @override
  State<SwipeNavigation> createState() => _SwipeNavigationState();
}

class _SwipeNavigationState extends State<SwipeNavigation> with SingleTickerProviderStateMixin{

  //スワイプナビ表示
  bool isVisible = true;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override

  void initState(){
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.2), end: Offset(0, -0.8))
    .chain(CurveTween(curve: Curves.easeInOut))
    .animate(_animationController);
      _animationController.repeat(reverse: true);
  }

      @override
      void dispose()
      {
        _animationController.dispose();
        super.dispose();
      }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: GestureDetector(
        onTap: (){
          setState((){
            isVisible = !isVisible;
          });
        },
        onPanDown: (details){
          setState((){
            isVisible = !isVisible;
          });
        },
        child: Stack(
          children: <Widget>[
            //背景_カバー
            Opacity(
              opacity: 0.5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
              ),
            ),
          //スワイプ_ナビ
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //スワイプ_アニメーション
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  margin: EdgeInsets.only(bottom: 0.0,left: 0.0),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Icon(
                          Icons.swipe_up_outlined,
                          size: 96,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                //スワイプ_テキスト
                Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: 50,
                  padding: EdgeInsets.all(15.0),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Swipe to switch',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'NotoSansJP',
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ]
        ),
      ),
    );
  }
}