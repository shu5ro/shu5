import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class formCard extends StatelessWidget {
  final String viewType;
  final String mediaSource;
  formCard(this.viewType ,this.mediaSource);

  @override
  Widget build(BuildContext context) {

    ui.platformViewRegistry.registerViewFactory(
      viewType,
        (int id) => html.IFrameElement()
         ..width = MediaQuery.of(context).size.width.toString()
         ..height = MediaQuery.of(context).size.width.toString()
          ..style.width = '100%'
          ..style.height = '100%'

          ..src =mediaSource
          ..style.border = 'none'
    );

    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: HtmlElementView(
        viewType: viewType,
      ),
    );
  }

}