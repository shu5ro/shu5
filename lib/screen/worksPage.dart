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
     //my_web_site
     worksCards('web_i',
         //サムネ_イメージ
         'assets/images/works_img/site_.png',
         //タイトル
         '''My Web Site(This Site)''',
         //概要_テキスト
         '''My original WebSite『Shu5.site』.\nI coded in Flutter/Dart language.\n \n#2022April.\n#Flutter #Dart''',
         //リンク
         'null'),
     //ver2.x.x
     worksCards(' ',
         //サムネ_イメージ
         'assets/images/works_img/v2.x.x_.png',
         //タイトル
         '''ver2.x.x''',
         //概要_テキスト
         '''works from High School.\nver2.x.x Philosophy = "社会問題を伝えるとともに自らも解決に向けて動き出す".\nI have worked mainly with organizations.\n 
         \n#2019to2022''',
         //リンク
         'null'),
     //flare_
     worksCards('proj_i',
         //サムネ_イメージ
         'assets/images/works_img/flare_img.png',
         //タイトル
         '''Team Leader Appointment''',
         //概要_テキスト
         '''I first team leader of the new project at the General Incorporated Association SustainableGame.\n \nIn addition to logo/UI design and video production, I organized the team and contributed to winning a student category award in a certain business contest.\n \n#2020.\n''',
         //リンク
         'https://www.sustainablegame.com/?p=1101'),
     //十八
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/eighteen_.png',
         //タイトル
         '''『十八』''',
         //概要_テキスト
         '''Photography Club Theme Shooting Behind.\n \n#2021May.\n#canonEOS kissx7 #AdobeAe #AdobePr #AdobeLr\n \n#iloveyouguys''',
         //リンク
         'https://youtube.com/shorts/ciUfsPMqDXQ?feature=share'),
     //sg_1
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/sg_1.png',
         //タイトル
         '''Organization Introduction Video''',
         //概要_テキスト
         '''General Incorporated Association Sustainable Game introduction movie.\n \n#2020April.\n#AdobeAe #AdobePr''',
         //リンク
         'https://youtu.be/qSl3r9_FZOc'),
     //sg_2
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/sg_2.png',
         //タイトル
         '''Organization Anniversary Video''',
         //概要_テキスト
         '''General Incorporated Association Sustainable Game 2nd anniversary movie.\n \n#2021May.\n#AdobeAe #AdobePr #AdobeRu''',
         //リンク
         'https://youtu.be/uIY2a_1Jo6I'),
     //sdgs_ar
     worksCards('ar_i',
         //サムネ_イメージ
         'assets/images/works_img/sdgs_ar.png',
         //タイトル
         '''SDGs AR Filter''',
         //概要_テキスト
         '''SDGs AR filter for Instagram.\n \n#2020Feb.\n#SparkARStudio''',
         //リンク
         'https://youtube.com/shorts/Pw9g8EEublk?feature=share'),
     //pri_ar
     worksCards('ar_i',
         //サムネ_イメージ
         'assets/images/works_img/pri_ar.png',
         //タイトル
         '''Privacy AR Filter''',
         //概要_テキスト
         '''Privacy AR filter for Instagram.\n \n#2020Feb.\n#SparkARStudio''',
         //リンク
         'https://youtube.com/shorts/_W4TFtn8Xoc?feature=share'),
     //school_fes
     worksCards('proj_i',
         //サムネ_イメージ
         'assets/images/works_img/schoolfes_.gif',
         //タイトル
         '''School Festival Presentation''',
         //概要_テキスト
         '''Proposal for a school festival presentation that emphasizes the COVID-19 countermeasure.(But the school festival was canceled.)\n \n#2021Aug.\n#Unity #PowerPoint''',
         //リンク
         'null'),
     //2020_振り返り
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/2020_rev.png',
         //タイトル
         '''2020 Year in Review Video''',
         //概要_テキスト
         '''Created based on comments solicited on Instagram.\n \n#2020Dec.\n#blender #AdobeAe #AdobePr''',
         //リンク
         'https://youtu.be/vYhCpxM920k'),
     //しんいちろー_タピオカ
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/tapi_1.png',
         //タイトル
         '''Fictitious Product Concept Movie''',
         //概要_テキスト
         '''PR video for a fictitious drink product modeled after my friend.\n \n#2020July\n#blender #AdobeAi #AdobeDn #AdobeAe #AdobePr''',
         //リンク
         'https://youtu.be/5-J2E9JrC5Y'),
     //NiziU_VR
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/niziu_.png',
         //タイトル
         '''NiziU Lab VR Experience Reaction''',
         //概要_テキスト
         '''Reaction video of NiziU in VR.\n \n#2021May\n#AdobeAe #AdobePr''',
         //リンク
         'https://youtube.com/shorts/xoPy0TQgdL0?feature=share'),

     //ver1.x.x
     worksCards(' ',
         //サムネ_イメージ
         'assets/images/works_img/v1.x.x_.png',
         //タイトル
         '''ver1.x.x''',
         //概要_テキスト
         '''Beginning of my project.\nver1.x.x Philosophy = "世界中に感動を届ける".\nPeriods of much stimulation through study abroad.\n 
         \n#2018to2019''',
         //リンク
         'null'),
     //tobitate_houkoku
     worksCards('pri_i',
         //サムネ_イメージ
         'assets/images/works_img/sa_houkoku_.png',
         //タイトル
         '''Presentation of Study Abroad Reports''',
         //概要_テキスト
         '''第5回トビタテ！留学成果報告会優秀賞.\n \n#2020Mar.''',
         //リンク
         'https://tobitate.mext.go.jp/web-debriefing/'),
     //tobitate_4
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/tobitate_4.png',
         //タイトル
         '''トビタテ高校5期 OP movie''',
         //概要_テキスト
         '''This video was aired by the MEXT.\n \n#2019July.\n#DavinchResolve''',
         //リンク
         'https://youtu.be/QvU4trqv9VY'),
     //ミライ研修会
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/mirai_.png',
         //タイトル
         'ミライ研修会OP',
         //概要_テキスト
         '''Opening movie for study abroad event for high school students.\n \n#2020May.\n#AdobeAe #AdobePr''',
         //リンク
         'https://youtu.be/Gi-XUnUY3vo'),
     //tobitate_1
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/tobitate_1.png',
         //タイトル
         '''Documentation of Study Abroad Movie''',
         //概要_テキスト
         '''トビタテ留学JAPAN前半(FLS Summer camp) LIFE.\n \n#2019July.\n#canonEOSkissx7 #GoPro5 #DavinchResolve''',
         //リンク
         'https://youtu.be/u4WdX-DUDrQ'),
     //tobitate_2
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/tobitate_2.png',
         //タイトル
         '''Tobitate Ambassador Activity Video''',
         //概要_テキスト
         '''The video was produced using videos collected from Tobitate students(トビタテ高校5期生) from all over Japan in order to promote Japanese culture to the world.\n \n#2019July.\n#DavinchResolve\n#thankstoalltobitatehighschoolstudentcourse5thterm''',
         //リンク
         'https://youtu.be/36BbzowFjb0'),
     //tobitate_3
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/tobitate_3.png',
         //タイトル
         '''Drone Promotion Movie''',
         //概要_テキスト
         '''Fictitious drone introduction movie.\n \n#2019Sept.\n#Unity #DavinchResolve''',
         //リンク
         'https://youtu.be/bU_72CJsL_w'),
     //vlog_1
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/vlog_1.png',
         //タイトル
         '''My Vlog(1)''',
         //概要_テキスト
         '''Tokyo, Japan Vlog.\n \n#2020January.\n#canonEOSkissx7 #DavinchResolve''',
         //リンク
         'null'),
     //vlog_2
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/vlog_2.png',
         //タイトル
         '''My Vlog(2)''',
         //概要_テキスト
         '''The National Art Center, Tokyo, Japan Vlog.\n \n#2020January.\n#canonEOSkissx7 #DavinchResolve''',
         //リンク
         'null'),
     //zoom_1
     worksCards('mov_i',
         //サムネ_イメージ
         'assets/images/works_img/zoom_1.png',
         //タイトル
         '''How To Use Zoom Guide Movie''',
         //概要_テキスト
         '''Produced at the request of a friend.\n \n#2020April.\n#DavinchResolve''',
         //リンク
         'https://youtu.be/jg8X3q3B5xo'),

   ];
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child:AspectRatio(
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
                          padding: EdgeInsets.only(left: 10),
                          child: GridView.count(
                            crossAxisCount: 1,
                            children: imageList,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ),
      ),
    );

  }
}