import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//詳細ページ
class worksDetaile extends StatelessWidget{
  final String mainImg;
  final String titleText;
  final String summaryText;
  final String urlText;
  late final String iconName;
  worksDetaile({Key? key,@override required this.iconName,required this.titleText, required this.mainImg, required this.summaryText, required this.urlText}) : super(key: key);

  var backColor = Color(0xFFF0F0F0);
  var textColor = Color(0xFF8A8A8A);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
          children: [
            Hero(
              tag: '$mainImg+$titleText',
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    //メイン_画面
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          //_イメージ
                          Expanded(
                            flex: 2,
                            //url
                            child: GestureDetector(
                              onTap: (){
                                _launchInBrowser(urlText);
                              },
                              child: Stack(
                                children: [
                                  //_イメージ
                                  Container(
                                    alignment: Alignment.center,
                                    child: Image.asset(mainImg),
                                  ),
                                  //外部ページ_アイコン
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: Colors.black26,
                                    child:Icon(
                                      Icons.exit_to_app_outlined,
                                      size: 56,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            //タイトル_説明_テキスト
                            flex: 1,
                            child: Container(
                              color: backColor,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.5,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //タイトル_テキスト
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          titleText,
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontFamily: 'NotoSansJP',
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    //説明_テキスト
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          summaryText,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'NotoSansJP',
                                            fontWeight: FontWeight.w500,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //戻るボタン
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.topLeft,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.1,
                        padding: EdgeInsets.all(20.0),
                        child: FittedBox(
                          fit:BoxFit.fitHeight,
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }

  //urlランチャー
  _launchInBrowser(String urlText) async {
    var url = urlText;
    if (await canLaunch(url)){
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw '404';
    }
  }
}