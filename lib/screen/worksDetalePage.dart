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

    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: AspectRatio(
        aspectRatio: 9/19.5,
        child: Scaffold(
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
                              //イメージ_外部リンク
                              Expanded(
                                flex: 2,
                                //url
                                child: ElevatedButton(
                                  onPressed: (){
                                    _launchInBrowser(urlText);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black26,
                                    shadowColor: Colors.black.withOpacity(0),
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Stack(
                                    children: [
                                      //_イメージ
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(mainImg),
                                            fit: BoxFit.cover
                                          )
                                        ),
                                      ),
                                      //外部ページ_アイコン
                                      Column(
                                        children: [
                                          //アイコン_
                                          Expanded(
                                            child:Container(
                                              alignment: Alignment.bottomCenter,
                                              width: double.infinity,
                                              height: double.infinity,
                                              color: Colors.black26,
                                              child:Icon(
                                                Icons.exit_to_app_outlined,
                                                size: 56,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ),

                                          //テキスト_
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.topCenter,
                                              width: double.infinity,
                                              height: double.infinity,
                                                color: Colors.black26,
                                              child:Text(
                                                'Open external link',
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                ),
                                              )
                                          ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                //タイトル_説明_テキスト
                                flex: 1,
                                child: Container(
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
                                                fontSize: 28,
                                                fontFamily: 'NotoSansJP',
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.5,
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
                                                letterSpacing: 1.5,
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
                       ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                         style: ElevatedButton.styleFrom(
                           primary: Colors.white.withOpacity(0),
                           shadowColor: Colors.black.withOpacity(0),
                           shape:StadiumBorder(),
                         ),
                          child: Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 60,
                            padding: EdgeInsets.all(10.0),
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
        ),
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