import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shgapp/components/index.dart';
import 'package:shgapp/components/links.dart';


import '../components/contactCards.dart';

class contactPage extends StatelessWidget {

  var backColor = Color(0xFFF0F0F0);
  var textColor = Color(0xFF8A8A8A);

  @override
  Widget build(BuildContext context) {
    var contactList = [
      contactCards('assets/images/about_img_2.png', 'YouTube', 'YouTubeです', 'https://www.youtube.com/'),
      contactCards('assets/images/about_img_2.png', 'Instagram', 'Instagramです', 'https://www.instagram.com/'),
      contactCards('assets/images/about_img_2.png', 'Twitter', 'Twitterです', 'https://twitter.com/shu5_du'),
      //worksCards('mov_i', 'assets/images/works.png', 'タイトル', '概要', 'https://www.youtube.com/watch?v=c9RzZpV460k&list=RDTnzGqfxLSEY&index=8'),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: backColor,
        leading: IconButton(
          onPressed: () { Navigator.pop(context); },
          icon: Icon(Icons.arrow_back_ios_new_outlined), color: Colors.black,),
        title: Text('contact',style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        color: backColor,
        child: Column(
          children: <Widget>[
            //ヘッド_目次
            Expanded(
              flex: 1,
              child: index(),
            ),
            //SNS_リスト
            Expanded(
              flex: 9,
              child: Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: contactList,),
              ),
            ),

          ],
        ),
      ),
    );
  }
}