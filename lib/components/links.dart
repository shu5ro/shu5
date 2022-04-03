import 'package:flutter/material.dart';
import 'package:shgapp/screen/intro.dart';
import 'package:shgapp/screen/pageController.dart';
import 'package:url_launcher/url_launcher.dart';

class links extends StatelessWidget{
  String urlText = '';

  @override
  Widget build(BuildContext context) {
   return //境界線_
     Container(
       decoration: BoxDecoration(
         border: Border(
             top: BorderSide(
               color: Colors.black,
               width: 1.5,
             ),
             bottom: BorderSide(
               color: Colors.black,
               width: 1.5,
             )
         ),
       ),
       child: Container(
         //color: Colors.white,
         alignment: Alignment.center,
         width: double.infinity,
         height: double.infinity,
         padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             //リンク_マーク
             Expanded(
               child: Container(
                 alignment: Alignment.center,
                 width: 60,
                 height: 60,
                 margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                 decoration: BoxDecoration(
                   //円にするやつ
                   shape: BoxShape.circle,
                   border: Border.all(color: Colors.black12, width: 2,),
                   //borderRadius: BorderRadius.circular(15),
                 ),
                 child: FittedBox(
                   fit: BoxFit.fitHeight,
                   child: Icon(
                       Icons.link_outlined,
                       color: Colors.black12
                   ),
                 ),
               ),
             ),
             //YT_リンクボタン
             Expanded(
               child: GestureDetector(
                 onTap:(){
                   urlText = 'https://www.youtube.com/';
                   _launchInBrowser(urlText);
                 },
                 child: Container(
                   alignment: Alignment.center,
                   width: 60,
                   height: 60,
                   margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                   decoration: BoxDecoration(
                     //円にするやつ
                     shape: BoxShape.circle,
                     border: Border.all(color: Colors.black, width: 2,),
                     //borderRadius: BorderRadius.circular(15),
                   ),
                   child: FittedBox(
                     fit: BoxFit.fitHeight,
                     child: Text(
                       'YT',
                       style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                 ),
               ),
             ),
             //IG_リンクボタン
             Expanded(
               child: GestureDetector(
                 onTap:(){
                   urlText = 'https://www.instagram.com/';
                   _launchInBrowser(urlText);
                 },
                 child: Container(
                   alignment: Alignment.center,
                   width: 60,
                   height: 60,
                   margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                   decoration: BoxDecoration(
                     //color: Colors.white,
                     //円にするやつ
                     shape: BoxShape.circle,
                     border: Border.all(color: Colors.black, width: 2,),
                     //borderRadius: BorderRadius.circular(15),

                     // gradient: LinearGradient(
                     //   colors: [Color(0xFF8C1BAB),Color(0xFFDDFFAA00)],
                     //   begin: Alignment.topRight,
                     //   end: Alignment.bottomLeft,
                     // )
                   ),
                   child: FittedBox(
                     fit: BoxFit.fitHeight,
                     child: Text(
                       'IG',
                       style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                 ),
               ),
             ),
             //TW_リンクボタン
             Expanded(
               child: GestureDetector(
                 onTap:(){
                   urlText = 'https://twitter.com/shu5_du';
                   _launchInBrowser(urlText);
                 },
                 child: Container(
                   alignment: Alignment.center,
                   width: 60,
                   height: 60,
                   margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                   decoration: BoxDecoration(
                     //color: Colors.white,
                     //円にするやつ
                     shape: BoxShape.circle,
                     border: Border.all(color: Colors.black, width: 2,),
                     //borderRadius: BorderRadius.circular(15),

                     // gradient: LinearGradient(
                     //   colors: [Color(0xFF8C1BAB),Color(0xFFDDFFAA00)],
                     //   begin: Alignment.topRight,
                     //   end: Alignment.bottomLeft,
                     // )
                   ),
                   child: FittedBox(
                     fit: BoxFit.fitHeight,
                     child: Text(
                       'TW',
                       style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                 ),
               ),
             ),
             //Mail_リンクボタン
             Expanded(
               child: GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_){
                     return HomeController();
                   }));
                 },
                 child: Container(
                   alignment: Alignment.center,
                   width: 60,
                   height: 60,
                   margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                   decoration: BoxDecoration(
                     //color: Colors.white,
                     //円にするやつ
                     shape: BoxShape.circle,
                     border: Border.all(color: Colors.black, width: 2,),
                     //borderRadius: BorderRadius.circular(15),

                     // gradient: LinearGradient(
                     //   colors: [Color(0xFF8C1BAB),Color(0xFFDDFFAA00)],
                     //   begin: Alignment.topRight,
                     //   end: Alignment.bottomLeft,
                     // )
                   ),
                   child: FittedBox(
                     fit: BoxFit.fitHeight,
                     child: Icon(
                       Icons.email_outlined,
                     ),
                   ),
                 ),
               ),
             ),
           ],
         ),
       ),
     );
  }

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