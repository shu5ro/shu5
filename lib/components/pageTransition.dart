import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class pageTransition extends StatelessWidget{
  final Widget afPage ;
  final String iconText;
  final String title;
  pageTransition(this.afPage, this.iconText, this.title);

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     //画面遷移
     onTap: (){
       Navigator.of(context).push(
         PageRouteBuilder(
             pageBuilder: (context, animation, secondaryAnimation) {
               return afPage;
             },
             transitionDuration: Duration(milliseconds: 700),
             transitionsBuilder: (context,animation,secondAnimation, child) {
               final Offset begin = Offset(1.0, 0.0);
               final Offset end = Offset.zero;
               final Animatable<Offset> tween = Tween(
                   begin: begin, end: end)
                   .chain(CurveTween(curve: Curves.ease));
               final Animation<Offset> offsetAnimation = animation.drive(
                   tween);
               return SlideTransition(
                 position: offsetAnimation,
                 child: child,
               );
             }
         ),
       );
     },
     //アイコン_テキスト
     child: Container(
       width: 80,
       height: 80,
       padding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
       child: Column(
         children: <Widget>[
           //アイコン_
           Expanded(
             flex: 8,
             child: Container(
               alignment: Alignment.center,
               width: 60,
               height: 60,
               decoration: BoxDecoration(
                 //円にするやつ
                 shape: BoxShape.circle,
                 border: Border.all(color: Colors.black, width: 2,),
                 //borderRadius: BorderRadius.circular(15),
               ),
               child: FittedBox(
                 fit: BoxFit.fitHeight,
                 child: Text(
                   iconText,
                   style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.w700,
                   ),
                 ),
               ),
             ),
           ),
           //下_テキスト
           Expanded(
             flex: 2,
             child: Container(
               alignment: Alignment.center,
               //color: Colors.red,
               margin:EdgeInsets.only(left: 0.0, top: 1.5, right: 0.0, bottom: 0.0),
               child:FittedBox(
                 fit: BoxFit.fitHeight,
                 child: Text(
                     title,
                   style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.w600,
                     letterSpacing: 1.5,
                 ),
             ),
               ),
           ),
           )
         ],
       ),
     ),
   );
  }

}