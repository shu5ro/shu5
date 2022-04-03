import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//contact_カード
class contactCards extends StatelessWidget {
  final String iconImg;
  final String conTitle;
  final String subTitle;
  late final String urlText;
  contactCards( this.iconImg, this.conTitle, this.subTitle, this.urlText);

  var backColor = Color(0xFFF0F0F0);
  var textColor = Color(0xFF8A8A8A);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        _launchInBrowser(urlText);
      },
      child: Stack(
          children: [
            Container(
              //color: Colors.red,
              width: MediaQuery.of(context).size.width*0.5,
              height: MediaQuery.of(context).size.height*0.5,
              padding: EdgeInsets.all(2.0),
              child: Container(
                //padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: <Widget>[
                    //サムネ_イメージ
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(iconImg),
                    ),
                    //イメージ_カバー
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black12,
                    ),
                    //テキスト
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        //color: Colors.red,
                        alignment: Alignment.bottomLeft,
                        width: MediaQuery.of(context).size.width*0.5,
                        height: MediaQuery.of(context).size.height*0.06,
                        //margin: EdgeInsets.only(left: 10.0, top: 15.0, right: 15.0,bottom: 0.0),
                        padding: EdgeInsets.only(left: 5.0,top: 5.0,right: 5.0,bottom: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //タイトル_テキスト
                            Expanded(
                              flex: 2,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    conTitle,
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontFamily: 'NotoSansJP',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //_説明
                            Expanded(
                              flex: 1,
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    subTitle,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'NotoSansJP',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
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
          ]
      ),
    );
  }
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