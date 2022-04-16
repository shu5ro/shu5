import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shgapp/components/index.dart';
import 'package:shgapp/components/links.dart';


import '../components/contactCards.dart';
import '../components/form.dart';

class contactPage extends StatelessWidget {

  var backColor = Color(0xFFF0F0F0);
  var textColor = Color(0xFF8A8A8A);

  @override
  Widget build(BuildContext context) {
    //フォーム_リンク
    final String source = 'https://docs.google.com/forms/d/e/1FAIpQLSe-u0_l9TJeh7nLtnxdfRkxnJ9vKAjnpwf8s08exzi-xe_QFA/viewform?usp=sf_link';

    return Container(
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

                Expanded(
                    flex: 9,
                    child: Stack(
                      children: [
                        //コンタクト_フォーム
                        Container(
                          alignment: Alignment.center,
                          color: backColor,
                          padding: EdgeInsets.all(0.0),
                          child: formCard('google-form',source),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    )
    );
  }
}